import XCTest
import Hamcrest

@testable import VillageWalletClientSDKReference

class VillageCustomerApiRepositoryTest: XCTestCase {
	private let apiFactory = OpenApiSdkFactory()
	private var api: VillageCustomerApiRepository!

	override func setUpWithError() throws {
		api = apiFactory.createCustomerApi()
		api.setHost(host: "http://localhost:8080")

		try super.tearDownWithError()
	}

	override func tearDownWithError() throws {
		api = nil

		try super.tearDownWithError()
	}

	func testShouldRetrieveTransactions() {
		let paymentRequestId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"
		let startTime = Date.parseISO("2017-11-06T19:38:09.890+11:00")!
		let endTime = Date.parseISO("2017-11-06T19:38:09.890+11:00")!
		let pageSize = 20
		let page = 2

		let promise = apiResultExpectation()
		var result: CustomerTransactionSummaries!

		api.retrieveTransactions(
			paymentRequestId: paymentRequestId,
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

		assertThat(result, isCustomerTransactionSummaries())
	}

	func testShouldRetrieveTransactionDetails() {
		let transactionId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"

		let promise = apiResultExpectation()
		var result: CustomerTransactionDetails!

		api.retrieveTransactionDetails(
			transactionId: transactionId,
			callback: isSuccessfulWith { (value: CustomerTransactionDetails?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isCustomerTransactionDetails())
	}

	func testShouldRetrievePaymentRequestDetailsByQRCode() {
		let qrCodeId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"

		let promise = apiResultExpectation()
		var result: CustomerPaymentRequest!

		api.retrievePaymentRequestDetailsByQRCode(
			qrCodeId: qrCodeId,
			callback: isSuccessfulWith { (value: CustomerPaymentRequest?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isCustomerPaymentRequest())
	}

	func testShouldRetrievePaymentRequestDetailsByRequestId() {
		let qrCodeId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"

		let promise = apiResultExpectation()
		var result: CustomerPaymentRequest!

		api.retrievePaymentRequestDetailsByRequestId(
			paymentRequestId: qrCodeId,

			callback: isSuccessfulWith { (value: CustomerPaymentRequest?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isCustomerPaymentRequest())
	}

	func testShouldMakePayment() {
		let promise = apiResultExpectation()
		var result: CustomerTransactionSummary!

		api.makePayment(
			paymentRequest: aNewCustomerPaymentRequest(),
			instrument: aSelectedPaymentInstrument(),
			callback: isSuccessfulWith { (value: CustomerTransactionSummary?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isCustomerTransactionSummary())
	}

	func testShouldRetrievePaymentInstruments() {
		let promise = apiResultExpectation()
		var result: AllPaymentInstruments!

		api.retrievePaymentInstruments(
			wallet: Wallet.MERCHANT,
			callback: isSuccessfulWith { (value: AllPaymentInstruments?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, isAllPaymentInstruments())
	}

	func testShouldInitiatePaymentInstrumentAddition() {
		let instrument = aNewPaymentInstrument()

		let promise = apiResultExpectation()
		var result: PaymentInstrumentAdditionResult!

		api.initiatePaymentInstrumentAddition(
			instrument: instrument,
			callback: isSuccessfulWith { (value: PaymentInstrumentAdditionResult?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasPaymentInstrumentAdded())
	}

	func testShouldRetrievePreferences() {
		let promise = apiResultExpectation()
		var result: CustomerPreferences!

		api.retrievePreferences(
			callback: isSuccessfulWith { (value: CustomerPreferences?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasEntry(equalTo("preferenceGroup"),
			hasEntry(equalTo("preference"), not(blankOrNilString()))
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

	func testShouldRetrieveCustomerPaymentSession() {
		let paymentSessionId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"

		let promise = apiResultExpectation()
		var result: PaymentSession!

		api.retrieveCustomerPaymentSession(
			paymentSessionId: paymentSessionId,
			callback: isSuccessfulWith { (value: PaymentSession?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasPaymentSession())
	}

	func testShouldRetrieveCustomerPaymentSessionByQR() {
		let qrCodeId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"

		let promise = apiResultExpectation()
		var result: PaymentSession!

		api.retrieveCustomerPaymentSessionByQR(
			qrCodeId: qrCodeId,
			callback: isSuccessfulWith { (value: PaymentSession?, response) in
				result = value

				promise.fulfill()
			}
		)

		wait(for: [promise], timeout: 2)

		assertThat(result, hasPaymentSession())
	}

	func testShouldUpdateCustomerPaymentSession() {
		let paymentSessionId = "75ba5b0b-7e5d-47fe-9508-29ca69fdb1d5"

		let promise = apiResultExpectation()

		api.updateCustomerPaymentSession(
			paymentSessionId: paymentSessionId,
			session: TestUpdatePaymentSessionRequest(),
			callback: isSuccessful(promise: promise)
		)

		wait(for: [promise], timeout: 2)
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

	func apiResultExpectation() -> XCTestExpectation {
		expectation(description: "API result")
	}
}
