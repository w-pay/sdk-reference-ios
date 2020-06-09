import UIKit

class PaymentReceiptViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var amountPaid: UILabel!
	@IBOutlet weak var basketItems: UITableView!
	@IBOutlet weak var receipt: UIStackView!
    @IBOutlet weak var basketTotal: UILabel!
    @IBOutlet weak var tax: UILabel!
    
	var basket: Basket?

	override func viewDidLoad() {
		super.viewDidLoad()

		basketItems.dataSource = self
		basketItems.delegate = self

		basketItems.heightAnchor.constraint(equalTo: receipt.heightAnchor, multiplier: 0.7).isActive = true
	}

	/*
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			// Get the new view controller using segue.destination.
			// Pass the selected object to the new view controller.
	}
	*/

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		basket?.items.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: "BasketItemTableViewCell", for: indexPath) as? BasketItemTableViewCell
			else {
				fatalError("The dequeued cell is not an instance of BasketItemTableViewCell.")
		}

		let item = basket?.items[indexPath.row]
		cell.basketItemDescription.text = item!.description
		cell.baketItemAmount.text = item!.amount

		return cell
	}
}
