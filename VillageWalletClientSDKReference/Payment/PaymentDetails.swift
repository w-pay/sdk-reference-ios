import UIKit
import VillageWalletSDK
import WPayFramesSDK
import DLRadioButton

let CARD_CAPTURE_DOM_ID = "cardCaptureGroup"
let CARD_NO_DOM_ID = "cardNoElement"
let CARD_EXPIRY_DOM_ID = "cardExpiryElement"
let CARD_CVV_DOM_ID = "cardCvvElement"
let VALIDATE_CARD_DOM_ID = "validateCardElement"

let HTML = """
<html>
 <body>
   <div id="\(CARD_CAPTURE_DOM_ID)">
     <div id="\(CARD_NO_DOM_ID)"></div>
     <div>
       <div id="\(CARD_EXPIRY_DOM_ID)" style="display: inline-block; width: 50%"></div>
       <div id="\(CARD_CVV_DOM_ID)" style="display: inline-block; width: 40%; float: right;"></div>
     </div>
   </div>
   <div id="\(VALIDATE_CARD_DOM_ID)" style="display: none;"></div>
 </body>
</html>
"""

class PaymentDetails: UIViewController, UITableViewDataSource, FramesViewCallback {
	@IBOutlet weak var framesMessage: UILabel!
	@IBOutlet weak var framesHost: FramesView!
	@IBOutlet weak var existingCards: UITableView!
	@IBOutlet weak var useExistingCard: DLRadioButton!
	@IBOutlet weak var payNow: UIButton!
    
	private let appDelegate = UIApplication.shared.delegate as! AppDelegate

	private var paymentOption: PaymentOptions = .noOption
	private var paymentOutcome: PaymentOutcomes = .noOutcome

