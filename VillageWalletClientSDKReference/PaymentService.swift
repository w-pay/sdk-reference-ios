import UIKit
import OpenAPIClient

// TODO: This should be in a project property
let API_CONTEXT_ROOT = "/wow/v1/dpwallet"

class PaymentService {
	let apiClient: OAIApiClient
	let api: OAICustomerApi

	init() {
		let config = OAIDefaultConfiguration()
		config.setDefaultHeaderValue("haTdoUWVhnXm5n75u6d0VG67vCCvKjQC", forKey: "x-api-key")
		config.accessToken = "ODA4NTYyNDktNjg0Ny00OWY4LWFmMDItOTU1MWEwMzliMjg5OlZJTExBR0VfQ1VTVE9NRVI="

		apiClient = OAIApiClient(
			baseURL: URL(string: "https://dev.mobile-api.woolworths.com.au\(API_CONTEXT_ROOT)"),
			configuration: config
		)

		api = OAICustomerApi(apiClient: apiClient)
	}

	func retrievePaymentRequestDetails(qrCodeId: String, callback: @escaping (OAICustomerPaymentDetail?, HTTPURLResponse?) -> Void) {
		api.getCustomerPaymentDetailsByQRCodeId(withQrId: qrCodeId, completionHandler: { results, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(results!.data, nil)
		})
	}

	func retrievePaymentInstruments(callback: @escaping (OAIGetCustomerPaymentInstrumentsResultsData?, HTTPURLResponse?) -> Void) {
		api.getCustomerPaymentInstruments { results, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(results!.data, nil)
		}
	}

	func makePayment(
		paymentRequest: OAICustomerPaymentDetail,
		instrument: OAIGetCustomerPaymentInstrumentsResultsDataCreditCards,
		callback: @escaping (OAICustomerTransactionSummary?, HTTPURLResponse?) -> Void
	) {
		let body = OAICustomerPaymentDetails()
		body.data = OAICustomerPaymentsPaymentRequestIdData()
		body.data.primaryInstrumentId = instrument.paymentInstrumentId
		body.data.secondaryInstruments = []
		body.meta = [:]

		api.makeCustomerPayment(
			withPaymentRequestId: paymentRequest.paymentRequestId,
			customerPaymentDetails: body,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(results!.data, nil)
			})
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