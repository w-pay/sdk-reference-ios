import UIKit

protocol TransactionSummary: Payment {
	func transactionId() -> String

	func type() -> TransactionSummaryPaymentType?

	func executionTime() -> Date

	func status() -> TransactionSummaryPaymentStatus?

	/*
	 * The return type has yet to be defined in the spec.
	 */
	func statusDetail() -> AnyObject?

	func refundReason() -> String?
}

enum TransactionSummaryPaymentType {
	case PAYMENT
	case REFUND

	static func valueOf(value: String) -> TransactionSummaryPaymentType? {
		switch (value.uppercased()) {
			case "PAYMENT":
				return TransactionSummaryPaymentType.PAYMENT

			case "REFUND":
				return TransactionSummaryPaymentType.REFUND

			default:
				return nil
		}
	}
}

enum TransactionSummaryPaymentStatus {
	case PROCESSING
	case APPROVED
	case REJECTED

	static func valueOf(value: String) -> TransactionSummaryPaymentStatus? {
		switch (value.uppercased()) {
			case "PROCESSING":
				return TransactionSummaryPaymentStatus.PROCESSING

			case "APPROVED":
				return TransactionSummaryPaymentStatus.APPROVED

			case "REJECTED":
				return TransactionSummaryPaymentStatus.REJECTED

			default:
				return nil
		}
	}
}
