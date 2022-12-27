//
//  GetAddressModel.swift
//  Ironbox User
//
//  Created by MAC on 30/11/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getAddressModel = try? newJSONDecoder().decode(GetAddressModel.self, from: jsonData)

import Foundation

// MARK: - GetAddressModel
struct GetAddressModel: Codable , Hashable{
    let error, dateTime: String?
    let address: [Address]?
    let orderDate: [OrderDate]?

    enum CodingKeys: String, CodingKey {
        case error
        case dateTime = "date_time"
        case address = "Address"
        case orderDate = "order_date"
    }
}
struct OrderDate: Codable , Hashable{
     let id: Int?
    let dates : String?
}
// MARK: - Address
struct Address: Codable , Hashable{
    let id, userID, zoneID: Int?
    let type, primaryAddress: String?
    let otherName, buildingName: String?
    let flatNo: String?
    let blockNo: String?
    let landmark: String?
    let address: String?
    let apartment: String?
    let area, city, street, pincode: String?
    let latitude, longitude: String?
    let status: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case zoneID = "zone_id"
        case type
        case primaryAddress = "primary_address"
        case otherName = "other_name"
        case buildingName = "building_name"
        case flatNo, blockNo, landmark, address, apartment, area, city, street, pincode, latitude, longitude, status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


