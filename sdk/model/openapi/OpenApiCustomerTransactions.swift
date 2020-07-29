import UIKit
import OpenAPIClient

class OpenApiCustomerTransactionSummaries: CustomerTransactionSummaries {
	private let theTransactions: [OAICustomerTransactionSummary]

	init(transactions: [OAICustomerTransactionSummary]) {
		self.theTransactions = transactions
	}

	func transactions() -> [CustomerTransactionSummary] {
		theTransactions.map { it in OpenApiCustomerTransactionSummary(summary: it) }
	}
}

class OpenApiCustomerTransactionSummary: CustomerTransactionSummary {
	private let summary: OAICustomerTransactionSummary

	init(summary: OAICustomerTransactionSummary) {
		self.summary = summary
	}

	func merchantId() -> String {
		summary.merchantId
	}

	func instruments() -> [CustomerTransactionUsedPaymentInstrument] {
		summary.instruments.map { it in OpenApiUsedPaymentInstrument(instrument: it as! OAICustomerTransactionSummaryAllOfInstruments) }
	}

	func transactionId() -> String {
		summary.transactionId
	}

	func type() -> TransactionSummaryPaymentType? {
		TransactionSummaryPaymentType.valueOf(value: summary.type)
	}

	func executionTime() -> Date {
		summary.executionTime
	}

	func status() -> TransactionSummaryPaymentStatus? {
		TransactionSummaryPaymentStatus.valueOf(value: summary.status)
	}

	func statusDetail() -> AnyObject? {
		nil
	}

	func refundReason() -> String? {
		summary.refundReason
	}

	func paymentRequestId() -> String {
		summary.paymentRequestId
	}

	func merchantReferenceId() -> String {
		summary.merchantReferenceId
	}

	func grossAmount() -> Decimal {
		summary.grossAmount.decimalValue
	}
}

class OpenApiCustomerTransactionDetails: CustomerTransactionDetails {
	private let details: OAICustomerTransactionDetail

	init(details: OAICustomerTransactionDetail) {
		self.details = details
	}

	func basket() -> Basket? {
		guard let basket = details.basket else {
			return nil
		}

		return OpenApiBasket(basket: basket)
	}

	func merchantId() -> String {
		details.merchantId
	}

	func instruments() -> [CustomerTransactionUsedPaymentInstrument] {
		details.instruments.map { it in OpenApiUsedPaymentInstrument(instrument: it as! OAICustomerTransactionSummaryAllOfInstruments) }
	}

	func transactionId() -> String {
		details.transactionId
	}

	func type() -> TransactionSummaryPaymentType? {
		TransactionSummaryPaymentType.valueOf(value: details.type)
	}

	func executionTime() -> Date {
		details.executionTime
	}

	func status() -> TransactionSummaryPaymentStatus? {
		TransactionSummaryPaymentStatus.valueOf(value: details.status)
	}

	func statusDetail() -> AnyObject? {
		nil
	}

	func refundReason() -> String? {
		details.refundReason
	}

	func paymentRequestId() -> String {
		details.paymentRequestId
	}

	func merchantReferenceId() -> String {
		details.merchantReferenceId
	}

	func grossAmount() -> Decimal {
		details.grossAmount.decimalValue
	}
}