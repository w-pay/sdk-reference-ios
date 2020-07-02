import UIKit

/**
 * Defines the low level API operations that the SDK can use to call the Village API
 */
protocol VillageApiRepository: Configurable {
	func retrievePaymentRequestDetails(qrCodeId: String, callback: @escaping ApiResult<CustomerPaymentRequest>)

	func retrievePaymentInstruments(callback: @escaping ApiResult<PaymentInstruments>)

	func makePayment(
		paymentRequest: CustomerPaymentRequest,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<PaymentResult>
	)
}
