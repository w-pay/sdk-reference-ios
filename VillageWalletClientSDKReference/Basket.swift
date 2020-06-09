import UIKit

// TODO: This should be from the SDK
class Basket {
	var items = [BasketItem]()
}

class BasketItem {
	let description: String
	let amount: String

	init(amount: String, description: String) {
		self.amount = amount
		self.description = description
	}
}
