import UIKit

protocol MerchantTransactions {

}

protocol MerchantTransactionSummaries: MerchantTransactions {
	func transactions() -> [MerchantTransactionSummary]
}

protocol MerchantTransactionSummary: TransactionSummary {
	func walletId() -> String
}

protocol MerchantTransactionDetails: MerchantTransactionSummary {
	func basket() -> Basket?
	func posPayload() -> PosPayload?
	func merchantPayload() -> MerchantPayload?
}