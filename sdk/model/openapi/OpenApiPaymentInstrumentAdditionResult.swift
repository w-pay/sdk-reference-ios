import UIKit
import VillageOpenApiClient

class OpenApiPaymentInstrumentAdditionResult: PaymentInstrumentAdditionResult {
	private let result: OAIInitiatePaymentInstrumentAdditionResultsData

	init(result: OAIInitiatePaymentInstrumentAdditionResultsData) {
		self.result = result
	}

	func cardCaptureURL() -> String {
		result.cardCaptureURL
	}

	func transactionRef() -> String? {
		result.transactionRef
	}
}
