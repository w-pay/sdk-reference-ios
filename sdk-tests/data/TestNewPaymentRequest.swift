import Foundation

@testable import VillageWalletClientSDKReference

func aNewPaymentRequest() -> NewPaymentRequest {
	TestNewPaymentRequest()
}

class TestNewPaymentRequest: NewPaymentRequest {
	func merchantReferenceId() -> String {
		"123456"
	}

	func grossAmount() -> Decimal {
		Decimal(12000)
	}

	func generateQR() -> Bool {
		true
	}

	func maxUses() -> Int? {
		1
	}

	func timeToLivePayment() -> Int? {
		300
	}

	func timeToLiveQR() -> Int? {
		60
	}

	func specificWalletId() -> String? {
		""
	}

	func basket() -> Basket? {
		aNewBasket()
	}

	func posPayload() -> PosPayload? {
		aNewPosPayload()
	}

	func merchantPayload() -> MerchantPayload? {
		aNewMerchantPayload()
	}
}