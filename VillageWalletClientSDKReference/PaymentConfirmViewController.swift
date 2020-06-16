import UIKit
import OpenAPIClient

class PaymentConfirmViewController: UIViewController, SlideToPayDelegate {
	@IBOutlet weak var action: UILabel!
	@IBOutlet weak var amountToPay: UILabel!
	@IBOutlet weak var bottomSheet: BottomSheet!

	private let paymentService: PaymentService = PaymentService()

	private var alertController: UIAlertController?

	private var paymentRequestDetails: OAICustomerPaymentDetail?
	private var selectedPaymentInstrument: OAIGetCustomerPaymentInstrumentsResultsDataCreditCards?

	private var slideToPay: SlideToPay?

	override func viewDidLoad() {
		super.viewDidLoad()

		// FIXME: Get from actual code.
		let qrCode = "010f03a6-84a8-4a7a-a546-533df843ccbe"
		retrievePaymentDetails(qrCodeId: qrCode)
		retrievePaymentInstruments()

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

		paymentService.makePayment(
			paymentRequest: paymentRequestDetails!,
			instrument: selectedPaymentInstrument!,
		  callback: { data, resp in
			  guard resp == nil else {
				  return self.showErrorAlert(message: "Oops! Something went wrong.")
			  }

			  onComplete()
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

	private func retrievePaymentDetails(qrCodeId: String) {
		paymentService.retrievePaymentRequestDetails(qrCodeId: qrCodeId, callback: { (data, resp) in
			guard resp == nil else {
				return self.handleErrorResponse(resp: resp!, message: "Oops! Can't get payment details.")
			}

			self.paymentRequestDetails = data
			self.amountToPay.text = formatCurrency(value: data?.grossAmount ?? 0) ?? "???"

			self.safeToPay()
		})
	}

	private func retrievePaymentInstruments() {
		paymentService.retrievePaymentInstruments { data, resp in
			guard resp == nil else {
				return self.handleErrorResponse(resp: resp!, message: "Oops! Can't retrieve payment instruments.")
			}

			self.selectedPaymentInstrument = (data?.creditCards.first as! OAIGetCustomerPaymentInstrumentsResultsDataCreditCards)

			self.safeToPay()
		}
	}

	private func handleErrorResponse(resp: HTTPURLResponse, message: String) {
		print("Error Response: \(resp)")

		showMissingDetailsError(message: message)
	}

	private func safeToPay() {
		guard paymentRequestDetails != nil, selectedPaymentInstrument != nil else {
			return
		}

		slideToPay?.enable()
	}
}

