import UIKit

@IBDesignable
class SlideToPayBackground: UIView {
	@IBInspectable var corners: CGFloat = 0 {
		didSet {
			roundCorners()
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		drawBorder()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)

		drawBorder()
	}

	private func drawBorder() {
		layer.borderWidth = 1
		layer.borderColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 0.2).cgColor
	}

	private func roundCorners() {
		layer.cornerRadius = corners;
		layer.masksToBounds = true;
		layer.maskedCorners = [
			.layerMinXMinYCorner,
			.layerMaxXMinYCorner,
			.layerMinXMaxYCorner,
			.layerMaxXMaxYCorner
		]
	}
}
