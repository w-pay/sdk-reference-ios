import UIKit
import OpenAPIClient

class OpenApiPaymentSession: PaymentSession {
	private let session: OAIPaymentSession

	init(session: OAIPaymentSession) {
		self.session = session
	}

	func paymentSessionId() -> String {
		session.paymentSessionId
	}

	func merchantId() -> String {
		session.merchantId
	}

	func walletId() -> String? {
		session.walletId
	}

	func expiryTime() -> Date {
		session.expiryTime
	}

	func location() -> String {
		session.location
	}

	func additionalInfo() -> DynamicPayload {
		OpenApiDynamicPayload(payload: session.additionalInfo)
	}
}
