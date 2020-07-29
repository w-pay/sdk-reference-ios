import Foundation
import XCTest
import Hamcrest

@testable import VillageWalletClientSDKReference

func isBasket() -> Matcher<Basket> {
	Matcher("A basket with at least one item") { (item) -> Bool in 
		let itemsMatcher = isBasketItem()
		let basketItems = item.items()

		assertThat(basketItems.count, greaterThan(0))

		return basketItems.reduce(true) {
			(result, item) -> Bool in result && itemsMatcher.matches(item).boolValue
		}
	}
}

func isBasketItem() -> Matcher<BasketItem> {
	Matcher("An item with all properties") { (item) -> Bool in
		assertThat(item, not(nilValue()))
		assertThat(item.label(), not(blankOrNilString()))
		assertThat(item.description(), not(blankOrNilString()))
		assertThat(item.quantity()!, greaterThan(0))
		assertThat(item.unitPrice()!, greaterThan(0))
		assertThat(item.unitMeasure(), not(blankOrNilString()))
		assertThat(item.totalPrice()!, greaterThan(0))
		assertThat(item.tags(), not(nilValue()))
		assertThat(item.tags().count, greaterThan(0))

		return true
	}
}
