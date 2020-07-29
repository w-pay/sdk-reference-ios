import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func hasPaymentSession() -> Matcher<PaymentSession> {
	Matcher("A payment session") { (item) -> Bool in
		assertThat(item.paymentSessionId(), not(blankOrNilString()))
		assertThat(item.merchantId(), not(blankOrNilString()))
		assertThat(item.walletId(), nilValue())
		assertThat(item.expiryTime(), not(nilValue()))
		assertThat(item.location(), not(blankOrNilString()))
		assertThat(item.additionalInfo(), not(nilValue()))

		return true
	}
}

func hasPaymentSessionCreated() -> Matcher<CreatePaymentSessionResult> {
	Matcher("A created payment session") { (item) -> Bool in
		assertThat(item.paymentSessionId(), not(blankOrNilString()))
		assertThat(item.qr()!, isAQrCode())

		return true
	}
}
