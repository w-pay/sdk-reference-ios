import Foundation

@testable import VillageWalletClientSDKReference

func aSelectedPaymentInstrument() -> PaymentInstrument {
	TestPaymentInstrument()
}

func aNewPaymentInstrument() -> PaymentInstrumentAddition {
	TestPaymentInstrumentAddition()
}

class TestPaymentInstrument: PaymentInstrument {
	func allowed() -> Bool {
		true
	}

	func cardSuffix() -> String {
		"1234"
	}

	func lastUpdated() -> Date {
		Date()
	}

	func lastUsed() -> Date? {
		Date()
	}

	func paymentInstrumentId() -> String {
		"abc123"
	}

	func paymentToken() -> String {
		"def123fgh"
	}

	func primary() -> Bool {
		true
	}

	func status() -> PaymentInstrumentStatus? {
		PaymentInstrumentStatus.VERIFIED
	}

	func wallet() -> Wallet {
		Wallet.MERCHANT
	}
}

class TestPaymentInstrumentAddition: PaymentInstrumentAddition {
	func clientReference() -> String {
		"abc123"
	}

	func wallet() -> Wallet {
		Wallet.EVERYDAY_PAY
	}
}