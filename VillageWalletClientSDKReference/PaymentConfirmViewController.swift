import UIKit

class PaymentConfirmViewController: UIViewController, SlideToPayDelegate {
	@IBOutlet weak var action: UILabel!
	@IBOutlet weak var bottomSheet: BottomSheet!
    
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)

		if (segue.identifier == "AddSlideToPay") {
			guard let slideToPay = segue.destination as? SlideToPay else {
				fatalError("Destination is not SlideToPay")
			}

			slideToPay.delegate = self
		}

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

	func makePayment() {
		action.text = "Paying"

		setTimeout(2) {
			self.performSegue(withIdentifier: "ShowReceipt", sender: self)
		}
	}

	func onSwiped() {
		UIView.animate(withDuration: 0.2, animations: {
			/*
	     * If we fade the view, the contents also disappears. So fade the background instead
	     */
			self.bottomSheet.backgroundColor = self.bottomSheet.backgroundColor?.withAlphaComponent(0)
		})

		makePayment()
	}

	private func setTimeout(_ delay: TimeInterval, block: @escaping () -> Void) -> Timer {
		return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
	}
}

