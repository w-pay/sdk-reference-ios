import UIKit

protocol MerchantPayments {
}

protocol MerchantPaymentSummaries: MerchantPayments {
	func payments() -> [MerchantPaymentSummary]
}

protocol MerchantPaymentSummary: Payment {
	func usesRemaining() -> Int?

	func expiryTime() -> Date?

	func specificWalletId() -> String?
}

protocol MerchantPaymentDetails: MerchantPaymentSummary {
	func basket() -> Basket?

	func posPayload() -> PosPayload?

	func merchantPayload() -> MerchantPayload?
}