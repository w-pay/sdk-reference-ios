import Foundation

@testable import VillageWalletClientSDKReference

func aNewPaymentRequestQRCode() -> NewPaymentRequestQRCode {
	TestNewPaymentRequestQRCode()
}

class TestNewPaymentRequestQRCode: NewPaymentRequestQRCode {
	func referenceId() -> String {
		"abc123def"
	}

	func referenceType() -> QRCodePaymentReferenceType {
		QRCodePaymentReferenceType.PAYMENT_SESSION
	}

	func timeToLive() -> Int {
		0
	}
}