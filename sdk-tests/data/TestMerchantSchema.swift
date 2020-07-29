import Foundation

@testable import VillageWalletClientSDKReference

func aNewSchema() -> MerchantSchema { TestMerchantSchema() }

class TestMerchantSchema: MerchantSchema {
	func schema() -> [String: AnyObject] {
		[:]
	}

	func type() -> String? {
		nil
	}

	func description() -> String? {
		nil
	}
}