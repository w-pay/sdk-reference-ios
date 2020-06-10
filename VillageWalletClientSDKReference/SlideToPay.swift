import UIKit

class SlideToPay: UIViewController {
	@IBOutlet weak var button: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()

		button.layer.cornerRadius = button.frame.height / 2
	}

	/*
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			// Get the new view controller using segue.destination.
			// Pass the selected object to the new view controller.
	}
	*/
}
