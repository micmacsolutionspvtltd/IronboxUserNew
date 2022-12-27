//
//  SubscriptionHistoryModel.swift
//  Ironbox User
//
//  Created by Naveen Kumar on 24/12/22.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let subscriptionHistoryModel = try? newJSONDecoder().decode(SubscriptionHistoryModel.self, from: jsonData)

import Foundation

// MARK: - SubscriptionHistoryModel
struct SubscriptionHistoryModel: Codable , Hashable{
    let status, errorMessage: String?
    let data: [SubscriptionHistory]?

    enum CodingKeys: String, CodingKey {
        case status
        case errorMessage = "error_message"
        case data = "data"
    }
}

// MARK: - Datum
struct SubscriptionHistory: Codable , Hashable{
    let id: Int?
    let userID, packageID, transactionID, orderID: String?
    let subscribersAmount, subscriberDescription, paymentMode, bankname: String?
    let paymentdate, subscriberActiveStatus, type, subscriberExpiryDate: String?
    let subscriberID: Int?
    let packageName, noOfCloth, costPerCloth, packageAmount: String?
    let totalPoints, pacakageDesc, packageMinimumOrderQuantity, packageActiveStatus: String?
    let packageExpiryDays, usedCashbackID, usedPromocodeID, remainingPoints: String?
    let usedReferralID, subID: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case packageID = "package_id"
        case transactionID = "transaction_id"
        case orderID = "order_id"
        case subscribersAmount = "subscribers_amount"
        case subscriberDescription = "subscriber_description"
        case paymentMode = "payment_mode"
        case bankname, paymentdate
        case subscriberActiveStatus = "subscriber_active_status"
        case type
        case subscriberExpiryDate = "subscriber_expiry_date"
        case subscriberID = "subscriber_id"
        case packageName = "package_name"
        case noOfCloth = "no_of_cloth"
        case costPerCloth = "cost_per_cloth"
        case packageAmount = "package_amount"
        case totalPoints = "total_points"
        case pacakageDesc = "pacakage_desc"
        case packageMinimumOrderQuantity = "package_minimum_order_quantity"
        case packageActiveStatus = "package_active_status"
        case packageExpiryDays = "package_expiry_days"
        case usedCashbackID = "used_cashback_id"
        case usedPromocodeID = "used_promocode_id"
        case remainingPoints = "remaining_points"
        case usedReferralID = "used_referral_id"
        case subID = "sub_id"
    }
}
