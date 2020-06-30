import UIKit
import OpenAPIClient

class OpenApiVillageApiRepository: VillageApiRepository {
	private let requestHeadersFactory: RequestHeadersFactory
	private let contextRoot: String

	private var host: String = "localhost:3000"

	init(requestHeadersFactory: RequestHeadersFactory, contextRoot: String) {
		self.requestHeadersFactory = requestHeadersFactory
		self.contextRoot = contextRoot
	}

	func retrievePaymentRequestDetails(qrCodeId: String, callback: @escaping ApiResult<CustomerPaymentDetails>) {
		let api = createCustomerApi()

		api.getCustomerPaymentDetailsByQRCodeId(withQrId: qrCodeId, completionHandler: { results, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(OpenApiCustomerPaymentDetails(customerPaymentDetails: results!.data), nil)
		})
	}

	func retrievePaymentInstruments(callback: @escaping ApiResult<PaymentInstruments>) {
		let api = createCustomerApi()

		api.getCustomerPaymentInstruments { results, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(OpenApiPaymentInstruments(paymentInstruments: results!.data), nil)
		}
	}

	func makePayment(
		paymentDetails: CustomerPaymentDetails,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<PaymentResult>
	) {
		let api = createCustomerApi()

		let body = OAICustomerPaymentDetails()
		body.data = OAICustomerPaymentsPaymentRequestIdData()
		body.data.primaryInstrumentId = instrument.paymentInstrumentId()
		body.data.secondaryInstruments = []
		body.meta = [:]

		api.makeCustomerPayment(
			withPaymentRequestId: paymentDetails.paymentRequestId(),
			customerPaymentDetails: body,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiPaymentResult(), nil)
			})
	}

	private func createCustomerApi() -> OAICustomerApi {
		let config = OAIDefaultConfiguration()

		let apiClient = OAIApiClient(
			baseURL: URL(string: "\(host)\(contextRoot)"),
			configuration: config
		)

		requestHeadersFactory.createHeaders().forEach { name, value in
			config.setDefaultHeaderValue(value, forKey: name)
		}

		return OAICustomerApi(apiClient: apiClient)
	}

	private func extractHttpResponse(error: NSError) -> HTTPURLResponse {
		let info = (error as NSError).userInfo
		let data = info["com.alamofire.serialization.response.error.response"] as? HTTPURLResponse

		guard data != nil else {
			fatalError("No HTTP response data in error")
		}

		return data!
	}

	func setHost(host: String) {
		self.host = host
	}
}
