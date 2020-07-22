import UIKit

protocol HeathCheck {
	/**
	 * @return nil if invalid API data received.
	 */
	func result() -> HealthCheckStatus?
}

enum HealthCheckStatus {
	case SUCCESS

	static func valueOf(value: String) -> HealthCheckStatus? {
		switch (value.uppercased()) {
			case "SUCCESS":
				return HealthCheckStatus.SUCCESS

			default:
				return nil
		}
	}
}
