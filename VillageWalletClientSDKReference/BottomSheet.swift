import UIKit

enum BottomSheetViewState {
	case expanded
	case normal
}

@IBDesignable
class BottomSheet: UIView {
	private let viewState : BottomSheetViewState = .normal

	@IBInspectable var marginTop : CGFloat = 0

	@IBInspectable var peekHeight: CGFloat = 0 {
		didSet {
			updateHeight(height: peekHeight)
		}
	}

	@IBInspectable var radius: CGFloat = 0 {
		didSet {
			roundCorners()
		}
	}

	// the current height of the sheet
	var sheetHeight: NSLayoutConstraint?
	var maxSheetHeight: CGFloat?

	// when a gesture starts we need to record the height of the sheet
	var startingHeight: CGFloat?

	override init(frame: CGRect) {
		super.init(frame: frame)

		createConstraints()
		addPanGesture()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		createConstraints()
		addPanGesture()
	}


	// TODO: This should be added automatically
	func addPanGesture() {
		// add pan gesture recognizer to the view controller's view (the whole screen)
		let viewPan = UIPanGestureRecognizer(target: self, action: #selector(viewPanned(_:)))

		/*
		 * By default iOS will delay the touch before recording the drag/pan information
		 * we want the drag gesture to be recorded down immediately, hence setting no delay
		 */
		viewPan.delaysTouchesBegan = false
		viewPan.delaysTouchesEnded = false

		self.addGestureRecognizer(viewPan)
	}

	@IBAction func viewPanned(_ panRecognizer: UIPanGestureRecognizer) {
		// how much distance has user dragged the card view?
		// positive number means user dragged downward
		// negative number means user dragged upward
		let translation = panRecognizer.translation(in: self)

		guard let maxSheetHeight = self.maxSheetHeight else {
			guard
				let safeAreaHeight = UIApplication.shared.keyWindow?.safeAreaLayoutGuide.layoutFrame.size.height,
				let bottomPadding = UIApplication.shared.keyWindow?.safeAreaInsets.bottom
				else {
					fatalError("Can't calculate max height")
				}

			self.maxSheetHeight = (safeAreaHeight + bottomPadding) - marginTop

			// since we can't fall through with a guard, use recursion
			return viewPanned(panRecognizer)
		}

		switch panRecognizer.state {
			case .began:
				startingHeight = sheetHeight?.constant ?? 0

			case .changed:
				let newHeight: CGFloat = startingHeight! - translation.y

				if (newHeight < peekHeight) {
					return
				}

				if (newHeight > maxSheetHeight) {
					return
				}

				updateHeight(height: newHeight)

			default:
				break
		}
	}

	private func createConstraints() {
		sheetHeight = heightAnchor.constraint(equalToConstant: 0)
		sheetHeight?.isActive = true
	}

	private func updateHeight(height: CGFloat) {
		// print("Updating height to \(height)")

		sheetHeight?.constant = height
	}

	private func roundCorners() {
		layer.cornerRadius = radius;
		layer.masksToBounds = true;
		layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner ]
	}
}
