import UIKit
import VillageWalletSDK
import WPayFramesSDK

class PaymentDetails: UIViewController, FramesViewCallback {
	@IBOutlet weak var framesMessage: UILabel!
	@IBOutlet weak var framesHost: FramesView!
	@IBOutlet weak var existingCards: UITableView!

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

		// TODO: Post capture card command
	}

	func onRendered(id: String) {
		debug(message: "onRendered(\(id)")
	}

	func onRemoved(id: String) {
		debug(message: "onRemoved(\(id)")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

private func debug(message: String) {
	print("[Callback]", message)
}
