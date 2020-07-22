import UIKit

protocol PaymentInstrumentAdditionResult {
	func cardCaptureURL() -> String

	func transactionRef() -> String?
}
