import UIKit

protocol Basket {
	func items() -> [BasketItem]
}

protocol BasketItem {
	func label() -> String
	func description() -> String?
	func quantity() -> NSNumber?
	func unitPrice() -> NSNumber?
	func unitMeasure() -> String?
	func totalPrice() -> NSNumber?
	func tags() -> [String: String]
}
