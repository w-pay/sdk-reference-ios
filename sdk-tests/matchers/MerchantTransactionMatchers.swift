import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func isMerchantTransactionSummaries() -> Matcher<MerchantTransactionSummaries> {
	Matcher("A list of merchant transactions") { (item) -> Bool in
		let transactionMatcher = isMerchantTransactionSummary()

		let transactions = item.transactions()
		assertThat(transactions.count, greaterThan(0))

		return transactions.reduce(true, { result, it in result && transactionMatcher.matches(it).boolValue })
	}
}

func isMerchantTransactionSummary() -> Matcher<MerchantTransactionSummary> {
	Matcher("A Merchant Transaction Summary") { (item) -> Bool in
		assertThat(item.walletId(), not(blankOrNilString()))
		assertThat(item.merchantReferenceId(), not(blankOrNilString()))
		assertThat(item.paymentRequestId(), not(blankOrNilString()))
		assertThat(item.type(), not(nilValue()))
		assertThat(item.grossAmount(), not(nilValue()))
		assertThat(item.executionTime(), not(nilValue()))
		assertThat(item.status(), not(nilValue()))
		assertThat(item.transactionId(), not(blankOrNilString()))

		return true
	}
}

func isMerchantTransactionDetails() -> Matcher<MerchantTransactionDetails> {
	Matcher("A Merchant Transaction Summary") { (item) -> Bool in
		let summaryMatcher = isMerchantTransactionSummary()

		assertThat(item.basket(), nilValue())
		assertThat(item.posPayload(), nilValue())
		assertThat(item.merchantPayload(), nilValue())

		return summaryMatcher.matches(item).boolValue
	}
}
