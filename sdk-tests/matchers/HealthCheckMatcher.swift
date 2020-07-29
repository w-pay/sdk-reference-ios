import Foundation
import Hamcrest

@testable import VillageWalletClientSDKReference

func isHealthyService() -> Matcher<HealthCheck> {
	Matcher("A healthy service") { (item) -> Bool in
		item.result() == HealthCheckStatus.SUCCESS
	}
}