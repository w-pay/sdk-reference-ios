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
	options: VillageOptions,
	origin: String
) -> CustomerLoginApiAuthenticator {
	let authenticator = CustomerLoginApiAuthenticator(
		requestHeaders: RequestHeaderChain(factories: [ApiKeyRequestHeader(options: options)]),
		path: "/idm/servers/token"
	)

	authenticator.setOrigin(origin: origin)

	return authenticator
}