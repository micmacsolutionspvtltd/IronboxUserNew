//
//  OfferDataModel.swift
//  Ironbox User
//
//  Created by MAC on 13/12/22.
//

import Foundation

struct UserPromoCodeModel: Codable , Hashable {
    let error: String?
    let prmocode: [Prmocode]?
}

// MARK: - Prmocode
struct Prmocode: Codable , Hashable {
    let promocode, expiryFrom, expiryTo, validity: String?

    enum CodingKeys: String, CodingKey {
        case promocode
        case expiryFrom = "expiry_from"
        case expiryTo = "expiry_to"
        case validity
    }
}
