import UIKit

protocol RequestHeadersFactory {
	func createHeaders() -> [String: String]
}
