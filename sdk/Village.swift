import UIKit

/**
 * Entry point into the SDK. It is responsible for managing the relationship between app
 * concerns, and calling the API.
 */
class Village<A>: Configurable {
	private let api: VillageApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	init(api: VillageApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	func authenticate(callback: @escaping ApiResult<A>) {
		return authenticator.authenticate(callback: callback)
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

	func setHost(host: String) {
		api.setHost(host: host)
		authenticator.setHost(host: host)
	}
}
