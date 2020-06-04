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

	private func setTimeout(_ delay: TimeInterval, block: @escaping () -> Void) -> Timer {
		return Timer.scheduledTimer(timeInterval: delay, target: BlockOperation(block: block), selector: #selector(Operation.main), userInfo: nil, repeats: false)
	}
}

