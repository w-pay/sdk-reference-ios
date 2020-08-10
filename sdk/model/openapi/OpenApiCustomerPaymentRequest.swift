import UIKit
import VillageOpenApiClient

class OpenApiCustomerPaymentRequest: CustomerPaymentRequest {
	private let customerPaymentDetails: OAICustomerPaymentDetail

	init(customerPaymentDetails: OAICustomerPaymentDetail) {
		self.customerPaymentDetails = customerPaymentDetails
	}

	func paymentRequestId() -> String {
		customerPaymentDetails.paymentRequestId
	}

	func merchantReferenceId() -> String {
		customerPaymentDetails.merchantReferenceId
	}

	func grossAmount() -> Decimal {
		customerPaymentDetails.grossAmount.decimalValue
	}

	func merchantId() -> String {
		customerPaymentDetails.merchantId
	}

	func basket() -> Basket? {
		guard let basket = customerPaymentDetails.basket else {
			return nil
		}

		return OpenApiBasket(basket: basket)
	}
}
