import Foundation

@testable import VillageWalletClientSDKReference

class TestCreatePaymentSessionRequest: CreatePaymentSessionRequest {
	func location() -> String {
		"somewhere"
	}

	func additionalInfo() -> DynamicPayload {
		TestCreatePaymentSessionRequestPayload()
	}

	func generateQR() -> Bool {
		true
	}

	func timeToLivePaymentSession() -> Int {
		0
	}

	func timeToLiveQR() -> Int {
		0
	}
}

class TestCreatePaymentSessionRequestPayload: DynamicPayload {
	func schemaId() -> String? {
		"abc123"
	}

	func payload() -> [String: AnyObject] {
		[:]
	}
}