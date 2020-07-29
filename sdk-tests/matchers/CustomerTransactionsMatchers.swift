import Foundation
import XCTest
import Hamcrest

@testable import VillageWalletClientSDKReference

func isCustomerTransactionSummaries() -> Matcher<CustomerTransactionSummaries> {
	Matcher("A list of customer transaction summaries") { (value) -> Bool in
		let transactionMatcher = isCustomerTransactionSummary()
		let transactions = value.transactions()

		assertThat(transactions.count, greaterThan(0))

		return transactions.reduce(true) {
			(result, transaction) -> Bool in result && transactionMatcher.matches(transaction).boolValue
		}
	}
}

func isCustomerTransactionSummary() -> Matcher<CustomerTransactionSummary> {
	Matcher("A Customer Transaction Summary") { (item) -> Bool in
		assertThat(item.merchantId(), not(blankOrNilString()))
		assertThat(item.merchantReferenceId(), not(blankOrNilString()))
		assertThat(item.paymentRequestId(), not(blankOrNilString()))
		assertThat(item.type(), not(nilValue()))
		assertThat(item.grossAmount(), not(nilValue()))
		assertThat(item.executionTime(), not(nilValue()))
		assertThat(item.status(), not(nilValue()))
		assertThat(item.instruments().count, greaterThanOrEqualTo(1))
		assertThat(item.instruments(), hasItems(withCustomerPaymentInstruments()))
		assertThat(item.transactionId(), not(blankOrNilString()))

		return true
	}
}

func isCustomerTransactionDetails() -> Matcher<CustomerTransactionDetails> {
	let summaryMatcher: Matcher<CustomerTransactionSummary> = isCustomerTransactionSummary()

	return Matcher("Details on a customer transaction") { (item) -> Bool in 
		assertThat(item.basket()!, isBasket())

		return summaryMatcher.matches(item).boolValue
	}
}

func withCustomerPaymentInstruments() -> Matcher<CustomerTransactionUsedPaymentInstrument> {
	Matcher("Customer Transaction Summary with instruments") { (item) -> Bool in
		assertThat(item.paymentInstrumentId(), not(blankOrNilString()))
		assertThat(item.amount(), not(nilValue()))

		return true
	}
}