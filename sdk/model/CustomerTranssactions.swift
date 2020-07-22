import UIKit

protocol CustomerTransactions {

}

protocol CustomerTransactionUsedPaymentInstrument {
	func paymentInstrumentId() -> String

	func amount() -> NSNumber

	func paymentTransactionRef() -> String?
}

protocol CustomerTransactionSummaries: CustomerTransactions {
	func transactions() -> [CustomerTransactionSummary]
}

protocol CustomerTransactionSummary: TransactionSummary {
	func merchantId() -> String

	func instruments() -> [CustomerTransactionUsedPaymentInstrument]
}

protocol CustomerTransactionDetails: CustomerTransactionSummary {
	func basket() -> Basket?
}