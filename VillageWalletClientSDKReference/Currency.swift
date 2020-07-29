import UIKit

let currencyFormat: NumberFormatter = {
	let currencyFormat = NumberFormatter()
	currencyFormat.numberStyle = .currency
	currencyFormat.roundingMode = NumberFormatter.RoundingMode.halfUp
	currencyFormat.locale = Locale(identifier: "en_AU")
	currencyFormat.currencyCode = "AUD"

	return currencyFormat
}()

func formatCurrency(value: Decimal) -> String? {
	currencyFormat.string(from: NSDecimalNumber(decimal: value))
}
