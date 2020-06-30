import UIKit

protocol RequestHeaderFactory {
	func addHeaders(headers: inout [String: String]) -> Void
}
