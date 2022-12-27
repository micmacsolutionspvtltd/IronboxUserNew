//
//  UserRefferalModel.swift
//  Ironbox User
//
//  Created by MAC on 13/12/22.
//

import Foundation


struct UserRefferalValidateModel: Codable {
    let status, errorMessage: String?
    let refID, totalamount: Int?
    let usedReferralID, usedCashbackID, usedPromocodeID: String?

    enum CodingKeys: String, CodingKey {
        case status
        case errorMessage = "error_message"
        case refID = "ref_id"
        case totalamount = "Totalamount"
        case usedReferralID = "used_referral_id"
        case usedCashbackID = "used_cashback_id"
        case usedPromocodeID = "used_promocode_id"
    }
}


