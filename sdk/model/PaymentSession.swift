import UIKit

protocol PaymentSession {
	func paymentSessionId() -> String

	func merchantId() -> String

	func walletId() -> String?

	func expiryTime() -> Date

	func location() -> String

	func additionalInfo() -> DynamicPayload
}
