import UIKit
import OpenAPIClient

class OpenApiHealthCheck: HeathCheck {
	private let check: OAIHealthCheckResultData

	init(check: OAIHealthCheckResultData) {
		self.check = check
	}

	func result() -> HealthCheckStatus {
		switch (check.healthCheck!) {
			case "success":
				return HealthCheckStatus.SUCCESS

		default:
			fatalError("Unknown value for health check")
		}
	}
}
