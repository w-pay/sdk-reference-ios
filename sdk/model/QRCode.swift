import UIKit

protocol QRCode {
	func qrId() -> String

	func referenceId() -> String

	func referenceType() -> QRCodePaymentReferenceType?

	func content() -> String

	func image() -> String

	func expiryTime() -> Date?
}
