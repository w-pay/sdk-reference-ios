import UIKit

class CustomerLoginApiAuthenticator: AnyApiAuthenticator<IdmTokenDetails> {
	private let requestHeaders: RequestHeadersFactory
	private let path: String

	private var origin: String?

	init(requestHeaders: RequestHeadersFactory, path: String) {
		self.requestHeaders = requestHeaders
		self.path = path
	}

	override func authenticate(callback: @escaping ApiResult<IdmTokenDetails>) {
		guard let origin = self.origin else {
			fatalError("Origin server must be set")
		}

		let credentials = [
			"shopperId": "1100000000093126352",
			"username": "1100000000093126352"
		]

		let url = URL(string: "\(origin)\(path)")!
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		requestHeaders.createHeaders().forEach { name, value in request.setValue(value, forHTTPHeaderField: name) }
		request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

		guard let uploadData = try? JSONEncoder().encode(credentials) else {
			fatalError("Can't encode credentials")
		}

		URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
			guard let response = response as? HTTPURLResponse else {
				fatalError("Didn't get a HTTPURLResponse back")
			}

			if error != nil {
				return callback(nil, response)
			}

			guard (200...299).contains(response.statusCode) else {
				return callback(nil, response)
			}

			if response.mimeType == "application/json", let data = data {
				do {
					let result: IdmTokenDetails = try JSONDecoder().decode(IdmTokenDetails.self, from: data)

					return callback(result, nil)
				}
				catch {
					fatalError("Can't decode IDM token details JSON \(error)")
				}
			}

			callback(nil, response)
		}
		.resume()
	}

	override func setHost(host: String) {
		origin = host
	}
}
