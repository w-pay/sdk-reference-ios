import UIKit

func createVillage() -> Village<IdmTokenDetails> {
	let options = VillageOptions(apiKey: "95udD3oX82JScUQ1qyACSOMysyAl93Gb")
	let apiKeyRequestHeader = ApiKeyRequestHeader(options: options)
	let bearerTokenRequestHeader = BearerTokenRequestHeader()
	let api =
		OpenApiVillageApiRepository(
			requestHeadersFactory: RequestHeaderChain(
				factories: [
					apiKeyRequestHeader,
					bearerTokenRequestHeader
				]
			),
			// TODO: This should be in a project property
			contextRoot: "/wow/v1/dpwallet"
		)

	let customerLogin = CustomerLoginApiAuthenticator(
		requestHeaders: RequestHeaderChain(factories: [ apiKeyRequestHeader ]),
		path: "/wow/v1/idm/servers/token"
	)

	let authentication = StoringApiAuthenticator(delegate: customerLogin, store: bearerTokenRequestHeader)

	let village = Village(api: api, authenticator: authentication)
	village.setHost(host: "https://dev.mobile-api.woolworths.com.au")

	return village
}
