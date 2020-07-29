import Foundation

@testable import VillageWalletClientSDKReference

func aNewTransactionRefund() -> TransactionRefundDetails {
	TestTransactionRefundDetails()
}

class TestTransactionRefundDetails: TransactionRefundDetails {
	func reason() -> String {
		""
	}
}
