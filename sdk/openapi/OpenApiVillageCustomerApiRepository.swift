import UIKit
import OpenAPIClient

class OpenApiVillageCustomerApiRepository: OpenApiClientFactory, VillageCustomerApiRepository {
	override init(requestHeadersFactory: RequestHeadersFactory, contextRoot: String) {
		super.init(requestHeadersFactory: requestHeadersFactory, contextRoot: contextRoot)
	}

	func retrieveTransactions(
		paymentRequestId: String?,
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		callback: @escaping ApiResult<CustomerTransactionSummaries>) {
		let api = createCustomerApi()

		api.getCustomerTransactions(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentRequestId: paymentRequestId,
			startTime: startTime,
			endTime: endTime,
			pageSize: pageSize as NSNumber?,
			page: page as NSNumber?,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiCustomerTransactionSummaries(
					transactions: result!.data.transactions as! [OAICustomerTransactionSummary]
				), nil)
			})
	}

	func retrieveTransactionDetails(
		transactionId: String,
		callback: @escaping ApiResult<CustomerTransactionDetails>
	) {
		let api = createCustomerApi()

		api.getCustomerTransactionDetails(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			transactionId: transactionId,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiCustomerTransactionDetails(
					details: result!.data
				), nil)
			})
	}

	func retrievePaymentRequestDetailsByQRCode(
		qrCodeId: String,
		callback: @escaping ApiResult<CustomerPaymentRequest>
	) {
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

	func retrievePaymentRequestDetailsByRequestId(
		paymentRequestId: String,
		callback: @escaping ApiResult<CustomerPaymentRequest>
	) {
		let api = createCustomerApi()

		api.getCustomerPaymentDetailsByPaymentId(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentRequestId: paymentRequestId,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiCustomerPaymentRequest(customerPaymentDetails: results!.data), nil)
			})
	}

	func retrievePaymentInstruments(
		wallet: Wallet,
		callback: @escaping ApiResult<AllPaymentInstruments>
	) {
		let api = createCustomerApi()

		api.getCustomerPaymentInstruments(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			xEverdayPayWallet: (wallet == Wallet.EVERYDAY_PAY) as NSNumber,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiAllPaymentInstruments(
					creditCards: results!.data.creditCards as! [OAICreditCard],
					giftCards: results!.data.giftCards as! [OAIGiftCard],
					everydayPay: results!.data.everydayPay), nil)
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
			xEverdayPayWallet: (instrument.wallet() == Wallet.EVERYDAY_PAY) as NSNumber,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiPaymentResult(), nil)
			})
	}

	func initiatePaymentInstrumentAddition(
		instrument: PaymentInstrumentAddition,
		callback: @escaping ApiResult<PaymentInstrumentAdditionResult>
	) {
		let api = createCustomerApi()

		let body = OAIInstrumentAdditionDetails()
		body.data = OAICustomerInstrumentsData()
		body.data.clientReference = instrument.clientReference()

		api.initiatePaymentInstrumentAddition(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			instrumentAdditionDetails: body,
			xEverdayPayWallet: (instrument.wallet() == Wallet.EVERYDAY_PAY) as NSNumber,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiPaymentInstrumentAdditionResult(result: results!.data), nil)
			})
	}

	func retrievePreferences(callback: @escaping ApiResult<CustomerPreferences>) {
		let api = createCustomerApi()

		api.getCustomerPreferences(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(results!.data, nil)
			})
	}

	func setPreferences(
		preferences: CustomerPreferences,
		callback: @escaping ApiResult<Void>
	) {
		let api = createCustomerApi()

		let body = OAICustomerPreferences()
		body.data = preferences

		api.setCustomerPreferencesWithXWalletID(
			self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			customerPreferences: body,
			completionHandler: { error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(nil, nil)
			})
	}

	func retrieveCustomerPaymentSession(
		paymentSessionId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		let api = createCustomerApi()

		api.getCustomerPaymentSession(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentSessionId: paymentSessionId,
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiPaymentSession(session: results!.data), nil)
			})
	}

	func retrieveCustomerPaymentSessionByQR(
		qrCodeId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		let api = createCustomerApi()

		api.getCustomerPaymentSessionByQr(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			qrId: qrCodeId,
			completionHandler: { results, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(OpenApiPaymentSession(session: results!.data), nil)
		})
	}

	func updateCustomerPaymentSession(
		paymentSessionId: String,
		session: UpdatePaymentSessionRequest,
		callback: @escaping ApiResult<Void>
	) {
		let api = createCustomerApi()

		let body = OAIUpdatePaymentSessionRequest()
		body.data = OAICustomerPaymentSessionPaymentSessionIdData()
		body.data.additionalInfo = toDynamicPayload(payload: session.additionalInfo())

		api.updateCustomerPaymentSession(
			withXWalletID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentSessionId: paymentSessionId,
			updatePaymentSessionRequest: body,
			completionHandler: { error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(nil, nil)
		})
	}

	func checkHealth(callback: @escaping ApiResult<HeathCheck>) {
		let api = createAdministrationApi()

		api.checkHealth(
			completionHandler: { results, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiHealthCheck(check: results!.data), nil)
		})
	}
}
