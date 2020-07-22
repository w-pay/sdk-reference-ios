import UIKit

protocol MerchantSchemas {
}

protocol MerchantSchemaSummaries: MerchantSchemas {
	func schemas() -> [MerchantSchemaSummary]
}

protocol MerchantSchemaSummary {
	func schemaId() -> String

	func type() -> String

	func description() -> String?
}

protocol MerchantSchema {
	func schema() -> [String: AnyObject]

	func type() -> String?

	func description() -> String?
}