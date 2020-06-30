import UIKit

class ApiKeyRequestHeader: RequestHeaderFactory {
	private let options: VillageOptions

	init(options: VillageOptions) {
		self.options = options
	}

	func addHeaders(headers: inout [String: String]) {
		headers["x-api-key"] = options.apiKey
	}
}
