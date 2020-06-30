import UIKit

class IdmTokenDetails: Codable {
	let accessToken: String
	let accessTokenExpiresIn: Int
	let refreshToken: String
	let refreshTokenExpiresIn: Int
	let tokensIssuedAt: CUnsignedLong
	let isGuestToken: Bool
	let idmStatusOK: Bool

	init(
		accessToken: String,
		accessTokenExpiresIn: Int,
		refreshToken: String,
		refreshTokenExpiresIn: Int,
		tokensIssuedAt: CUnsignedLong,
		isGuestToken: Bool,
		idmStatusOK: Bool
	) {
		self.accessToken = accessToken
		self.accessTokenExpiresIn = accessTokenExpiresIn
		self.refreshToken = refreshToken
		self.refreshTokenExpiresIn = refreshTokenExpiresIn
		self.tokensIssuedAt = tokensIssuedAt
		self.isGuestToken = isGuestToken
		self.idmStatusOK = idmStatusOK
	}
}
