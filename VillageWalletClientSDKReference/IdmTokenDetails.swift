import UIKit
import VillageWalletSDK

/**
	Token details provided by an Identity Manager.

	TODO: Get more details on what the properties mean
 */
public class IdmTokenDetails: Codable, HasAccessToken {
	public let accessToken: String
	let accessTokenExpiresIn: Int
	let refreshToken: String
	let refreshTokenExpiresIn: Int
	let tokensIssuedAt: CUnsignedLong
	let isGuestToken: Bool
	let idmStatusOK: Bool

	public init(
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
