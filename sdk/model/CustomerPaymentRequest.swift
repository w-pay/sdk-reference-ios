import UIKit

protocol CustomerPaymentRequest {
	func paymentRequestId() -> String
	func merchantReferenceId() -> String
	func grossAmount() -> NSNumber
	func merchantId() -> String
	func basket() -> Basket?
}
