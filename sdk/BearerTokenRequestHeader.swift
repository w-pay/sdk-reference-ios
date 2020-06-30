import UIKit

class BearerTokenRequestHeader: AnyCredentialsStore<IdmTokenDetails>, RequestHeaderFactory {
	private var token: String?

	func addHeaders(headers: inout [String: String]) {
		guard let token = self.token else {
			fatalError("Must set bearer token before calling API")
		}

		headers["Authorization"] = "Bearer \(token)"
	}

	override func storeCredentials(credentials: IdmTokenDetails) {
		token = credentials.accessToken
	}
}
