//
//  SubscriptionPackageModel.swift
//  Ironbox User
//
//  Created by MAC on 02/12/22.
//

import Foundation


struct SubscriptionPackageModel: Codable ,Hashable {
    let packs: [Pack]?
    let status, message, errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case packs, status, message
        case errorMessage = "error_message"
    }
}

// MARK: - Pack
struct Pack: Codable , Hashable {
    let id: Int?
    let packageName, amount, freePoints, expiryDays: String?
    let desc, minimumOrderQuantity, activeStatus: String?

    enum CodingKeys: String, CodingKey {
        case id
        case packageName = "package_name"
        case amount
        case freePoints = "free_points"
        case expiryDays = "expiry_days"
        case desc
        case minimumOrderQuantity = "minimum_order_quantity"
        case activeStatus = "active_status"
    }
}

