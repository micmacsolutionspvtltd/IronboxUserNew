//
//  HomeDetailModel.swift
//  Ironbox User
//
//  Created by MAC on 19/11/22.
//

import Foundation



struct HomePageDetailModel: Codable {
    let error: String?
    let details: HomeDetails?
    let subscriberDetails : SubscriberDet?

    enum CodingKeys: String, CodingKey {
        case error
        case details = "Details"
        case subscriberDetails = "subscribers"
    }
}
struct SubscriberDet: Codable {
    let id: Int?
    let minimumOrderQuantity, packageName, activeStatus: String?

    enum CodingKeys: String, CodingKey {
        case id
        case minimumOrderQuantity = "minimum_order_quantity"
        case packageName = "package_name"
        case activeStatus = "active_status"
    }
}
// MARK: - Details
struct HomeDetails: Codable {
    let id: Int?
    let name, mobile, email, image , familyCount : String?
    let alternateNumber, dob, gender, otp: String?
    let checkPin, referralCode, referred, subscriber: String?
    let subscribtionPoints, subPackID: String?
    let walletAmount, creditType, creditAmount: Int?
    let expiryDate, deviceToken, os, version: String?
    let loginStatus, playstoreLink, createdAt, updatedAt: String?
 

    enum CodingKeys: String, CodingKey {
        case id, name, mobile, email, image
        case familyCount = "family_count"
        case alternateNumber = "alternate_number"
        case dob, gender, otp
        case checkPin = "CheckPin"
        case referralCode = "referral_code"
        case referred, subscriber
        case subscribtionPoints = "subscribtion_points"
        case subPackID = "sub_pack_id"
        case walletAmount = "wallet_amount"
        case creditType = "credit_type"
        case creditAmount = "credit_amount"
        case expiryDate = "expiry_date"
        case deviceToken, os, version
        case loginStatus = "login_status"
        case playstoreLink = "playstore_link"
        case createdAt = "created_at"
        case updatedAt = "updated"
    }
}
