import UIKit
import VillageOpenApiClient

class OpenApiDynamicPayload: DynamicPayload {
	private let aPayload: OAIDynamicPayload

	init(payload: OAIDynamicPayload) {
		self.aPayload = payload
	}

	func schemaId() -> String? {
		aPayload.schemaId
	}

	func payload() -> [String: AnyObject] {
		aPayload.payload as [String: AnyObject]
	}
}
