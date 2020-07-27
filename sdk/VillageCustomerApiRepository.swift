import UIKit

typealias CustomerPreferences = [String: [String: String]]

/**
 * Defines the low level API operations that the SDK can use to call the Customer Village API
 */
protocol VillageCustomerApiRepository: VillageAdministrationApiRepository {
	func retrieveTransactions(
		paymentRequestId: String?,
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		callback: @escaping ApiResult<CustomerTransactionSummaries>
	)

	func retrieveTransactionDetails(
		transactionId: String,
		callback: @escaping ApiResult<CustomerTransactionDetails>
	)

	func retrievePaymentRequestDetailsByQRCode(
		qrCodeId: String,
		callback: @escaping ApiResult<CustomerPaymentRequest>
	)

	func retrievePaymentRequestDetailsByRequestId(
		paymentRequestId: String,
		callback: @escaping ApiResult<CustomerPaymentRequest>
	)

	/**
	 * @param wallet When set to MERCHANT retrieves only from merchant wallet. EVERYDAY_PAY retrieves both merchant and everyday pay wallet instruments.
	 */
	func retrievePaymentInstruments(
		wallet: Wallet,
		callback: @escaping ApiResult<AllPaymentInstruments>
	)

	func makePayment(
		paymentRequest: CustomerPaymentRequest,
		instrument: PaymentInstrument,
		callback: @escaping ApiResult<PaymentResult>
	)
	
	func initiatePaymentInstrumentAddition(
		instrument: PaymentInstrumentAddition,
		callback: @escaping ApiResult<PaymentInstrumentAdditionResult>
	)

	func retrievePreferences(callback: @escaping ApiResult<CustomerPreferences>)

	func setPreferences(
		preferences: CustomerPreferences,
		callback: @escaping ApiResult<Void>
	)

	func retrieveCustomerPaymentSession(
		paymentSessionId: String,
		callback: @escaping ApiResult<PaymentSession>
	)

	func retrieveCustomerPaymentSessionByQR(
		qrCodeId: String,
		callback: @escaping ApiResult<PaymentSession>
	)

	func updateCustomerPaymentSession(
		paymentSessionId: String,
		session: UpdatePaymentSessionRequest,
		callback: @escaping ApiResult<Void>
	)
}
