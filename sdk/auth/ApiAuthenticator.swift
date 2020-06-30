import UIKit

protocol ApiAuthenticator: Configurable {
	associatedtype T

	func authenticate(callback: @escaping ApiResult<T>) -> Void
}

/**
 * Needed to be able to implement Decorators
 * @see https://stackoverflow.com/questions/62650193/implement-decorator-pattern-with-generics-in-swift
 */
class AnyApiAuthenticator<T>: ApiAuthenticator {
	func authenticate(callback: @escaping ApiResult<T>) {
		fatalError("Must implement")
	}

	func setHost(host: String) {
		fatalError("Must implement")
	}
}
