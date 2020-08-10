import UIKit
import VillageOpenApiClient

class OpenApiAllPaymentInstruments: OpenApiPaymentInstruments, AllPaymentInstruments {
	private let everydayPayData: OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay?

	init(
		creditCards: [OAICreditCard],
		giftCards: [OAIGiftCard],
		everydayPay: OAIGetCustomerPaymentInstrumentsResultsDataEverydayPay?
	) {
		self.everydayPayData = everydayPay

		super.init(creditCards: creditCards, giftCards: giftCards, wallet: Wallet.MERCHANT)
	}

	func everydayPay() -> PaymentInstruments? {
		guard let everydayData = everydayPayData else {
			return nil
		}

		return OpenApiPaymentInstruments(
			creditCards: everydayData.creditCards as! [OAICreditCard],
			giftCards: everydayData.giftCards as! [OAIGiftCard],
			wallet: Wallet.EVERYDAY_PAY)
	}
}

class OpenApiPaymentInstruments: PaymentInstruments {
	private let theCreditCards: [OAICreditCard]
	private let theGiftCards: [OAIGiftCard]
	private let wallet: Wallet

	init(creditCards: [OAICreditCard], giftCards: [OAIGiftCard], wallet: Wallet) {
		self.theCreditCards = creditCards
		self.theGiftCards = giftCards
		self.wallet = wallet
	}

	func creditCards() -> [CreditCard] {
		theCreditCards.map({ item in OpenApiCreditCard(creditCard: item, wallet: wallet) })
	}

	func giftCards() -> [GiftCard] {
		theGiftCards.map({ item in OpenApiGiftCard(giftCard: item, wallet: wallet) })
	}
}

class OpenApiCreditCard: CreditCard {
	private let creditCard: OAICreditCard
	private let theWallet: Wallet

	init(creditCard: OAICreditCard, wallet: Wallet) {
		self.creditCard = creditCard
		self.theWallet = wallet
	}

	func paymentInstrumentId() -> String {
		creditCard.paymentInstrumentId
	}

	func cardSuffix() -> String {
		creditCard.cardSuffix
	}

	func cardName() -> String {
		creditCard.cardName
	}

	func cvvValidated() -> Bool {
		creditCard.cvvValidated.boolValue
	}

	func expired() -> Bool {
		creditCard.expired.boolValue
	}

	func expiryMonth() -> String {
		creditCard.expiryMonth
	}

	func expiryYear() -> String {
		creditCard.expiryYear
	}

	func requiresCVV() -> Bool {
		creditCard.requiresCVV.boolValue
	}

	func scheme() -> String {
		creditCard.scheme
	}

	func updateURL() -> URL {
		URL(string: creditCard.updateURL)!
	}

	func stepUp() -> CreditCardStepUp {
		OpenApiCreditCardStepUp(stepUp: creditCard.stepUp)
	}

	func allowed() -> Bool {
		creditCard.allowed.boolValue
	}

	func lastUpdated() -> Date {
		creditCard.lastUpdated
	}

	func lastUsed() -> Date? {
		creditCard.lastUsed
	}

	func paymentToken() -> String {
		creditCard.paymentToken
	}

	func primary() -> Bool {
		creditCard.primary.boolValue
	}

	func status() -> PaymentInstrumentStatus? {
		PaymentInstrumentStatus.valueOf(value: creditCard.status)
	}

	func wallet() -> Wallet {
		theWallet
	}
}

class OpenApiGiftCard: GiftCard {
	private let giftCard: OAIGiftCard
	private let theWallet: Wallet

	init(giftCard: OAIGiftCard, wallet: Wallet) {
		self.giftCard = giftCard
		self.theWallet = wallet
	}

	func paymentInstrumentId() -> String {
		giftCard.paymentInstrumentId
	}

	func cardSuffix() -> String {
		giftCard.cardSuffix
	}

	func programName() -> String {
		giftCard.programName
	}

	func stepUp() -> GiftCardStepUp? {
		guard let stepUp = giftCard.stepUp else {
			return nil
		}

		return OpenApiGiftCardStepUp(stepUp: stepUp)
	}

	func allowed() -> Bool {
		giftCard.allowed.boolValue
	}

	func lastUpdated() -> Date {
		giftCard.lastUpdated
	}

	func lastUsed() -> Date? {
		giftCard.lastUsed
	}

	func paymentToken() -> String {
		giftCard.paymentToken
	}

	func primary() -> Bool {
		giftCard.primary.boolValue
	}

	func status() -> PaymentInstrumentStatus? {
		PaymentInstrumentStatus.valueOf(value: giftCard.status)
	}

	func wallet() -> Wallet {
		theWallet
	}
}

class OpenApiCreditCardStepUp: CreditCardStepUp {
	private let stepUp: OAICreditCardStepUp

	init(stepUp: OAICreditCardStepUp) {
		self.stepUp = stepUp
	}

	func type() -> String {
		stepUp.type
	}

	func mandatory() -> Bool {
		stepUp.mandatory.boolValue
	}

	func url() -> URL {
		URL(string: stepUp.url)!
	}
}

class OpenApiGiftCardStepUp: GiftCardStepUp {
	private let stepUp: OAIGiftCardStepUp

	init(stepUp: OAIGiftCardStepUp) {
		self.stepUp = stepUp
	}

	func type() -> String {
		stepUp.type
	}

	func mandatory() -> Bool {
		stepUp.mandatory.boolValue
	}
}