//
//  TagIdModel.swift
//  Ironbox User
//
//  Created by MAC on 09/12/22.
//

import Foundation



struct TagIDModel: Codable {
    let status, errorMessage: String?
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case status
        case errorMessage = "error_message"
        case data
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, tagNo: Int?
    let action, createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case tagNo = "tag_no"
        case action
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
