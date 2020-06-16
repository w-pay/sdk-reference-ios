import UIKit

let currencyFormat: NumberFormatter = {
	let currencyFormat = NumberFormatter()
	currencyFormat.numberStyle = .currency
	currencyFormat.currencyCode = "USD"

	return currencyFormat
}()

func formatCurrency(value: NSNumber) -> String? {
	currencyFormat.string(from: value)
}