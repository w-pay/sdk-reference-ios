import XCTest
import Hamcrest

@testable import VillageWalletClientSDKReference

class VillageMerchantApiRepositoryTest: VillageApiRepositoryTest {
	private let apiFactory = OpenApiSdkFactory()
	private var api: VillageMerchantApiRepository!

	override func setUpWithError() throws {
		api = apiFactory.createMerchantApi()
		api.setHost(host: "http://localhost:8080")

		try super.tearDownWithError()
	}

	override func tearDownWithError() throws {
		api = nil

		try super.tearDownWithError()
	}

	func testShouldRetrieveTransactions() {
		let startTime = Date.parseISO("2017-11-06T19:38:09.890+11:00")!
		let endTime = Date.parseISO("2017-11-06T19:38:09.890+11:00")!
		let pageSize = 20
		let page = 2

		let promise = apiResultExpectation()
		var result: MerchantTransactionSummaries!

		api.retrieveTransactions(
			page: page,
			pageSize: pageSize,
			endTime: endTime,
			startTime: startTime,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantTransactionSummaries())
	}

	func testShouldRetrieveTransactionDetails() {
		let transactionId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()
		var result: MerchantTransactionDetails!

		api.retrieveTransactionDetails(
			transactionId: transactionId,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantTransactionDetails())
	}

	func testShouldCreatePaymentRequestQRCode() {
		let promise = apiResultExpectation()
		var result: QRCode!

		api.createPaymentRequestQRCode(
			details: aNewPaymentRequestQRCode(),
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isAQrCode())
	}

	func testShouldRetrievePaymentRequestQRCodeContent() {
		let qrCodeId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()
		var result: QRCode!

		api.retrievePaymentRequestQRCodeContent(
			qrCodeId: qrCodeId,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isAQrCode())
	}

	func testShouldCancelPaymentQRCode() {
		let qrCodeId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()

		api.cancelPaymentQRCode(
			qrCodeId: qrCodeId,
			callback: isSuccessful(promise: promise)
		)

		wait(for: [promise], timeout: 2)
	}

	func testShouldRetrievePaymentList() {
		let type = "ALL"
		let pageSize = 50
		let page = 2

		let promise = apiResultExpectation()
		var result: MerchantPaymentSummaries!

		api.retrievePaymentList(
			type: type,
			page: page,
			pageSize: pageSize,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantPaymentSummaries())
	}

	func testShouldCreateNewPaymentRequest() {
		let request = aNewPaymentRequest()

		let promise = apiResultExpectation()
		var result: CreatePaymentRequestResult!

		api.createNewPaymentRequest(
			paymentRequest: request,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasPaymentRequestCreated())
	}

	func testShouldRetrievePaymentRequestDetails() {
		let paymentRequestId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()
		var result: MerchantPaymentDetails!

		api.retrievePaymentRequestDetails(
			paymentRequestId: paymentRequestId,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantPaymentDetails())
	}

	func testShouldDeletePaymentRequest() {
		let paymentRequestId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()

		api.deletePaymentRequest(
			paymentRequestId: paymentRequestId,
			callback: isSuccessful(promise: promise)
		)

		wait(for: [promise], timeout: 2)
	}

	func testShouldRefundTransaction() {
		let transactionId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()
		var result: MerchantTransactionSummary!

		api.refundTransaction(
			transactionId: transactionId,
			refundDetails: aNewTransactionRefund(),
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantTransactionSummary())
	}

	func testShouldRetrievePreferences() {
		let promise = apiResultExpectation()
		var result: MerchantPreferences!

		api.retrievePreferences(callback: isSuccessfulWith(callback: { value, response in
			result = value

			promise.fulfill()
		}))

		wait(for: [promise], timeout: 2)

		assertThat(result, hasEntry(
			equalTo("preferenceGroup"), hasEntry(
			  equalTo("preference"),
				not(blankOrNilString())
			)
		))
	}

	func testShouldSetPreferences() {
		let promise = apiResultExpectation()

		api.setPreferences(
			preferences: [
				"preferenceGroup": [
					"preference": "value"
				]
			],
			callback: isSuccessful(promise: promise)
		)

		wait(for: [promise], timeout: 2)
	}

	func testShouldRetrieveSchemas() {
		let promise = apiResultExpectation()
		var result: MerchantSchemaSummaries!

		api.retrieveSchemas(
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantSchemaSummaries())
	}

	func testShouldRetrieveSchemaDetails() {
		let schemaId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()
		var result: MerchantSchema!

		api.retrieveSchemaDetails(
			schemaId: schemaId,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantSchema())
	}

	func testShouldCreateSchema() {
		let promise = apiResultExpectation()
		var result: MerchantSchemaSummary!

		api.createSchema(
			schema: aNewSchema(),
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isMerchantSchemaSummary())
	}

	func testShouldCreatePaymentSession() {
		let promise = apiResultExpectation()
		var result: CreatePaymentSessionResult!

		api.createPaymentSession(
			request: TestCreatePaymentSessionRequest(),
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasPaymentSessionCreated())
	}

	func testShouldRetrievePaymentSession() {
		let paymentSessionId = "a5bbfe1a-c1b9-11ea-924f-33c96a9759eb"

		let promise = apiResultExpectation()
		var result: PaymentSession!

		api.retrievePaymentSession(
			paymentSessionId: paymentSessionId,
			callback: isSuccessfulWith(callback: { value, response in
				result = value

				promise.fulfill()
			})
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasPaymentSession())
	}

	func testShouldCheckHealth() {
		let promise = apiResultExpectation()
		var result: HealthCheck!

		api.checkHealth(callback: isSuccessfulWith { (value: HealthCheck?, response) in
			result = value

			promise.fulfill()
		})

		wait(for: [promise], timeout: 2)

		assertThat(result, isHealthyService())
	}
}
