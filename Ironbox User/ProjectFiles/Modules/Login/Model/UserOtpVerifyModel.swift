//
//  UserOtpVerifyModel.swift
//  Ironbox User
//
//  Created by MAC on 14/11/22.
//

import Foundation



struct UserOtpVerifyModel: Codable {
    let error, errorMessage: String?
    let accessToken: AccessToken?
    let id: Int?
    let name, type, checkPin, checkAddress: String?
    let mobile, email, image, referralCode: String?
    let alternateNumber, gender, dob, loginStatus: String?

    enum CodingKeys: String, CodingKey {
        case error
        case errorMessage = "error_message"
        case accessToken = "access_token"
        case id, name, type
        case checkPin = "CheckPin"
        case checkAddress = "CheckAddress"
        case mobile, email, image
        case referralCode = "referral_code"
        case alternateNumber = "alternate_number"
        case gender, dob
        case loginStatus = "login_status"
    }
}

// MARK: - AccessToken
struct AccessToken: Codable {
    let name: String?
    let abilities: [String]?
    let expiresAt: String?
    let tokenableID: Int?
    let tokenableType, updatedAt, createdAt: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case name, abilities
        case expiresAt = "expires_at"
        case tokenableID = "tokenable_id"
        case tokenableType = "tokenable_type"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id
    }
}
