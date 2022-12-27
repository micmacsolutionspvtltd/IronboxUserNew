//
//  PromoValidateModel.swift
//  Ironbox User
//
//  Created by MAC on 13/12/22.
//

import Foundation


struct PromoValidateModel: Codable {
    let promoID: Int?
    let totalAmount: String?
    let walletAmount, discountAmount: Int?
    let error, errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case promoID = "promo_id"
        case totalAmount = "total_amount"
        case walletAmount = "wallet_amount"
        case discountAmount = "discount_amount"
        case error
        case errorMessage = "error_message"
    }
}
