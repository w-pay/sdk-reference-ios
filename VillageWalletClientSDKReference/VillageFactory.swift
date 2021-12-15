import UIKit
import VillageWalletSDK
import VillageWalletSDKOAIClient

class VillageFactory {
	static func createCustomerSDK(
		options: VillageCustomerOptions,
		token: String
	) -> VillageCustomerApiRepository {
		CustomerVillage.createSDK(
			options: options,

			// see the docs on how we can use different token types.
			token: .stringToken(token: token),
			repository: ({
				(
					options: VillageCustomerOptions,
					headers: RequestHeadersFactory,
					authenticator: AnyApiAuthenticator<HasAccessToken>
				) -> VillageCustomerApiRepository in
					OpenApiVillageCustomerApiRepository(
						requestHeadersFactory: headers,
						options: options,
						authenticator: authenticator,
						clientOptions: ClientOptions(
							debug: true
						)
					)
			})
		)
	}

	static func createMerchantSDK(
		options: VillageMerchantOptions,
		token: String
	) -> VillageMerchantApiRepository {
		MerchantVillage.createSDK(
			options: options,

			// see the docs on how we can use different token types.
			token: .stringToken(token: token),
			repository: ({
				(
					options: VillageMerchantOptions,
					headers: RequestHeadersFactory,
					authenticator: AnyApiAuthenticator<HasAccessToken>
				) -> VillageMerchantApiRepository in
					OpenApiVillageMerchantApiRepository(
						requestHeadersFactory: headers,
						options: options,
						authenticator: authenticator,
						clientOptions: ClientOptions(
							debug: true
						)
					)
			})
		)
	}

	static func createCustomerLoginAuthenticator(
		options: SimulatorCustomerOptions
	) -> CustomerLoginApiAuthenticator {
		CustomerLoginApiAuthenticator(
			requestHeaders: RequestHeaderChain(factories: [ApiKeyRequestHeader(options: options)]),
			url: "\(options.baseUrl)/wow/v1/idm/servers/token",
			customerId: options.customerId
		)
	}
}
