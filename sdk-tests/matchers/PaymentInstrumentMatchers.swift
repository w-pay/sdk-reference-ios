import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func isAllPaymentInstruments() -> Matcher<AllPaymentInstruments> {
	Matcher("A list of all payments instruments") { (item) -> Bool in
		assertThat(item.creditCards(), hasCards(creditCard()))
		assertThat(item.giftCards(), hasCards(giftCard()))
		assertThat(item.everydayPay()!, hasPaymentInstruments())

		return true
	}
}

func hasPaymentInstruments() -> Matcher<PaymentInstruments> {
	Matcher("A list of payment instruments") { (item) -> Bool in
		assertThat(item.creditCards(), hasCards(creditCard()))
		assertThat(item.giftCards(), hasCards(giftCard()))
		
		return true
	}
}

func hasCards<T>(_ matcher: Matcher<T>) -> Matcher<[T]> {
	Matcher("A list of cards with at least one card") { (list) -> Bool in
		assertThat(list, not(nilValue()))
		assertThat(list.count, greaterThanOrEqualTo(1))

		return list.reduce(true, 
			{ result, item in result && matcher.matches(item).boolValue }
		)
	}
}

func creditCard() -> Matcher<CreditCard> {
	Matcher("A Credit Card") { (card) -> Bool in
		assertThat(card.allowed(), not(nilValue()))
		assertThat(card.cardName(), not(blankOrNilString()))
		assertThat(card.cardSuffix(), not(blankOrNilString()))
		assertThat(card.cvvValidated(), not(nilValue()))
		assertThat(card.expired(), not(nilValue()))
		assertThat(card.expiryMonth(), not(blankOrNilString()))
		assertThat(card.expiryYear(), not(blankOrNilString()))
		assertThat(card.lastUpdated(), not(nilValue()))
		assertThat(card.lastUsed(), not(nilValue()))
		assertThat(card.paymentInstrumentId(), not(blankOrNilString()))
		assertThat(card.paymentToken(), not(blankOrNilString()))
		assertThat(card.primary(), not(nilValue()))
		assertThat(card.requiresCVV(), not(nilValue()))
		assertThat(card.scheme(), not(blankOrNilString()))
		assertThat(card.status(), not(nilValue()))
		assertThat(card.updateURL(), not(nilValue()))

		let stepUp = card.stepUp()
		assertThat(stepUp, not(nilValue()))
		assertThat(stepUp.mandatory(), not(nilValue()))
		assertThat(stepUp.type(), not(blankOrNilString()))
		assertThat(stepUp.url(), not(nilValue()))

		return true
	}
}

func giftCard() -> Matcher<GiftCard> {
	Matcher("A Gift Card") { (card) -> Bool in
		assertThat(card.allowed(), not(nilValue()))
		assertThat(card.cardSuffix(), not(blankOrNilString()))
		assertThat(card.lastUpdated(), not(nilValue()))
		assertThat(card.lastUsed(), not(nilValue()))
		assertThat(card.paymentInstrumentId(), not(blankOrNilString()))
		assertThat(card.paymentToken(), not(blankOrNilString()))
		assertThat(card.primary(), not(nilValue()))
		assertThat(card.status(), not(nilValue()))
		assertThat(card.programName(), not(blankOrNilString()))

		let stepUp = card.stepUp()
		assertThat(stepUp, not(nilValue()))
		assertThat(stepUp?.mandatory(), not(nilValue()))
		assertThat(stepUp?.type(), not(blankOrNilString()))

		return true
	}
}

func hasPaymentInstrumentAdded() -> Matcher<PaymentInstrumentAdditionResult> {
	Matcher("A successful payment instrument addition result") { (item) -> Bool in
		assertThat(item.cardCaptureURL(), not(blankOrNilString()))
		assertThat(item.transactionRef(), not(blankOrNilString()))

		return true
	}
}
