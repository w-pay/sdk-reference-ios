import UIKit
import OpenAPIClient

class OpenApiPaymentInstruments: PaymentInstruments {
	private let paymentInstruments: OAIGetCustomerPaymentInstrumentsResultsData

	init(paymentInstruments: OAIGetCustomerPaymentInstrumentsResultsData) {
		self.paymentInstruments = paymentInstruments
	}

	func creditCards() -> [CreditCard] {
		paymentInstruments.creditCards.map({ item in OpenApiCreditCard(creditCard: item as! OAICreditCard) })
	}

	func giftCards() -> [GiftCard] {
		paymentInstruments.giftCards.map({ item in OpenApiGiftCard(giftCard: item as! OAIGiftCard) })
	}
}

class OpenApiCreditCard: CreditCard {
	private let creditCard: OAICreditCard

	init(creditCard: OAICreditCard) {
		self.creditCard = creditCard
	}

	func paymentInstrumentId() -> String {
		creditCard.paymentInstrumentId
	}

	func cardSuffix() -> String {
		creditCard.cardSuffix
	}
}

class OpenApiGiftCard: GiftCard {
	private let giftCard: OAIGiftCard

	init(giftCard: OAIGiftCard) {
		self.giftCard = giftCard
	}

	func paymentInstrumentId() -> String {
		giftCard.paymentInstrumentId
	}

	func cardSuffix() -> String {
		giftCard.cardSuffix
	}
}
