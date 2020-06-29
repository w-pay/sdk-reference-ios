import UIKit
import OpenAPIClient

class OpenApiBasket: Basket {
	private let basket: OAIBasket

	init(basket: OAIBasket) {
		self.basket = basket
	}

	func items() -> [BasketItem] {
		self.basket.items.map({ item in OpenApiBasketItem(item: item as! OAIBasketItems) })
	}
}

class OpenApiBasketItem: BasketItem {
	private let item: OAIBasketItems

	init(item: OAIBasketItems) {
		self.item = item
	}

	func label() -> String {
		self.item.label
	}

	func description() -> String? {
		self.item.description
	}

	func quantity() -> NSNumber? {
		self.item.quantity
	}

	func unitPrice() -> NSNumber? {
		self.item.unitPrice
	}

	func unitMeasure() -> String? {
		self.item.unitMeasure
	}

	func totalPrice() -> NSNumber? {
		self.item.totalPrice
	}

	func tags() -> [String: String] {
		self.item.tags
	}
}
