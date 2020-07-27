import UIKit

protocol VillageAdministrationApiRepository: Configurable {
	func checkHealth(callback: @escaping ApiResult<HeathCheck>)
}
