import UIKit
import OpenAPIClient

class OpenApiCustomerPaymentDetails: CustomerPaymentDetails {
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

	func grossAmount() -> NSNumber {
		customerPaymentDetails.grossAmount
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
