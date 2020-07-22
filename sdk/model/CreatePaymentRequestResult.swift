import UIKit

protocol CreatePaymentRequestResult {
	func paymentRequestId() -> String

	func qr() -> QRCode?
}
