import UIKit
import VillageWalletSDK

class CustomerLoginApiAuthenticator: AnyApiAuthenticator<IdmTokenDetails> {
	private let requestHeaders: RequestHeadersFactory
	private let path: String

	private var origin: String?

	init(requestHeaders: RequestHeadersFactory, path: String) {
		self.requestHeaders = requestHeaders
		self.path = path

		super.init()
	}

	override func authenticate(completion: @escaping ApiCompletion<IdmTokenDetails>) {
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

			if let error = error {
				return completion(.failure(.error(error: error)))
			}

			guard (200...299).contains(response.statusCode) else {
				switch(response.statusCode) {
					case 400:
						return completion(.failure(.httpError(reason: .invalidInput, response: response)))

					case 401:
						return completion(.failure(.httpError(reason: .unauthorised, response: response)))

					case 422:
						return completion(.failure(.httpError(reason: .processingError, response: response)))

					default:
						return completion(.failure(.httpError(reason: .serverError, response: response)))
				}
			}

			if response.mimeType == "application/json", let data = data {
				do {
					let result: IdmTokenDetails = try JSONDecoder().decode(IdmTokenDetails.self, from: data)

					return completion(.success(result))
				}
				catch {
					return completion(.failure(.jsonDecoding(
						message: "Can't decode IDM token details JSON",
						details: [ "error": error ]))
					)
				}
			}

			completion(.failure(.httpError(reason: .serverError, response: response)))
		}
		.resume()
	}

	override func setHost(host: String) {
		origin = host
	}
}
