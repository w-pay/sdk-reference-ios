import Foundation

extension Date {
	static func parseISO(_ iso: String) -> Date? {
		let formatter = ISO8601DateFormatter()
		formatter.formatOptions = [
			.withInternetDateTime,
			.withFractionalSeconds
		]

		return formatter.date(from: iso)
	}
}