import UIKit
import OpenAPIClient

class OpenApiVillageMerchantApiRepository: OpenApiClientFactory, VillageMerchantApiRepository {
	override init(requestHeadersFactory: RequestHeadersFactory, contextRoot: String) {
		super.init(requestHeadersFactory: requestHeadersFactory, contextRoot: contextRoot)
	}

	func retrieveTransactions(
		page: Int?,
		pageSize: Int?,
		endTime: Date?,
		startTime: Date?,
		callback: @escaping ApiResult<MerchantTransactionSummaries>
	) {
		let api = createMerchantApi()

		api.getMerchantTransactions(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			startTime: startTime,
			endTime: endTime,
			pageSize: pageSize as NSNumber?,
			page: page as NSNumber?,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantTransactionSummaries(
					transactions: result!.data.transactions as! [OAIMerchantTransactionSummary]
				), nil)
			})
	}

	func retrieveTransactionDetails(
		transactionId: String,
		callback: @escaping ApiResult<MerchantTransactionDetails>
	) {
		let api = createMerchantApi()

		api.getMerchantTransactionDetails(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			transactionId: transactionId,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantTransactionDetails(
					details: result!.data
				), nil)
			})
	}

	func createPaymentRequestQRCode(
		details: NewPaymentRequestQRCode,
		callback: @escaping ApiResult<QRCode>
	) {
		let api = createMerchantApi()

		let body = OAIPaymentQRCodeDetails()
		body.data = OAIMerchantQrData()
		body.data.referenceId = details.referenceId()
		body.data.timeToLive = details.timeToLive() as NSNumber?

		switch(details.referenceType()) {
			case QRCodePaymentReferenceType.PAYMENT_SESSION:
				body.data.referenceType = "SESSION"

			case QRCodePaymentReferenceType.PAYMENT_REQUEST:
				body.data.referenceType = "REQUEST"
		}

		api.createPaymentQRCode(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentQRCodeDetails: body,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiQRCode(code: result!.data), nil)
			})
	}

	func retrievePaymentRequestQRCodeContent(
		qrCodeId: String,
		callback: @escaping ApiResult<QRCode>
	) {
		let api = createMerchantApi()

		api.getPaymentQRCodeContent(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			qrId: qrCodeId,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiQRCode(code: result!.data), nil)
			})
	}

	func cancelPaymentQRCode(
		qrCodeId: String,
		callback: @escaping ApiResult<Unit>
	) {
		let api = createMerchantApi()

		api.cancelPaymentQRCode(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			qrId: qrCodeId,
			completionHandler: { error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(nil, nil)
			})
	}

	func retrievePaymentList(
		type: String?,
		page: Int?,
		pageSize: Int?,
		callback: @escaping ApiResult<MerchantPaymentSummaries>
	) {
		let api = createMerchantApi()

		api.getMerchantPayments(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			type: type,
			pageSize: pageSize as NSNumber?,
			page: page as NSNumber?,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantPaymentSummaries(
					payments: result!.data.payments as! [OAIMerchantPaymentSummary]
				), nil)
			})
	}

	func createNewPaymentRequest(
		paymentRequest: NewPaymentRequest,
		callback: @escaping ApiResult<CreatePaymentRequestResult>
	) {
		let api = createMerchantApi()

		let body = OAIMerchantPaymentRequest()
		body.data = OAIMerchantPaymentsData()
		body.data.merchantReferenceId = paymentRequest.merchantReferenceId()
		body.data.grossAmount = paymentRequest.grossAmount()
		body.data.generateQR = paymentRequest.generateQR() as NSNumber
		body.data.maxUses = paymentRequest.maxUses() as NSNumber?
		body.data.timeToLivePayment = paymentRequest.timeToLivePayment() as NSNumber?
		body.data.timeToLiveQR = paymentRequest.timeToLiveQR() as NSNumber?
		body.data.specificWalletId = paymentRequest.specificWalletId()

		let posPayload: PosPayload? = paymentRequest.posPayload()
		if (posPayload != nil) {
			body.data.posPayload = OAIPosPayload()
			body.data.posPayload.schemaId = posPayload?.schemaId()
			body.data.posPayload.payload = posPayload?.payload() as? [String: NSObject]
		}

		let merchantPayload: MerchantPayload? = paymentRequest.merchantPayload()
		if (merchantPayload != nil) {
			body.data.merchantPayload = OAIMerchantPayload()
			body.data.merchantPayload.schemaId = merchantPayload?.schemaId()
			body.data.merchantPayload.payload = merchantPayload?.payload() as? [String: NSObject]
		}

		let basket: Basket? = paymentRequest.basket()
		if (basket != nil) {
			body.data.basket = OAIBasket()
			body.data.basket.items = basket?.items().map { it in
				let item = OAIBasketItems()
				item.label = it.label()
				item._description = it.description()
				item.quantity = it.quantity()
				item.unitPrice = it.unitPrice()
				item.unitMeasure = it.unitMeasure()
				item.totalPrice = it.totalPrice()
				item.tags = it.tags()

				return item
			}
		}

		api.createPaymentRequest(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			merchantPaymentRequest: body,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiCreatePaymentRequestResult(result: result!.data), nil)
			})
	}

	func retrievePaymentRequestDetails(
		paymentRequestId: String,
		callback: @escaping ApiResult<MerchantPaymentDetails>
	) {
		let api = createMerchantApi()

		api.getMerchantPaymentDetails(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentRequestId: paymentRequestId,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantPaymentDetails(details: result!.data), nil)
			})
	}

	func deletePaymentRequest(
		paymentRequestId: String,
		callback: @escaping ApiResult<Void>
	) {
		let api = createMerchantApi()

		api.deleteMerchantPayment(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentRequestId: paymentRequestId,
			completionHandler: { error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(nil, nil)
			})
	}

	func refundTransaction(
		transactionId: String,
		refundDetails: TransactionRefundDetails,
		callback: @escaping ApiResult<MerchantTransactionSummary>
	) {
		let api = createMerchantApi()

		let body = OAIRefundMerchantTransactionRequest()
		body.data = OAIMerchantTransactionsTransactionIdRefundData()
		body.data.reason = refundDetails.reason()

		api.refundMerchantTransaction(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			transactionId: transactionId,
			refundMerchantTransactionRequest: body,
			completionHandler: { result, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(OpenApiMerchantTransactionSummary(summary: result!.data), nil)
		})
	}

	func retrievePreferences(callback: @escaping ApiResult<MerchantPreferences>) {
		let api = createMerchantApi()

		api.getMerchantPreferences(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(result!.data, nil)
			})
	}

	func setPreferences(
		preferences: MerchantPreferences,
		callback: @escaping ApiResult<Void>
	) {
		let api = createMerchantApi()

		let body = OAIMerchantPreferences()
		body.data = preferences

		api.setMerchantPreferencesWithXMerchantID(
			self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			merchantPreferences: body,
			completionHandler: { error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(nil, nil)
			})
	}

	func retrieveSchemas(callback: @escaping ApiResult<MerchantSchemaSummaries>) {
		let api = createMerchantApi()

		api.getMerchantSchemas(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantSchemaSummaries(
					schemas: result!.data.schemas as! [OAIMerchantSchemaSummary]
				), nil)
			})
	}

	func retrieveSchemaDetails(
		schemaId: String,
		callback: @escaping ApiResult<MerchantSchema>
	) {
		let api = createMerchantApi()

		api.getMerchantSchemaDetails(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			schemaId: schemaId,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantSchema(schema: result!.data), nil)
			})
	}

	func createSchema(
		schema: MerchantSchema,
		callback: @escaping ApiResult<MerchantSchemaSummary>
	) {
		let api = createMerchantApi()

		let body = OAIMerchantSchema()
		body.data = OAIMerchantSchemaData()
		body.data.schema = (schema.schema() as! [String: NSObject])
		body.data.type = schema.type()
		body.data._description = schema.description()

		api.createMerchantSchema(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			merchantSchema: body,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiMerchantSchemaSummary(summary: result!.data), nil)
			})
	}

	func createPaymentSession(
		request: CreatePaymentSessionRequest,
		callback: @escaping ApiResult<CreatePaymentSessionResult>
	) {
		let api = createMerchantApi()

		let body = OAICreatePaymentSessionRequest()
		body.data = OAIMerchantPaymentSessionData()
		body.data.location = request.location()
		body.data.additionalInfo = toDynamicPayload(payload: request.additionalInfo())
		body.data.generateQR = request.generateQR() as NSNumber
		body.data.timeToLivePaymentSession = request.timeToLivePaymentSession() as NSNumber?
		body.data.timeToLiveQR = request.timeToLiveQR() as NSNumber?

		api.createCustomerPaymentSession(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			createPaymentSessionRequest: body,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiCreatePaymentSessionResult(result: result!.data), nil)
			})
	}

	func retrievePaymentSession(
		paymentSessionId: String,
		callback: @escaping ApiResult<PaymentSession>
	) {
		let api = createMerchantApi()

		api.getMerchantPaymentSession(
			withXMerchantID: self.getDefaultHeader(client: api.apiClient, name: X_WALLET_ID),
			paymentSessionId: paymentSessionId,
			completionHandler: { result, error in
				guard error == nil else {
					return callback(nil, self.extractHttpResponse(error: error! as NSError))
				}

				callback(OpenApiPaymentSession(session: result!.data), nil)
			})
	}

	func checkHealth(callback: @escaping ApiResult<HeathCheck>) {
		let api = createAdministrationApi()

		api.checkHealth(completionHandler: { result, error in
			guard error == nil else {
				return callback(nil, self.extractHttpResponse(error: error! as NSError))
			}

			callback(OpenApiHealthCheck(check: result!.data), nil)
		})
	}
}
