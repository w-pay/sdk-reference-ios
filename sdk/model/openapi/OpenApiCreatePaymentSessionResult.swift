import UIKit
import VillageOpenApiClient

class OpenApiCreatePaymentSessionResult: CreatePaymentSessionResult {
	private let result: OAICreateMerchantPaymentSessionResponseData

	init(result: OAICreateMerchantPaymentSessionResponseData) {
		self.result = result
	}

	func paymentSessionId() -> String {
		result.paymentSessionId
	}

	func qr() -> QRCode? {
		guard let qr = result.qr else {
			return nil
		}

		return OpenApiQRCode(code: qr)
	}
}
