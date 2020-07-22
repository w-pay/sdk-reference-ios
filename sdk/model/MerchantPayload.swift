import UIKit

protocol MerchantPayload {
	func schemaId() -> String?

	func payload() -> [String: AnyObject]
}
