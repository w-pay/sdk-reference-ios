import VillageWalletSDK

class SimulatorCustomerOptions : VillageCustomerOptions {
	let customerId: String

	init(
		apiKey: String,
		baseUrl: String,
		wallet: Wallet?,
		walletId: String?,
		customerId: String
	) {
		self.customerId = customerId

		super.init(apiKey: apiKey, baseUrl: baseUrl, wallet: wallet, walletId: walletId)
	}
}
