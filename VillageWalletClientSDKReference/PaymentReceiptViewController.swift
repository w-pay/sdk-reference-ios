import UIKit

class PaymentReceiptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var amountPaid: UILabel!
	@IBOutlet weak var paymentInstrument: UILabel!
	@IBOutlet weak var basketItems: UITableView!
	@IBOutlet weak var receipt: UIStackView!
	@IBOutlet weak var basketTotal: UILabel!
	@IBOutlet weak var basketCount: UILabel!
	@IBOutlet weak var tax: UILabel!
    
	var paymentDetails: CustomerPaymentDetails?
	var usedPaymentInstrument: PaymentInstrument?

	override func viewDidLoad() {
		super.viewDidLoad()

		basketItems.dataSource = self
		basketItems.delegate = self

		basketItems.heightAnchor.constraint(equalTo: receipt.heightAnchor, multiplier: 0.7).isActive = true

		amountPaid.text = formatCurrency(value: paymentDetails?.grossAmount() ?? 0)
		paymentInstrument.text = "Credit Card **** \(usedPaymentInstrument?.cardSuffix() ?? "")"
		basketCount.text = "\(paymentDetails?.basket()?.items().count ?? 0) Items"
		basketTotal.text = amountPaid.text
		tax.text = formatCurrency(value: calculateGST(total: paymentDetails?.grossAmount() ?? 0))
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		paymentDetails?.basket()?.items().count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: "BasketItemTableViewCell", for: indexPath) as? BasketItemTableViewCell
			else {
				fatalError("The dequeued cell is not an instance of BasketItemTableViewCell.")
		}

		let item: BasketItem! = (paymentDetails?.basket()?.items()[indexPath.row] as! BasketItem)
		cell.basketItemDescription.text = item.label()
		cell.baketItemAmount.text = formatCurrency(value: item.totalPrice() ?? 0)

		return cell
	}

	private func calculateGST(total: NSNumber) -> NSNumber {
		total.doubleValue / 11.0 as NSNumber
	}
}
