import Foundation

@testable import VillageWalletClientSDKReference

func aNewBasket() -> Basket { TestBasket() }

class TestBasket: Basket {
	func items() -> [BasketItem] {
		[ TestBasketItem() ]
	}
}

class TestBasketItem: BasketItem {
	func label() -> String {
		"Item 1"
	}

	func description() -> String? {
		"This is item 1"
	}

	func quantity() -> Int? {
		Int(3)
	}

	func unitPrice() -> Decimal? {
		Decimal(2.1)
	}

	func unitMeasure() -> String? {
		"EACH"
	}

	func totalPrice() -> Decimal? {
		Decimal(6.3)
	}

	func tags() -> [String: String] {
		[
			"property1": "string",
			"property2": "string"
		]
	}
}