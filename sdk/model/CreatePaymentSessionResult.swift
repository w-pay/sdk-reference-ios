import UIKit

protocol CreatePaymentSessionResult {
	func paymentSessionId() -> String

	func qr() -> QRCode?
}
