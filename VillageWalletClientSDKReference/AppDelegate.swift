import SnackBar_swift
import UIKit
import VillageWalletSDK
import WPayFramesSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var customerSDK: VillageCustomerApiRepository?
	var merchantSDK: VillageMerchantApiRepository?
	var framesConfig: FramesConfig?

	var paymentRequest: MerchantPaymentDetails?
	var paymentInstruments: [CreditCard]?
	var require3DSNPA: Bool = false
	var customerWallet: Wallet?
	var windowSize: AcsWindowSize?

	private var fraudPayload: FraudPayload?
	private var challengeResponses: [WPayFramesSDK.ChallengeResponse] = []

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}

	func onError(error: Any) {
		/*
		 * Make sure we're on the main thread in case this called from another thread.
		 */
		DispatchQueue.main.async {
			let message = "Something went wrong. Check the console."
			let view: UIView = (UIApplication.shared.windows.first?.rootViewController?.view)!

			print("[PaymentSimulator]: \(error)")

			SnackBar.make(in: view, message: message, duration: .lengthLong).show()
		}
	}

	public func listPaymentInstruments(next: @escaping () -> Void) {
		customerSDK?.instruments.list { result in
			switch(result) {
				case .failure(let error):
					return self.onError(error: error)

				case .success(let data):
					var cards: [CreditCard]

					if (self.customerSDK?.options.wallet == Wallet.EVERYDAY_PAY) {
						cards = data.everydayPay?.creditCards ?? []
					}
					else {
						cards = data.creditCards
					}

					self.paymentInstruments = cards

					next()
				}
		}
	}

	func onCreatePaymentRequest(
		merchant: SimulatorMerchantOptions,
		customer: SimulatorCustomerOptions,
		paymentRequest: SimulatorPaymentRequest,
		next: @escaping () -> Void
	) {
		fraudPayload = paymentRequest.fraudPayload

		authenticateCustomer(customer: customer, next: { authToken in
			self.createSDKs(merchant: merchant, customer: customer, authToken: authToken)

			self.createPaymentRequest(
				paymentRequest: paymentRequest,
			  next: { self.listPaymentInstruments(next: next) }
			)
		})
	}

	private func authenticateCustomer(
		customer: SimulatorCustomerOptions,
		next: @escaping (String) -> Void
	) {
		let authenticator = VillageFactory.createCustomerLoginAuthenticator(options: customer)

		authenticator.authenticate(completion: { result in
			switch (result) {
			case .failure(let error):
				return self.onError(error: error)

			case .success(let token):
				next(token.accessToken)
			}
		})
	}

	private func createPaymentRequest(
		paymentRequest: NewPaymentRequest,
		next: @escaping () -> Void
	) {
		merchantSDK?.payments.createPaymentRequest(
			paymentRequest: paymentRequest,
			completion: { (result) in
				switch(result) {
					case .failure(let error):
						return self.onError(error: error)

					case .success(let data):
						self.getPaymentRequest(paymentRequestId: data.paymentRequestId, next: next)
				}
			}
		)
	}

	private func getPaymentRequest(
		paymentRequestId: String,
		next: @escaping () -> Void
	) {
		merchantSDK?.payments.getPaymentRequestDetailsBy(
			paymentRequestId: paymentRequestId,
			completion: { (result) in
				switch(result) {
				case .failure(let error):
					return self.onError(error: error)

				case .success(let data):
					self.paymentRequest = data
					next()
				}
			}
		)
	}

	private func createSDKs(
		merchant: SimulatorMerchantOptions,
		customer: SimulatorCustomerOptions,
		authToken: String
	) {
		createCustomerSDK(customer: customer, authToken: authToken)
		createMerchantSDK(merchant: merchant, customer: customer, authToken: authToken)
		createFramesConfig(customer: customer, authToken: authToken)
	}

	private func createCustomerSDK(
		customer: SimulatorCustomerOptions,
		authToken: String
	) {
		customerWallet = customer.wallet

		let options = VillageCustomerOptions(
			apiKey: customer.apiKey,
			baseUrl: sdkBaseUrl(customer.baseUrl),
			wallet: customer.wallet,
			walletId: customer.walletId
		)

		customerSDK = VillageFactory.createCustomerSDK(
			options: options,
			token: authToken
		)
	}

	private func createMerchantSDK(
		merchant: SimulatorMerchantOptions,
		customer: SimulatorCustomerOptions,
		authToken: String
	) {
		windowSize = merchant.windowSize
		require3DSNPA = merchant.require3DSNPA

		let options = VillageMerchantOptions(
			apiKey: customer.apiKey,
			baseUrl: sdkBaseUrl(merchant.baseUrl),
			wallet: customer.wallet
		)

		merchantSDK = VillageFactory.createMerchantSDK(
			options: options,
			token: authToken
		)
	}

	private func createFramesConfig(customer: SimulatorCustomerOptions, authToken: String) {
		framesConfig = FramesConfig(
			apiKey: customer.apiKey,
			authToken: "Bearer \(authToken)",
			apiBase: "\(sdkBaseUrl(customer.baseUrl))/instore",
			logLevel: LogLevel.DEBUG
		)
	}

	private func sdkBaseUrl(_ origin: String) -> String {
		"\(origin)/wow/v1/pay"
	}
}