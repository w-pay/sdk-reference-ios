import UIKit

protocol CustomerPaymentRequest: Payment {
	func merchantId() -> String
	func basket() -> Basket?
}
