import UIKit

/**
 * Defines the low level API operations that the SDK can use to call the Village API
 */
protocol VillageApiRepository {
	func retrievePaymentRequestDetails(qrCodeId: String, callback: @escaping ApiResult<CustomerPaymentDetails>)

	func retrievePaymentInstruments(callback: @escaping ApiResult<PaymentInstruments>)

	func makePayment(
		paymentDetails: CustomerPaymentDetails,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<PaymentResult>
	)
}
