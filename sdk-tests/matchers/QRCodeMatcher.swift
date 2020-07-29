import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func aQrCode() -> Matcher<QRCode> {
	Matcher("A QR code") { (item) -> Bool in
		assertThat(item.qrId(), not(blankOrNilString()))
		assertThat(item.referenceId(), not(blankOrNilString()))
		assertThat(item.referenceType(), not(nilValue()))
		assertThat(item.content(), not(blankOrNilString()))
		assertThat(item.image(), not(blankOrNilString()))
		assertThat(item.expiryTime(), not(nilValue()))

		return true
	}
}

func isAQrCode() -> Matcher<QRCode> {
	aQrCode()
}