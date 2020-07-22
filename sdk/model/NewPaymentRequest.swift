import UIKit

protocol NewPaymentRequest {
	func merchantReferenceId() -> String
	func grossAmount() -> NSNumber
	func generateQR() -> Bool
	func maxUses() -> Int?
	func timeToLivePayment() -> Int?
	func timeToLiveQR() -> Int?
	func specificWalletId() -> String?
	func basket() -> Basket?
	func posPayload() -> PosPayload?
	func merchantPayload() -> MerchantPayload?
}
