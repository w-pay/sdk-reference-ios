import XCTest
import Hamcrest

@testable import VillageWalletClientSDKReference

class VillageApiRepositoryTest: XCTestCase {
	internal func apiResultExpectation() -> XCTestExpectation {
		expectation(description: "API result")
	}
}
