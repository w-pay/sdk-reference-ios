import UIKit
import VillageWalletSDK
import VillageWalletSDKOAIClient

func createVillage() -> CustomerVillage<HasAccessToken> {
	let options = VillageOptions(apiKey: "95udD3oX82JScUQ1qyACSOMysyAl93Gb")
	let apiKeyRequestHeader = ApiKeyRequestHeader(options: options)
	let bearerTokenRequestHeader = BearerTokenRequestHeader()
	let api =
		OpenApiVillageCustomerApiRepository(
			requestHeadersFactory: RequestHeaderChain(
				factories: [
					apiKeyRequestHeader,
					bearerTokenRequestHeader,
					WalletIdRequestHeader()
				]
			),
			// TODO: This should be in a project property
			contextRoot: "/wow/v1/dpwallet"
		)

	let customerLogin = CustomerLoginApiAuthenticator(
		requestHeaders: RequestHeaderChain(factories: [ apiKeyRequestHeader ]),
		path: "/wow/v1/idm/servers/token"
	)

	let authentication = StoringApiAuthenticator<HasAccessToken>(
		delegate: customerLogin as AnyApiAuthenticator<HasAccessToken>,
		store: bearerTokenRequestHeader as AnyCredentialsStore<HasAccessToken>
	)

	return CustomerVillage(api: api, authenticator: authentication)
}
