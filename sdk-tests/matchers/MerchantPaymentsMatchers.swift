import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func isMerchantPaymentSummaries() -> Matcher<MerchantPaymentSummaries> {
	Matcher("A list of payments") { (item) -> Bool in
		let matcher = isMerchantPaymentSummary()

		let payments = item.payments()
		assertThat(payments.count, greaterThanOrEqualTo(1))

		return payments.reduce(true, { result, it in result && matcher.matches(it).boolValue })
	}
}

func isMerchantPaymentSummary() -> Matcher<MerchantPaymentSummary> {
	Matcher("A merchant payment summary") { (item) -> Bool in
		assertThat(item.paymentRequestId(), not(blankOrNilString()))
		assertThat(item.merchantReferenceId(), not(blankOrNilString()))
		assertThat(item.grossAmount(), not(nilValue()))
		assertThat(item.usesRemaining(), not(nilValue()))
		assertThat(item.expiryTime(), not(nilValue()))
		assertThat(item.specificWalletId(), not(blankOrNilString()))

		return true
	}
}

func isMerchantPaymentDetails() -> Matcher<MerchantPaymentDetails> {
	Matcher("Merchant Payment Details") { (item) -> Bool in
		assertThat(item.paymentRequestId(), not(blankOrNilString()))
		assertThat(item.merchantReferenceId(), not(blankOrNilString()))
		assertThat(item.grossAmount(), not(nilValue()))
		assertThat(item.usesRemaining(), not(nilValue()))
		assertThat(item.expiryTime(), not(nilValue()))
		assertThat(item.specificWalletId(), not(blankOrNilString()))
		assertThat(item.basket()!, isBasket())
		assertThat(item.posPayload()!, isPosPayload())
		assertThat(item.merchantPayload()!, isMerchantPayload())

		return true
	}
}

func hasPaymentRequestCreated() -> Matcher<CreatePaymentRequestResult> {
	Matcher("A payment request result") { (item) -> Bool in
		assertThat(item.paymentRequestId(), not(blankOrNilString()))
		assertThat(item.qr()!, isAQrCode())

		return true
	}
}
