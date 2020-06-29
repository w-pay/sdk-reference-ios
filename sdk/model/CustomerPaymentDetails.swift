import UIKit

protocol CustomerPaymentDetails {
	func paymentRequestId() -> String
	func merchantReferenceId() -> String
	func grossAmount() -> NSNumber
	func merchantId() -> String
	func basket() -> Basket?
}
