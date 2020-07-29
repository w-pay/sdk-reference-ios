import Foundation
import XCTest
import Hamcrest

@testable import VillageWalletClientSDKReference

func isCustomerPaymentRequest() -> Matcher<CustomerPaymentRequest> {
	Matcher("A customer payment request") { (item) -> Bool in
		assertThat(item.merchantId(), not(blankOrNilString()))
		assertThat(item.basket()!, isBasket())

		return true
	}
}