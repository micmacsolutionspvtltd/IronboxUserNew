//
//  BookingHistoryModel.swift
//  Ironbox User
//
//  Created by Naveen Kumar on 25/12/22.
//

import Foundation



struct BookingHistoryModel : Codable , Hashable{
    let error : String?
    let bookingList : [BookingList]?
    enum CodingKeys: String, CodingKey {
        case error
        case bookingList = "BookingList"
        
    }
}
struct BookingList: Codable , Hashable {
    let id, quantity , subPoints: Int?
    let orderId, pickingDate, deliveryDate : String?

    enum CodingKeys: String, CodingKey {
        case id
        case orderId = "order_id"
        case pickingDate = "picking_date"
        case deliveryDate = "delivery_date"
        case quantity = "quantity"
        case subPoints = "sub_points"
    }
}
