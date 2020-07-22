import UIKit
import OpenAPIClient

class OpenApiHealthCheck: HeathCheck {
	private let check: OAIHealthCheckResultData

	init(check: OAIHealthCheckResultData) {
		self.check = check
	}

	func result() -> HealthCheckStatus? {
		HealthCheckStatus.valueOf(value: check.healthCheck)
	}
}
