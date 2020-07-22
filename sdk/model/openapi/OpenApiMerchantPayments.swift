import UIKit
import OpenAPIClient

class OpenApiMerchantPaymentSummaries: MerchantPaymentSummaries {
	private let thePayments: [OAIMerchantPaymentSummary]

	init(payments: [OAIMerchantPaymentSummary]) {
		self.thePayments = payments
	}

	func payments() -> [MerchantPaymentSummary] {
		thePayments.map { it in OpenApiMerchantPaymentSummary(payment: it) }
	}
}

class OpenApiMerchantPaymentSummary: MerchantPaymentSummary {
	private let payment: OAIMerchantPaymentSummary

	init(payment: OAIMerchantPaymentSummary) {
		self.payment = payment
	}

	func usesRemaining() -> Int? {
		payment.usesRemaining as? Int
	}

	func expiryTime() -> Date? {
		payment.expiryTime
	}

	func specificWalletId() -> String? {
		payment.specificWalletId
	}

	func paymentRequestId() -> String {
		payment.paymentRequestId
	}

	func merchantReferenceId() -> String {
		payment.merchantReferenceId
	}

	func grossAmount() -> NSNumber {
		payment.grossAmount
	}
}

class OpenApiMerchantPaymentDetails: MerchantPaymentDetails {
	private let details: OAIMerchantPaymentDetail

	init(details: OAIMerchantPaymentDetail) {
		self.details = details
	}

	func basket() -> Basket? {
		guard let basket = details.basket else {
			return nil
		}

		return OpenApiBasket(basket: basket)
	}

	func posPayload() -> PosPayload? {
		guard let payload = details.posPayload else {
		  return nil
		}

		return OpenApiPosPayload(thePayload: payload)
	}

	func merchantPayload() -> MerchantPayload? {
		guard let payload = details.merchantPayload else {
		  return nil
		}

		return OpenApiMerchantPayload(aPayload: payload)
	}

	func usesRemaining() -> Int? {
		details.usesRemaining as? Int
	}

	func expiryTime() -> Date? {
		details.expiryTime
	}

	func specificWalletId() -> String? {
		details.specificWalletId
	}

	func paymentRequestId() -> String {
		details.paymentRequestId
	}

	func merchantReferenceId() -> String {
		details.merchantReferenceId
	}

	func grossAmount() -> NSNumber {
		details.grossAmount
	}
}