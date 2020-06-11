import UIKit

protocol SlideToPayDelegate {
	func onSwiped();
}

class SlideToPay: UIViewController {
	@IBOutlet weak var background: SlideToPayBackground!
	@IBOutlet weak var button: UIImageView!
	@IBOutlet weak var text: UILabel!
	@IBOutlet weak var leadingEdgeConstraint: NSLayoutConstraint!

	var delegate: SlideToPayDelegate?

	private var margin: CGFloat?
	private var maxContraintConstant: CGFloat?
	private var previousTranslation: CGPoint?

	/** Whether or not we can move the button */
	private var locked: Bool = false

	override func viewDidLoad() {
		super.viewDidLoad()

		makeButtonCircular()
		addPanGesture()
	}

	/*
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			// Get the new view controller using segue.destination.
			// Pass the selected object to the new view controller.
	}
	*/

	@IBAction func viewPanned(_ panRecognizer: UIPanGestureRecognizer) {
		guard
			let margin = margin,
			let maxConstant = maxContraintConstant
			else {
				print("background: \(background.bounds.width)")
				print("button: \(button.bounds.width)")
				self.margin = leadingEdgeConstraint.constant
				self.maxContraintConstant = background.frame.width - button.frame.width - self.margin!

				return viewPanned(panRecognizer)
		}

		switch panRecognizer.state {
			case .began:
				previousTranslation = CGPoint(x: 0, y: 0)

			case .changed:
				// how much distance has user dragged the button?
				// positive number means user dragged leftward
				// negative number means user dragged rightward
				let translation = panRecognizer.translation(in: button)

				if (!locked) {
					moveButton(translation: translation)
					adjustTextAlpha()
				}

			case .ended:
				if (leadingEdgeConstraint.constant < maxConstant) {
					leadingEdgeConstraint.constant = margin
					text.alpha = 1
				}

			default:
				break
		}
	}

	private func moveButton(translation: CGPoint) {
		guard let margin = margin, let maxConstant = maxContraintConstant else {
			fatalError("You should have set the optionals by calling this")
		}

		let diff: CGFloat = translation.x - previousTranslation!.x
		let newConstraintConstant = leadingEdgeConstraint.constant + diff

		previousTranslation = translation

		// print("edge: \(leadingEdgeConstraint.constant), diff: \(diff)")

		if (newConstraintConstant < margin) {
			return
		}

		if (newConstraintConstant > maxConstant) {
			if (!locked) {
				locked = true

				leadingEdgeConstraint.constant = maxConstant
				delegate?.onSwiped()
			}

			return
		}

		leadingEdgeConstraint.constant = newConstraintConstant
	}

	private func adjustTextAlpha() {
		text.alpha = 1 - 1.3 * (button.frame.minX + button.frame.width) / maxContraintConstant!
	}

	private func addPanGesture() {
		// add pan gesture recognizer to the view controller's view (the whole screen)
		let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))

		/*
		 * By default iOS will delay the touch before recording the drag/pan information
		 * we want the drag gesture to be recorded down immediately, hence setting no delay
		 */
		viewPan.delaysTouchesBegan = false
		viewPan.delaysTouchesEnded = false

		button.addGestureRecognizer(viewPan)
	}

	private func makeButtonCircular() {
		button.layer.cornerRadius = button.frame.height / 2
	}
}
