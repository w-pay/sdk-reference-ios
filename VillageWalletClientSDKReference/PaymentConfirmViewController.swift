import UIKit
import VillageWalletSDK

class PaymentConfirmViewController: UIViewController, SlideToPayDelegate {
	@IBOutlet weak var action: UILabel!
	@IBOutlet weak var amountToPay: UILabel!
	@IBOutlet weak var bottomSheet: BottomSheet!

	private let village = createVillage()

	private var alertController: UIAlertController?

	private var paymentRequestDetails: CustomerPaymentRequest?
	private var selectedPaymentInstrument: PaymentInstrument?

	private var slideToPay: SlideToPay?

	override func viewDidLoad() {
		super.viewDidLoad()

		authenticateCustomer()

		// we lock the slide to pay until we get the data
		slideToPay!.disable()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)

		if (segue.identifier == "AddSlideToPay") {
			guard let slideToPay = segue.destination as? SlideToPay else {
				fatalError("Destination is not SlideToPay")
			}

			self.slideToPay = slideToPay
			slideToPay.delegate = self
		}

		if (segue.identifier == "ShowReceipt") {
			guard let navigationController = segue.destination as? UINavigationController else {
				fatalError("Destination is not a UINavigationController")
			}

			guard let paymentReceiptController = navigationController.topViewController as? PaymentReceiptViewController else {
				fatalError("Can't get the Payment Receipt Controller")
			}

			paymentReceiptController.paymentDetails = paymentRequestDetails
			paymentReceiptController.usedPaymentInstrument = selectedPaymentInstrument
		}
	}

	func makePayment() {
		action.text = "Paying"

		var completed = 0;
		let onComplete = {
			completed += 1

			guard completed == 2 else {
				return
			}

			self.performSegue(withIdentifier: "ShowReceipt", sender: self)
		}

		let _ = setTimeout(2, block: onComplete)

		village.makePayment(
			paymentRequestId: paymentRequestDetails!.paymentRequestId,
			instrument: selectedPaymentInstrument!,
			secondaryInstruments: nil,
			clientReference: nil,
			challengeResponses: nil,
			completion: { result in
			  switch(result) {
			    case .failure:
				    self.showErrorAlert(message: "Oops! Something went wrong.")
				    return

			    case .success:
				    onComplete()
				    return
			  }
		  })
	}

	func onSwiped() {
		UIView.animate(withDuration: 0.2, animations: {
			/*
	     * If we fade the view, the contents also disappears. So fade the background instead
	     */
			self.bottomSheet.backgroundColor = self.bottomSheet.backgroundColor?.withAlphaComponent(0)
		})

		makePayment()
	}

	private func setTimeout(_ delay: TimeInterval, block: @escaping () -> Void) -> Timer {
		Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
	}

	private func showMissingDetailsError(message: String) {
		amountToPay.text = "???"
		slideToPay?.disable()

		showErrorAlert(message: message)
	}

	private func showErrorAlert(message: String) {
		guard let controller = alertController else {
			alertController = UIAlertController(title: "Payment Missing", message: message, preferredStyle: .alert)

			let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
			alertController!.addAction(defaultAction)

			return showErrorAlert(message: message)
		}

		if (!controller.isBeingPresented) {
			controller.message = message

			present(controller, animated: true, completion: nil)
		}
		else {
			print("Error alert already being presented; ignoring request")
		}
	}

	private func authenticateCustomer() {
		// FIXME: Get from actual QR code.
		let qrCode = "1467913e-0d40-4506-9a21-d94b89f9a080"

		// FIXME: The host should be set from the QR code contents.
		village.setHost(host: "https://dev.mobile-api.woolworths.com.au")

		village.authenticate { result in
			switch (result) {
				case .failure(let error):
					return self.handleErrorResponse(error: error, message: "Oops! Authentication failed!")

				case .success:
					self.retrievePaymentDetails(qrCodeId: qrCode)
					self.retrievePaymentInstruments()
			}
		}
	}

	private func retrievePaymentDetails(qrCodeId: String) {
		village.retrievePaymentRequestDetailsBy(
			qrCodeId: qrCodeId,
			completion: { (result) in
				switch(result) {
					case .failure(let error):
						return self.handleErrorResponse(error: error, message: "Oops! Can't get payment details.")

					case .success(let data):
						self.paymentRequestDetails = data
						self.amountToPay.text = formatCurrency(value: data.grossAmount) ?? "???"

						self.safeToPay()
				}
			}
		)
	}

	private func retrievePaymentInstruments() {
		village.retrievePaymentInstruments(
			wallet: Wallet.MERCHANT,
			completion: { result in
				switch(result) {
					case .failure(let error):
						return self.handleErrorResponse(error: error, message: "Oops! Can't retrieve payment instruments.")

					case .success(let data):
						self.selectedPaymentInstrument = data.creditCards.first

						self.safeToPay()
				}
			}
		)
	}

	private func handleErrorResponse(error: ApiError, message: String) {
		switch(error) {
			case .httpError(let reason, let resp):
				print("Error '\(reason)' Response: \(resp)")
				break

			default:
				print("Got error")
		}

		showMissingDetailsError(message: message)
	}

	private func safeToPay() {
		guard paymentRequestDetails != nil, selectedPaymentInstrument != nil else {
			return
		}

		slideToPay?.enable()
	}
}

