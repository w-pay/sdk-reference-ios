import UIKit

class StoringApiAuthenticator<T>: AnyApiAuthenticator<T> {
	private let delegate: AnyApiAuthenticator<T>
	private let store: AnyCredentialsStore<T>

	init(delegate: AnyApiAuthenticator<T>, store: AnyCredentialsStore<T>) {
		self.delegate = delegate
		self.store = store
	}

	override func authenticate(callback: @escaping ApiResult<T>) -> Void {
		delegate.authenticate(callback: { results, error in
			if (results != nil) {
				self.store.storeCredentials(credentials: results!)
			}

			callback(results, error)
		})
	}

	override func setHost(host: String) {
		delegate.setHost(host: host)
	}
}
