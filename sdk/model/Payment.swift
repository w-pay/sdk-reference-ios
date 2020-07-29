import UIKit

protocol Payment {
	func paymentRequestId() -> String
	func merchantReferenceId() -> String
	func grossAmount() -> Decimal
}
