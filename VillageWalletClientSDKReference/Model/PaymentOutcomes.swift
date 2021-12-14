enum PaymentOutcomes {
	case noOutcome
	case inProgress
	case success
	case failure(reason: String)
}

extension PaymentOutcomes {
	func canMakePayment() -> Bool {
		switch (self) {
			case .noOutcome: return true
			default: return false
		}
	}
}
