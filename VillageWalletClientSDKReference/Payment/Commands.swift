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
	static func cardCaptureCommand(options: CaptureCard.Payload) throws -> JavascriptCommand {
		try BuildFramesCommand(commands:
			CaptureCard(payload: options).toCommand(name: CAPTURE_CARD_ACTION),
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

	static func cardValidateCommand(
		sessionId: String,
		windowSize: AcsWindowSize
	) throws -> JavascriptCommand {
		GroupCommand(name: "validateCard", commands:
			try ValidateCard(
				payload: validateCardOptions(sessionId: sessionId, windowSize: windowSize)
			).toCommand(name: VALIDATE_CARD_ACTION),
			StartActionCommand(name: VALIDATE_CARD_ACTION),
			CreateActionControlCommand(
				actionName: VALIDATE_CARD_ACTION,
				controlType: ControlType.VALIDATE_CARD,
				domId: VALIDATE_CARD_DOM_ID
			),
			CompleteActionCommand(name: VALIDATE_CARD_ACTION)
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

	static func validateCardOptions(
		sessionId: String,
		windowSize: AcsWindowSize
	) -> ValidateCard.Payload {
		ValidateCard.Payload(
			sessionId: sessionId,
			env3DS: ThreeDSEnv.STAGING,
			acsWindowSize: windowSize
		)
	}
}

class ShowValidationChallenge : JavascriptCommand {
	init() {
		super.init(command: """
	    frames.showValidationChallenge = function() {
	      const cardCapture = document.getElementById('\(CARD_CAPTURE_DOM_ID)');
	      cardCapture.style.display = "none";
	      
	      const challenge = document.getElementById('\(VALIDATE_CARD_DOM_ID)');
	      challenge.style.display = "block";
	    };
	    
	    frames.showValidationChallenge();

	    true
	  """)
	}
}

class HideValidationChallenge: JavascriptCommand {
	init() {
		super.init(command: """
      frames.showValidationChallenge = function() {
        const cardCapture = document.getElementById('\(CARD_CAPTURE_DOM_ID)');
        cardCapture.style.display = "block";
        
        const challenge = document.getElementById('\(VALIDATE_CARD_DOM_ID)');
        challenge.style.display = "none";
      };
      
      frames.showValidationChallenge();

      true
    """)
	}
}