import UIKit

class WalletIdRequestHeader: RequestHeaderFactory {
	func addHeaders(headers: inout [String: String]) -> Void {
		headers[X_WALLET_ID] = "10006"
	}
}