import UIKit

@testable import VillageWalletClientSDKReference

protocol SdkFactory {
	func createCustomerApi() -> VillageCustomerApiRepository

	func createMerchantApi() -> VillageMerchantApiRepository
}
