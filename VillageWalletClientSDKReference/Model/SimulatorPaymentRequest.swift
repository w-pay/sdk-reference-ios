import Foundation
import VillageWalletSDK

class SimulatorPaymentRequest : NewPaymentRequest {
	let fraudPayload: FraudPayload?

	init(
		grossAmount: Decimal,
		maxUses: Int?,
		require3DSPA: Bool,
		fraudPayload: FraudPayload?
	) {
		self.fraudPayload = fraudPayload
		self.grossAmount = grossAmount
		self.maxUses = maxUses

		merchantPayload = SimulatorMerchantPayload(require3DSPA: require3DSPA)
	}

	var merchantReferenceId: String = UUID().uuidString

	var grossAmount: Decimal

	var generateQR: Bool = false

	var maxUses: Int?

	var timeToLivePayment: Int? = 300

	var timeToLiveQR: Int? = nil

	var specificWalletId: String? = nil

	var basket: Basket? = nil

	var posPayload: PosPayload? = nil

	var merchantPayload: MerchantPayload?
}

class SimulatorMerchantPayload: MerchantPayload {
	init(require3DSPA: Bool) {
		payload = [
			"require3DS": require3DSPA
		] as [String: AnyObject]
	}

	var schemaId: String? = "0a221353-b26c-4848-9a77-4a8bcbacf228"

	var payload: [String: AnyObject]
}
