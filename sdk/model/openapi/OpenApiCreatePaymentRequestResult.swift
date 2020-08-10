import UIKit
import VillageOpenApiClient

class OpenApiCreatePaymentRequestResult: CreatePaymentRequestResult {
	private let result: OAICreatePaymentRequestResultsData

	init(result: OAICreatePaymentRequestResultsData) {
		self.result = result
	}

	func paymentRequestId() -> String {
		result.paymentRequestId
	}

	func qr() -> QRCode? {
		guard let qr = result.qr else {
			return nil
		}

		return OpenApiQRCode(code: qr)
	}
}
