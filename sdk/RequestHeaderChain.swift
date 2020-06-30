import UIKit

class RequestHeaderChain: RequestHeadersFactory {
	private let factories: [RequestHeaderFactory]

	init(factories: [RequestHeaderFactory]) {
		self.factories = factories
	}

	func createHeaders() -> [String: String] {
		var headers = [String: String]()

		factories.forEach { factory in
			factory.addHeaders(headers: &headers)
		}

		return headers
	}
}
