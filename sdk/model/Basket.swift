import UIKit

protocol Basket {
	func items() -> [BasketItem]
}

protocol BasketItem {
	func label() -> String
	func description() -> String?
	func quantity() -> Int?
	func unitPrice() -> Decimal?
	func unitMeasure() -> String?
	func totalPrice() -> Decimal?
	func tags() -> [String: String]
}
