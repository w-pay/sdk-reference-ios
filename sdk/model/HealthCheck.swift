import UIKit

protocol HeathCheck {
	func result() -> HealthCheckStatus
}

enum HealthCheckStatus {
	case SUCCESS
}
