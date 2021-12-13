import VillageWalletSDK

enum PaymentOptions {
	case noOption
	case newCard(valid: Bool)
	case existingCard(card: CreditCard?)
}

extension PaymentOptions {
	func isValid() -> Bool {
		switch (self) {
			case .noOption:
				return false

			case .newCard(let valid):
				return valid

			case .existingCard(let card):
				return card != nil
		}
	}
}
