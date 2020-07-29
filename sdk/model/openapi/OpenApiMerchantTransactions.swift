import UIKit
import OpenAPIClient

class OpenApiMerchantTransactionSummaries: MerchantTransactionSummaries {
	private let theTransactions: [OAIMerchantTransactionSummary]

	init(transactions: [OAIMerchantTransactionSummary]) {
		self.theTransactions = transactions
	}

	func transactions() -> [MerchantTransactionSummary] {
		theTransactions.map { it in OpenApiMerchantTransactionSummary(summary: it) }
	}
}

class OpenApiMerchantTransactionSummary: MerchantTransactionSummary {
	private let summary: OAIMerchantTransactionSummary

	init(summary: OAIMerchantTransactionSummary) {
		self.summary = summary
	}

	func walletId() -> String {
		summary.walletId
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

class OpenApiMerchantTransactionDetails: MerchantTransactionDetails {
	private let details: OAIMerchantTransactionDetail

	init(details: OAIMerchantTransactionDetail) {
		self.details = details
	}

	func basket() -> Basket? {
		guard let basket = details.basket else {
			return nil
		}

		return OpenApiBasket(basket: basket)
	}

	func posPayload() -> PosPayload? {
		guard let payload = details.posPayload else {
			return nil
		}

		return OpenApiPosPayload(thePayload: payload)
	}

	func merchantPayload() -> MerchantPayload? {
		guard let payload = details.merchantPayload else {
			return nil
		}

		return OpenApiMerchantPayload(aPayload: payload)
	}

	func walletId() -> String {
		details.walletId
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