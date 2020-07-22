import UIKit

protocol DynamicPayload {
	func schemaId() -> String?

	func payload() -> [String: AnyObject]
}
