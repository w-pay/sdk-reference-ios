import UIKit

@testable import VillageWalletClientSDKReference

let NO_ROOT = ""

class OpenApiSdkFactory: SdkFactory {
	func createCustomerApi() -> VillageCustomerApiRepository {
		OpenApiVillageCustomerApiRepository(requestHeadersFactory: TestRequestHeadersFactory(), contextRoot: NO_ROOT)
	}

	func createMerchantApi() -> VillageMerchantApiRepository {
		OpenApiVillageMerchantApiRepository(requestHeadersFactory: TestRequestHeadersFactory(), contextRoot: NO_ROOT)
	}
}

class TestRequestHeadersFactory: RequestHeadersFactory {
	func createHeaders() -> [String: String] {
		[
			X_WALLET_ID: "a value"
		]
	}
}