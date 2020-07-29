import Foundation

@testable import VillageWalletClientSDKReference

func aNewCustomerPaymentRequest() -> CustomerPaymentRequest {
	TestCustomerPaymentRequest()
}

class TestCustomerPaymentRequest: CustomerPaymentRequest {
	func merchantId() -> String {
		"abc123"
	}

	func basket() -> Basket? {
		aNewBasket()
	}

	func paymentRequestId() -> String {
		"def456"
	}

	func merchantReferenceId() -> String {
		"hij789"
	}

	func grossAmount() -> Decimal {
		Decimal(10)
	}
}