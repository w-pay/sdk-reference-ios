import UIKit

protocol PosPayload {
	func schemaId() -> String?

	func payload() -> [String: AnyObject]
}
