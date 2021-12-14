import DownPicker
import UIKit
import VillageWalletSDK
import WPayFramesSDK

private let envs: [WPayEnvironment] = [
	WPayEnvironment(text: "Dev 1", baseUrl: "https://dev.mobile-api.woolworths.com.au"),
	WPayEnvironment(text: "UAT", baseUrl: "https://test.mobile-api.woolworths.com.au")
]

private let threeDSWindowSizes: [ThreeDSWindowSizes] = [
	ThreeDSWindowSizes(size: AcsWindowSize.ACS_250x400, displaySize: "250x400"),
	ThreeDSWindowSizes(size: AcsWindowSize.ACS_390x400, displaySize: "390x400"),
	ThreeDSWindowSizes(size: AcsWindowSize.ACS_500x600, displaySize: "500x600"),
	ThreeDSWindowSizes(size: AcsWindowSize.ACS_600x400, displaySize: "600x400"),
	ThreeDSWindowSizes(size: AcsWindowSize.ACS_FULL_PAGE, displaySize: "Full Page")
]

class WPaySettings: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var settingsView: UIStackView!

	@IBOutlet weak var envPickerField: UITextField!
	@IBOutlet weak var windowSizePickerField: UITextField!

	@IBOutlet weak var merchantId: UITextField!
	@IBOutlet weak var merchantApiKey: UITextField!
	@IBOutlet weak var require3DSNPA: UISwitch!
	@IBOutlet weak var require3DSPA: UISwitch!
	@IBOutlet weak var userId: UITextField!
	@IBOutlet weak var customerApiKey: UITextField!
	@IBOutlet weak var useEverydayPay: UISwitch!
	@IBOutlet weak var total: UITextField!
	@IBOutlet weak var maxUses: UITextField!
	@IBOutlet weak var fraudChecking: UISwitch!

	private var envPicker: DownPicker?
	private var windowSizePicker: DownPicker?

	private let appDelegate = UIApplication.shared.delegate as! AppDelegate

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		envPicker = DownPicker(textField: envPickerField, withData: envs.map({ env in env.text }))
		envPicker?.text = envs[0].text

		windowSizePicker = DownPicker(
			textField: windowSizePickerField,
			withData: threeDSWindowSizes.map({ size in size.displaySize })
		)
		windowSizePicker?.text = threeDSWindowSizes[0].displaySize
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		addSettingsViewToScrollView()
		setDefaultProps();
	}

	@IBAction func createNewPaymentRequest(_ sender: Any) {
		appDelegate.onCreatePaymentRequest(
			merchant: SimulatorMerchantOptions(
				apiKey: merchantApiKey.text!,
				baseUrl: selectedEnv().baseUrl,
				wallet: selectedWallet(),
				merchantId: merchantId.text,
				require3DSNPA: require3DSNPA.isOn,
				windowSize: selectedWindowSize()
			),
			customer: SimulatorCustomerOptions(
				apiKey: customerApiKey.text!,
				baseUrl: selectedEnv().baseUrl,
				wallet: selectedWallet(),
				walletId: "",
				customerId: userId.text!
			),
			paymentRequest: SimulatorPaymentRequest(
				grossAmount: Decimal(string: total.text!)!,
				maxUses: Int(maxUses.text!),
				require3DSPA: require3DSPA.isOn,
				fraudPayload: requiresFraudPayload()
			)
		) {
			let paymentDetails = self.storyboard!.instantiateViewController(identifier: "PaymentDetails")
			paymentDetails.modalPresentationStyle = .fullScreen

			self.present(paymentDetails, animated: true, completion: nil)
		}

		(sender as? UIButton)?.isEnabled = false
	}
    
	private func setDefaultProps() {
		merchantId.text = "aMerchant"
		merchantApiKey.text = "dfdafasfdasfadfads"
		require3DSNPA.setOn(false, animated: false)
		require3DSPA.setOn(false, animated: false)
		userId.text = "1234563455633"
		customerApiKey.text = "dvdsdfggadaa"
		useEverydayPay.setOn(false, animated: false)
		total.text = "12.40"
		maxUses.text = "3"
		fraudChecking.setOn(false, animated: false)
	}

	private func addSettingsViewToScrollView() {
		/*
		 * Embed the settings view into the scroll view.
		 *
		 * See https://medium.com/@hassanahmedkhan/scrolling-the-hell-out-of-stackview-33d239f9f38e
		 */
		scrollView.addSubview(settingsView)
		settingsView.translatesAutoresizingMaskIntoConstraints = false

		settingsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
		settingsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
		settingsView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
		settingsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true

		settingsView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
	}

	private func selectedEnv() -> WPayEnvironment {
		envs.first(where: { env in env.text == envPicker?.text })!
	}

	private func selectedWallet() -> Wallet {
    if (useEverydayPay.isOn) {
	    return Wallet.EVERYDAY_PAY
    }

		return Wallet.MERCHANT
	}

	private func selectedWindowSize() -> AcsWindowSize {
		threeDSWindowSizes
			.first(where: { window in window.displaySize == windowSizePicker?.text })!
		  .size
	}

	private func requiresFraudPayload() -> FraudPayload? {
		if (fraudChecking.isOn) {
			return SimulatorFraudPayload()
		}

		return nil
	}
}

extension UIViewController {
	var storyboardId: String {
		value(forKey: "storyboardIdentifier") as! String
	}
}

private class WPayEnvironment {
	public let text: String
	public let baseUrl: String

	init(text: String, baseUrl: String) {
		self.text = text
		self.baseUrl = baseUrl
	}
}

private class ThreeDSWindowSizes {
	public let size: AcsWindowSize
	public let displaySize: String

	init(size: AcsWindowSize, displaySize: String) {
		self.size = size
		self.displaySize = displaySize
	}
}

private class SimulatorFraudPayload : FraudPayload {
	var message: String = """
    <?xml version="1.0" encoding="utf-8" ?><requestMessage xmlns="urn:schemas-cybersource-com:transaction-data-1.101"><!-- TODO: Fill me --></requestMessage>
  """

	var provider: String = "cybersource"

	var format: FraudPayloadFormat = FraudPayloadFormat.XML

	var responseFormat: FraudPayloadFormat = FraudPayloadFormat.XML

	var version: String = "CyberSourceTransaction_1.101"
}