	/*
	 * Because the Frames SDK only emits validation changes we need to record them.
	 */
	private var cardNumberValid: Bool = false
	private var cardExpiryValid: Bool = false
	private var cardCvvValid: Bool = false

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		appDelegate.paymentInstruments?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExistingCardCell", for: indexPath) as? ExistingCardCell else {
			fatalError("The dequeued cell is not an instance of ExistingCardCell.")
		}

		let cardForRow = appDelegate.paymentInstruments![indexPath.row]

		cell.controller = self
		cell.selectCard.setTitle(
			"\(cardForRow.scheme) XXXX-\(cardForRow.cardSuffix) - \(cardForRow.expiryMonth)/\(cardForRow.expiryYear)",
			for: .normal
		)

		return cell
	}

	func onComplete(response: String) {
		debug(message: "onComplete(response: \(response))")
	}

	func onError(error: FramesErrors) {
		debug(message: "onError(error: \(error))")

		switch error {
			case .FATAL_ERROR(let message): framesMessage.text = message
			case .NETWORK_ERROR(let message): framesMessage.text = message
			case .TIMEOUT_ERROR(let message): framesMessage.text = message
			case .FORM_ERROR(let message): framesMessage.text = message
			case .EVAL_ERROR(let message): framesMessage.text = message
			case .DECODE_JSON_ERROR(let message, _, _): framesMessage.text = message
			case .ENCODE_JSON_ERROR(let message, _, _): framesMessage.text = message
			case .SDK_INIT_ERROR(let message, _): framesMessage.text = message
		}
	}

	func onProgressChanged(progress: Int) {
		debug(message: "onProgressChanged(progress: \(progress))")
	}

	func onValidationChange(domId: String, isValid: Bool) {
		debug(message: "onValidationChange(\(domId), isValid: \(isValid)")
	}

	func onFocusChange(domId: String, isFocussed: Bool) {
		debug(message: "onFocusChange(\(domId), isFocussed: \(isFocussed))")
	}

	func onPageLoaded() {
		debug(message: "onPageLoaded()")

		do {
			try Commands.cardCaptureCommand(
				options: CardCaptureOptions(
					wallet: appDelegate.customerWallet,
					require3DS: appDelegate.require3DSNPA
				)
			).post(view: framesHost)
		}
		catch {
			fatalError("Can't post card capture command")
		}
	}

	func onRendered(id: String) {
		debug(message: "onRendered(\(id)")
	}

	func onRemoved(id: String) {
		debug(message: "onRemoved(\(id)")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		configureCardsList()
		configureFramesHost()
		checkPaymentPossible()
	}

	@IBAction func selectNewCardPaymentOption() {
		changePaymentOption(option: .newCard(valid: newCardValid()))
	}

	@IBAction func selectExistingCardPaymentOption() {
		guard let index = existingCards.indexPathForSelectedRow else {
			return
		}

		guard let card = appDelegate.paymentInstruments?[index.row] else {
			fatalError("No card for index")
		}

		changePaymentOption(option: .existingCard(card: card))
	}

	@IBAction func makePayment(_ sender: Any) {
		switch (paymentOption) {
			case .newCard:
				completeCapturingCard()

			case .existingCard(let card):
				payWithCard(card: card)

			default:
				fatalError("Can't pay with nothing")
		}

		payNow.isEnabled = false
	}

	internal func deleteCardFromCell(cell: ExistingCardCell) {
		let index = existingCards.indexPath(for: cell)!.row
		let card = appDelegate.paymentInstruments![index]

		appDelegate.customerSDK?.instruments.delete(
			instrument: card.paymentInstrumentId,
			completion: { _ in
				self.reloadPaymentInstruments()
			}
		)
	}

	internal func selectCardFromCell(cell: ExistingCardCell) {
		let index = existingCards.indexPath(for: cell)

		existingCards.selectRow(at: index, animated: false, scrollPosition: .none)

		/*
		 * If we're selecting a cell, make sure that the existing cards option is also selected
		 */
		useExistingCard.isSelected = true

		selectExistingCardPaymentOption()
	}

	private func completeCapturingCard() {
		// TODO: Implement me.
	}

	private func payWithCard(card: CreditCard?) {
		guard let theCard = card else {
			fatalError("Missing card")
		}

		appDelegate.customerSDK?.paymentRequests.makePayment(
			paymentRequestId: appDelegate.paymentRequest!.paymentRequestId,
			primaryInstrument: theCard.paymentInstrumentId,
			secondaryInstruments: [],
			clientReference: nil,
			preferences: nil,
			challengeResponses: appDelegate.challengeResponses,
			fraudPayload: appDelegate.fraudPayload,
			transactionType: nil,
			allowPartialSuccess: nil,
			completion: { result in
				switch(result) {
					case .failure(let error):
						return self.failPayment(error: error)

					case .success(let data):
						// TODO: Check for 3DS response

						self.checkTransactionSummaryStatus(data: data)
					}
			}
		)
	}

	private func checkTransactionSummaryStatus(data: CustomerTransactionSummary) {
		guard let status = data.status else {
			failPayment(reason: "Missing transaction summary status")

			return
		}

		switch (status) {
			case .APPROVED:
				displaySuccessfulPayment()

			case .REJECTED:
				failPayment(reason: "Payment rejected")

			default:
				failPayment(reason: "Payment not finished processing")
		}
	}

	private func displaySuccessfulPayment() {
		paymentOutcome = .success

		displayPaymentOutcome()
	}

	private func failPayment(error: ApiError) {
		print("Payment Error: \(error)")

		var reason: String

		switch(error) {
			case .jsonEncoding(let message, _): reason = message
			case .jsonDecoding(let message, _): reason = message
			case .httpError: reason = "Check the logs for reason"
			case .error(let error): reason = error.localizedDescription
		}

		failPayment(reason: reason)
	}

	private func failPayment(reason: String) {
		print("Payment Error: \(reason)")

		paymentOutcome = .failure(reason: reason)

		displayPaymentOutcome()
	}

	private func displayPaymentOutcome() {
		var text: String

		switch paymentOutcome {
			case .success:
				text = "Payment successful"

			case .failure:
				text = "Payment failed"

			case .noOutcome:
		    text = "No payment made"
		}

		let alert = UIAlertController(title: "Payment Outcome", message: text, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))

		present(alert, animated: true, completion: nil)
	}

	private func configureFramesHost() {
		framesHost.configure(
			config: FramesViewConfig(
				html: HTML
			),
			callback: self,
			logger: DebugLogger()
		)

		do {
			try framesHost.loadFrames(config: appDelegate.framesConfig!)
		}
		catch {
			fatalError("Can't load frames")
		}
	}

	private func configureCardsList() {
		existingCards.dataSource = self
		// hide separators if number of items less than height of table
		existingCards.tableFooterView = UIView()
	}

	private func changePaymentOption(option: PaymentOptions) {
		paymentOption = option

		checkPaymentPossible()
	}

	private func checkPaymentPossible() {
    payNow.isEnabled = paymentOption.isValid()
	}

	private func reloadPaymentInstruments() {
		appDelegate.listPaymentInstruments(next: {
			self.existingCards.reloadData()
		})
	}

	private func newCardValid() -> Bool {
		cardNumberValid && cardExpiryValid && cardCvvValid
	}
}

class ExistingCardCell : UITableViewCell {
	@IBOutlet weak var selectCard: DLRadioButton!
	weak var controller: PaymentDetails!

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		selectCard.isSelected = selected
	}

	@IBAction func onCardSelected(_ sender: Any) {
		controller.selectCardFromCell(cell: self)
	}

	@IBAction func onDeleteCard(_ sender: Any) {
		controller.deleteCardFromCell(cell: self)
	}
}

private func debug(message: String) {
	print("[Callback]", message)
}
