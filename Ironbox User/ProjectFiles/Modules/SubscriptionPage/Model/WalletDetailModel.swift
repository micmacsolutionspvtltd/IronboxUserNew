// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let walletModel = try? newJSONDecoder().decode(WalletModel.self, from: jsonData)

import Foundation

// MARK: - WalletModel
struct WalletModel: Codable {
    let refferalTotalAmount, cashbackTotalAmount: String?
    let userWallet: [RefferalHistory]?
    let cashbackHistory: [CashbackHistory]?
    let refferalHistory: [RefferalHistory]?
    let status, errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case refferalTotalAmount = "refferal_total_amount"
        case cashbackTotalAmount = "cashback_total_amount"
        case userWallet = "user_wallet"
        case cashbackHistory = "cashback_history"
        case refferalHistory = "refferal_history"
        case status
        case errorMessage = "error_message"
    }
}

// MARK: - CashbackHistory
struct CashbackHistory: Codable {
    let id: Int?
    let cashback, discount: String?
    let maximumAmount: Int?
    let expiryFrom, expiryTo, noExpiry, packageName: String?
    let paymentType, offerType: String?
    let serviceArea: Int?
    let images, cashbackHistoryDescription: String?
    let status: Int?
    let createdAt, updatedAt, expiryFromTime, expiryToTime: String?
    let promoType, userid, notinuseDate, products: String?
    let days, noOfTimes, action: String?
    let userID: Int?
    let bonusID: String?
    let packageID: Int?
    let walletID, walletAmount, activeStatus, havingAmount: String?
    let usedAmount, totalAmount, expiryDate, bonusDate: String?
    let cashID, refID, cashbackAmt, referalAmt: Int?

    enum CodingKeys: String, CodingKey {
        case id, cashback, discount
        case maximumAmount = "maximum_amount"
        case expiryFrom = "expiry_from"
        case expiryTo = "expiry_to"
        case noExpiry = "no_expiry"
        case packageName = "package_name"
        case paymentType = "payment_type"
        case offerType = "offer_type"
        case serviceArea = "service_area"
        case images
        case cashbackHistoryDescription = "description"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case expiryFromTime = "expiry_from_time"
        case expiryToTime = "expiry_to_time"
        case promoType = "promo_type"
        case userid
        case notinuseDate = "notinuse_date"
        case products, days
        case noOfTimes = "no_of_times"
        case action
        case userID = "user_id"
        case bonusID = "bonus_id"
        case packageID = "package_id"
        case walletID = "wallet_id"
        case walletAmount = "wallet_amount"
        case activeStatus = "active_status"
        case havingAmount = "having_amount"
        case usedAmount = "used_amount"
        case totalAmount = "total_amount"
        case expiryDate = "expiry_date"
        case bonusDate = "bonus_date"
        case cashID = "cash_id"
        case refID = "ref_id"
        case cashbackAmt = "cashback_amt"
        case referalAmt = "referal_amt"
    }
}

// MARK: - RefferalHistory
struct RefferalHistory: Codable {
    let id, fromID, toID: Int?
    let referralID: String?
    let amount: Int?
    let usedAmount, referredDate, expiryDate, createdAt: String?
    let updatedat: String?
    let userID: Int?
    let bonusID: String?
    let packageID: Int?
 //   let walletAmount : String?
    let walletID , activeStatus, havingAmount: String?
    let totalAmount, bonusDate: String?
    let cashID, refID, cashbackAmt, referalAmt: Int?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case fromID = "fromId"
        case toID = "toId"
        case referralID = "referral_id"
        case amount
        case usedAmount = "used_amount"
        case referredDate = "referred_date"
        case expiryDate = "expiry_date"
        case createdAt = "created_at"
        case updatedat
        case userID = "user_id"
        case bonusID = "bonus_id"
        case packageID = "package_id"
        case walletID = "wallet_id"
      //  case walletAmount = "wallet_amount"
        case activeStatus = "active_status"
        case havingAmount = "having_amount"
        case totalAmount = "total_amount"
        case bonusDate = "bonus_date"
        case cashID = "cash_id"
        case refID = "ref_id"
        case cashbackAmt = "cashback_amt"
        case referalAmt = "referal_amt"
        case updatedAt = "updated_at"
    }
}

