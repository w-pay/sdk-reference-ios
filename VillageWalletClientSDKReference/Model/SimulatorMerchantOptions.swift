import VillageWalletSDK
import WPayFramesSDK

class SimulatorMerchantOptions : VillageMerchantOptions {
	let require3DSNPA: Bool
	let windowSize: AcsWindowSize

	init(
		apiKey: String,
		baseUrl: String,
		wallet: Wallet?,
		merchantId: String?,
		require3DSNPA: Bool,
		windowSize: AcsWindowSize
	) {
		self.require3DSNPA = require3DSNPA
		self.windowSize = windowSize
		super.init(apiKey: apiKey, baseUrl: baseUrl, wallet: wallet, merchantId: merchantId)
	}
}
