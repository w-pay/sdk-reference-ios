import UIKit

protocol CreatePaymentSessionRequest {
	func location() -> String

	func additionalInfo() -> DynamicPayload

	// return false by default
	func generateQR() -> Bool

	// return 0 by default
	func timeToLivePaymentSession() -> Int

	// return 0 by default
	func timeToLiveQR() -> Int
}
