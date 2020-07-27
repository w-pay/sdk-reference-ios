import UIKit

protocol PaymentInstrumentAddition {
	func clientReference() -> String

	func wallet() -> Wallet
}
