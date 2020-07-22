import UIKit

class ApiKeyRequestHeader: RequestHeaderFactory {
	private let options: VillageOptions

	init(options: VillageOptions) {
		self.options = options
	}

	func addHeaders(headers: inout [String: String]) {
		headers[X_API_KEY] = options.apiKey
	}
}
