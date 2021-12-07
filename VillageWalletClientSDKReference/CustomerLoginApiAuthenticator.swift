import UIKit
import VillageWalletSDK

class CustomerLoginApiAuthenticator: AnyApiAuthenticator<HasAccessToken> {
	private let requestHeaders: RequestHeadersFactory
	private let url: String
	private let customerId: String

	init(
		requestHeaders: RequestHeadersFactory,
		url: String,
		customerId: String
	) {
		self.requestHeaders = requestHeaders
		self.url = url
		self.customerId = customerId

		super.init()
	}

	override func authenticate(completion: @escaping ApiCompletion<HasAccessToken>) {
		let credentials = [
			"shopperId": customerId,
			"username": customerId
		]

		var request = URLRequest(url: URL(string: url)!)
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
}
