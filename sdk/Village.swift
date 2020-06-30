import UIKit

/**
 * Entry point into the SDK. It is responsible for managing the relationship between app
 * concerns, and calling the API.
 */
class Village {
	private let api: VillageApiRepository

	init(api: VillageApiRepository) {
		self.api = api
	}

	func retrievePaymentDetails(qrCode: String, callback: @escaping ApiResult<CustomerPaymentDetails>) -> Void {
		api.retrievePaymentRequestDetails(qrCodeId: qrCode, callback: callback)
	}

	func retrievePaymentInstruments(callback: @escaping ApiResult<PaymentInstruments>) -> Void {
		api.retrievePaymentInstruments(callback: callback)
	}

	func makePayment(
		paymentDetails: CustomerPaymentDetails,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<PaymentResult>
	) {
		api.makePayment(paymentDetails: paymentDetails, instrument: instrument, callback: callback)
	}
}
