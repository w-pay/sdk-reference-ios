import UIKit

class PaymentConfirmViewController: UIViewController {
	@IBOutlet weak var action: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func makePayment(_ sender: UIButton) {
		action.text = "Paying"

		setTimeout(2) {
			self.performSegue(withIdentifier: "ShowReceipt", sender: self)
		}
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)

		if (segue.identifier == "ShowReceipt") {
			let basket = Basket()
			basket.items.append(BasketItem(amount: "$3.00", description: "WW Creamy Pumpkin Soup 300g"))
			basket.items.append(BasketItem(amount: "$2.33", description: "Cheese and Chive Triangle Single"))
			basket.items.append(BasketItem(amount: "$4.60", description: "Dairy Farmers Daily 2L"))
			basket.items.append(BasketItem(amount: "$7.85", description: "Primo TSMK Bacon 200g"))
			basket.items.append(BasketItem(amount: "$0.69", description: "Gourmet Tomatoes per kg 0.100 kg NET @ $6.90/kg"))

			guard let navigationController = segue.destination as? UINavigationController else {
				fatalError("Destination is not a UINavigationController")
			}

			guard let paymentReceiptController = navigationController.topViewController as? PaymentReceiptViewController else {
				fatalError("Can't get the Payment Receipt Controller")
			}

			paymentReceiptController.basket = basket
		}
	}

	private func setTimeout(_ delay: TimeInterval, block: @escaping () -> Void) -> Timer {
		return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
	}
}

