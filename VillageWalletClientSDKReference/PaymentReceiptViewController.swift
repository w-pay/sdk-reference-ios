import UIKit
import OpenAPIClient

class PaymentReceiptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var amountPaid: UILabel!
	@IBOutlet weak var basketItems: UITableView!
	@IBOutlet weak var receipt: UIStackView!
    @IBOutlet weak var basketTotal: UILabel!
    @IBOutlet weak var tax: UILabel!
    
	var basket: OAIBasket?

	override func viewDidLoad() {
		super.viewDidLoad()

		basketItems.dataSource = self
		basketItems.delegate = self

		basketItems.heightAnchor.constraint(equalTo: receipt.heightAnchor, multiplier: 0.7).isActive = true
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		basket?.items.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: "BasketItemTableViewCell", for: indexPath) as? BasketItemTableViewCell
			else {
				fatalError("The dequeued cell is not an instance of BasketItemTableViewCell.")
		}

		let item: OAIBasketItems? = basket?.items[indexPath.row] as? OAIBasketItems
		cell.basketItemDescription.text = item!.label
		cell.baketItemAmount.text = formatCurrency(value: item!.totalPrice)

		return cell
	}
}
