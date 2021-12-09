import UIKit
import VillageWalletSDK
import WPayFramesSDK

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

class PaymentDetails: UIViewController, FramesViewCallback {
	@IBOutlet weak var framesMessage: UILabel!
	@IBOutlet weak var framesHost: FramesView!
	@IBOutlet weak var existingCards: UITableView!

	private let appDelegate = UIApplication.shared.delegate as! AppDelegate

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
}

private func debug(message: String) {
	print("[Callback]", message)
}
