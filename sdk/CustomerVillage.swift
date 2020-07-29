import UIKit

/**
 * Entry point into the SDK. It is responsible for managing the relationship between app
 * concerns, and calling the API.
 */
class CustomerVillage<A>: Configurable {
	private let api: VillageCustomerApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	init(api: VillageCustomerApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	func authenticate(callback: @escaping ApiResult<A>) {
		return authenticator.authenticate(callback: callback)
	}

	func retrievePaymentDetails(qrCode: String, callback: @escaping ApiResult<CustomerPaymentRequest>) -> Void {
		api.retrievePaymentRequestDetailsByQRCode(qrCodeId: qrCode, callback: callback)
	}

	func retrievePaymentInstruments(
		wallet: Wallet,
		callback: @escaping ApiResult<PaymentInstruments>
	) -> Void {
		api.retrievePaymentInstruments(wallet: wallet, callback: callback)
	}

	func makePayment(
		paymentRequest: CustomerPaymentRequest,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<CustomerTransactionSummary>
	) {
		api.makePayment(paymentRequest: paymentRequest, instrument: instrument, callback: callback)
	}

	func setHost(host: String) {
		api.setHost(host: host)
		authenticator.setHost(host: host)
	}
}
