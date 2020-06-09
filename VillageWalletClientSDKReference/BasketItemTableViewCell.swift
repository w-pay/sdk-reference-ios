import UIKit

class BasketItemTableViewCell: UITableViewCell {
    @IBOutlet weak var basketItemDescription: UILabel!
    @IBOutlet weak var baketItemAmount: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
