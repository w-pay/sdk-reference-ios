import UIKit

protocol PaymentInstruments {
	func creditCards() -> [CreditCard]
	func giftCards() -> [GiftCard]
}

protocol PaymentInstrument {
	func paymentInstrumentId() -> String
	func cardSuffix() -> String
}

// TODO: Flesh out to meet API spec.
protocol CreditCard: PaymentInstrument {

}

// TODO: Flesh out to meet API spec.
protocol GiftCard: PaymentInstrument {

}