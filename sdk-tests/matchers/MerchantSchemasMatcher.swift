import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func isMerchantSchemaSummaries() -> Matcher<MerchantSchemaSummaries> {
	Matcher("A list of schemas") { (item) -> Bool in
		let schemaMatcher = isMerchantSchemaSummary()
		let schemas = item.schemas()

		assertThat(schemas.count, greaterThan(0))

		return schemas.reduce(true, { result, it in result && schemaMatcher.matches(it).boolValue })
	}
}

func isMerchantSchemaSummary() -> Matcher<MerchantSchemaSummary> {
	Matcher("Merchant Schema Summary") { (item) -> Bool in
		assertThat(item.schemaId(), not(blankOrNilString()))
		assertThat(item.type(), not(blankOrNilString()))
		assertThat(item.description(), not(blankOrNilString()))

		return true
	}
}

func isMerchantSchema() -> Matcher<MerchantSchema> {
	Matcher("A Merchant Schema Summary") { (item) -> Bool in
		assertThat(item.schema(), not(nilValue()))
		assertThat(item.type(), not(blankOrNilString()))
		assertThat(item.description(), not(blankOrNilString()))

		return true
	}
}
