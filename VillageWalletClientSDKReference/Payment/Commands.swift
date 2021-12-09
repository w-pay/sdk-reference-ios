import VillageWalletSDK
import WPayFramesSDK

let CAPTURE_CARD_ACTION = "cardCapture"
let VALIDATE_CARD_ACTION = "validateCard"

class CardCaptureOptions {
	let wallet: Wallet?
	let require3DS: Bool

	init(wallet: Wallet?, require3DS: Bool) {
		self.wallet = wallet
		self.require3DS = require3DS
	}
}

class Commands {
	static func cardCaptureCommand(options: CardCaptureOptions) throws -> JavascriptCommand {
		try BuildFramesCommand(commands:
			CaptureCard(payload: cardCaptureOptions(options: options)).toCommand(name: CAPTURE_CARD_ACTION),
			StartActionCommand(name: CAPTURE_CARD_ACTION),
			CreateActionControlCommand(
				actionName: CAPTURE_CARD_ACTION,
				controlType: ControlType.CARD_NUMBER,
				domId: CARD_NO_DOM_ID
			),
			CreateActionControlCommand(
				actionName: CAPTURE_CARD_ACTION,
				controlType: ControlType.CARD_EXPIRY,
				domId: CARD_EXPIRY_DOM_ID
			),
			CreateActionControlCommand(
				actionName: CAPTURE_CARD_ACTION,
				controlType: ControlType.CARD_CVV,
				domId: CARD_CVV_DOM_ID
			)
		)
	}

	static func cardCaptureOptions(options: CardCaptureOptions) -> CaptureCard.Payload {
		CaptureCard.Payload(
			verify: true,
			save: true,
			useEverydayPay: options.wallet == Wallet.EVERYDAY_PAY,
			env3DS: requires3DS(options: options)
		)
	}

	static func requires3DS(options: CardCaptureOptions) -> ThreeDSEnv? {
		if (options.require3DS) {
			return ThreeDSEnv.STAGING
		}

		return nil
	}
}
