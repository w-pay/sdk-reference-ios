import UIKit

let currencyFormat: NumberFormatter = {
	let currencyFormat = NumberFormatter()
	currencyFormat.numberStyle = .currency
	currencyFormat.roundingMode = NumberFormatter.RoundingMode.halfUp
	currencyFormat.locale = Locale(identifier: "en_AU")
	currencyFormat.currencyCode = "AUD"

	return currencyFormat
}()

func formatCurrency(value: NSNumber) -> String? {
	currencyFormat.string(from: value)
}
