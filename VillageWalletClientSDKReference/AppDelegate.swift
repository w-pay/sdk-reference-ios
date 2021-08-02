import UIKit
import VillageWalletSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	let sdk: VillageCustomerApiRepository

	override init() {
		// FIXME: The host should be set from the QR code contents.
		let origin = "https://dev.mobile-api.woolworths.com.au/wow/v1"

		let options = VillageCustomerOptions(
			apiKey: "95udD3oX82JScUQ1qyACSOMysyAl93Gb",
			baseUrl: "\(origin)/pay"
		)

		let authenticator = createCustomerLoginAuthenticator(options: options, origin: origin)
		sdk = createCustomerSDK(options: options, authenticator: authenticator)

		super.init()
	}

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
}
