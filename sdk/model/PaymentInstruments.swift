import UIKit

enum PaymentInstrumentStatus {
	case UNVERIFIED_PERSISTENT
	case VERIFIED

	static func valueOf(value: String) -> PaymentInstrumentStatus? {
		switch(value.uppercased()) {
		case "UNVERIFIED_PERSISTENT":
			return PaymentInstrumentStatus.UNVERIFIED_PERSISTENT

		case "VERIFIED":
			return PaymentInstrumentStatus.VERIFIED

		default:
			return nil
		}
	}
}

protocol AllPaymentInstruments: PaymentInstruments {
	func everydayPay() -> PaymentInstruments?
}

protocol PaymentInstruments {
	func creditCards() -> [CreditCard]
	func giftCards() -> [GiftCard]
}

protocol PaymentInstrument {
	func allowed() -> Bool
	func cardSuffix() -> String
	func lastUpdated() -> Date
	func lastUsed() -> Date?
	func paymentInstrumentId() -> String
	func paymentToken() -> String
	func primary() -> Bool
	func status() -> PaymentInstrumentStatus?

	/** what Wallet the instrument is from */
	func wallet() -> Wallet
}

protocol CreditCard: PaymentInstrument {
	func cardName() -> String
	func cvvValidated() -> Bool
	func expired() -> Bool
	func expiryMonth() -> String
	func expiryYear() -> String
	func requiresCVV() -> Bool
	func scheme() -> String
	func updateURL() -> URL
	func stepUp() -> CreditCardStepUp
}

protocol GiftCard: PaymentInstrument {
	func programName() -> String
	func stepUp() -> GiftCardStepUp?
}

protocol CreditCardStepUp {
	func type() -> String
	func mandatory() -> Bool
	func url() -> URL
}

protocol GiftCardStepUp {
	func type() -> String
	func mandatory() -> Bool
}