import UIKit
import OpenAPIClient

class OpenApiQRCode: QRCode {
	private let code: OAIQr

	init(code: OAIQr) {
		self.code = code
	}

	func qrId() -> String {
		code.qrId
	}

	func referenceId() -> String {
		code.referenceId
	}

	func referenceType() -> QRCodePaymentReferenceType? {
		QRCodePaymentReferenceType.valueOf(value: code.referenceType)
	}

	func content() -> String {
		code.content
	}

	func image() -> String {
		code.image
	}

	func expiryTime() -> Date? {
		code.expiryTime
	}
}
