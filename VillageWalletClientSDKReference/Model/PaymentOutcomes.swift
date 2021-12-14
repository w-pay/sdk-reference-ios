enum PaymentOutcomes {
	case noOutcome
	case success
	case failure(reason: String)
}
