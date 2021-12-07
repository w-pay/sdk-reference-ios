import UIKit
import VillageWalletSDK
import VillageWalletSDKOAIClient

func createCustomerSDK(
	options: VillageCustomerOptions,
	authenticator: AnyApiAuthenticator<HasAccessToken>
) -> VillageCustomerApiRepository {
	CustomerVillage.createSDK(
		options: options,

		// see the docs on how we can use different token types.
		token: .apiAuthenticatorToken(authenticator: authenticator),
		repository: OpenApiVillageCustomerApiRepository.factory
	)
}

func createCustomerLoginAuthenticator(
	options: SimulatorCustomerOptions
) -> CustomerLoginApiAuthenticator {
	CustomerLoginApiAuthenticator(
		requestHeaders: RequestHeaderChain(factories: [ApiKeyRequestHeader(options: options)]),
		url: "\(options.baseUrl)/wow/v1/idm/servers/token",
		customerId: options.customerId
	)
}