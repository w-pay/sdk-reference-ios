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

	func quantity() -> Int? {
		self.item.quantity.intValue
	}

	func unitPrice() -> Decimal? {
		self.item.unitPrice.decimalValue
	}

	func unitMeasure() -> String? {
		self.item.unitMeasure
	}

	func totalPrice() -> Decimal? {
		self.item.totalPrice.decimalValue
	}

	func tags() -> [String: String] {
		self.item.tags
	}
}
