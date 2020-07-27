import UIKit

class MerchantVillage<A>: Configurable {
	private let api: VillageMerchantApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	init(api: VillageMerchantApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	func setHost(host: String) {
		authenticator.setHost(host: host)
		api.setHost(host: host)
	}
}
