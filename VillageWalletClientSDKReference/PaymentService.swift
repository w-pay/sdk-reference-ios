import UIKit
import OpenAPIClient

class PaymentService {
	let apiClient: OAIApiClient
	let api: OAICustomerApi

	init() {
		let config = OAIDefaultConfiguration()
		config.accessToken = "ODA4NTYyNDktNjg0Ny00OWY4LWFmMDItOTU1MWEwMzliMjg5OlZJTExBR0VfQ1VTVE9NRVI="

		apiClient = OAIApiClient(
			baseURL: URL(string: "https://woolies-village.appspot.com"),
			configuration: config
		)

		api = OAICustomerApi(apiClient: apiClient)
	}

	func retrievePaymentRequestDetails(qrCodeId: String, callback: @escaping (OAICustomerPaymentDetail?, HTTPURLResponse?) -> Void) {
		api.getCustomerPaymentDetailsByQRCodeId(withQrId: qrCodeId, completionHandler: { results, error in
			guard error == nil else {
				let resp = self.extractHttpResponse(error: error! as NSError)

				callback(nil, resp)

				return
			}

			callback(results!.data, nil)
		})
	}

	func retrievePaymentInstruments(callback: @escaping (OAIGetCustomerPaymentInstrumentsResultsData?, HTTPURLResponse?) -> Void) {
		api.getCustomerPaymentInstruments { results, error in
			guard error == nil else {
				let resp = self.extractHttpResponse(error: error! as NSError)

				callback(nil, resp)

				return
			}

			callback(results!.data, nil)
		}
	}

	private func extractHttpResponse(error: NSError) -> HTTPURLResponse {
		let info = (error as NSError).userInfo
		let data = info["com.alamofire.serialization.response.error.response"] as? HTTPURLResponse

		guard data != nil else {
			fatalError("No HTTP response data in error")
		}

		return data!
	}
}