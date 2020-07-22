import UIKit
import OpenAPIClient

class OpenApiUsedPaymentInstrument: CustomerTransactionUsedPaymentInstrument {
	private let instrument: OAICustomerTransactionSummaryAllOfInstruments

	init(instrument: OAICustomerTransactionSummaryAllOfInstruments) {
		self.instrument = instrument
	}

	func paymentInstrumentId() -> String {
		instrument.paymentInstrumentId
	}

	func amount() -> NSNumber {
		instrument.amount
	}

	func paymentTransactionRef() -> String? {
		instrument.paymentTransactionRef
	}
}
