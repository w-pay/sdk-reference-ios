import UIKit
import OpenAPIClient

class OpenApiVillageApiRepository: OpenApiClientFactory, VillageApiRepository {
	override init(requestHeadersFactory: RequestHeadersFactory, contextRoot: String) {
		super.init(requestHeadersFactory: requestHeadersFactory, contextRoot: contextRoot)
	}

	func retrievePaymentRequestDetails(qrCodeId: String, callback: @escaping ApiResult<CustomerPaymentRequest>) {
		let api = createCustomerApi()

		api.getCustomerPaymentDetailsByQRCodeId(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			qrId: qrCodeId,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiCustomerPaymentRequest(customerPaymentDetails: results!.data), nil)
		})
	}

	func retrievePaymentInstruments(callback: @escaping ApiResult<PaymentInstruments>) {
		let api = createCustomerApi()

		api.getCustomerPaymentInstruments(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			// FIXME: Set to input
			xEverdayPayWallet: false,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				// FIXME: Set wallet to input
				callback(OpenApiPaymentInstruments(
					creditCards: results!.data.creditCards as! [OAICreditCard],
					giftCards: results!.data.giftCards as! [OAIGiftCard],
					wallet: Wallet.MERCHANT), nil)
		})
	}

	func makePayment(
		paymentRequest: CustomerPaymentRequest,
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
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentRequestId: paymentRequest.paymentRequestId(),
			customerPaymentDetails: body,
			// FIXME: Set to input
			xEverdayPayWallet: false,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiPaymentResult(), nil)
			})
	}

	private func authorisationHeader(name: String, value: String) -> String? {
		if (name == "Authorization") {
			let token = value.split(separator: " ")[1]

			return String(token)
		}

		return nil
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
