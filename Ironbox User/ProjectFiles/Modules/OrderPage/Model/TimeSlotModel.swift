//
//  TimeSlotModel.swift
//  Ironbox User
//
//  Created by MAC on 02/12/22.
//

import Foundation


//struct TimeSlotModel: Codable {
//    let error: String?
//    let timeSlot: [TimeSlot]?
//
//    enum CodingKeys: String, CodingKey {
//        case error
//        case timeSlot = "time_slot"
//    }
//}
//
//// MARK: - TimeSlot
//struct TimeSlot: Codable {
//    let id: Int?
//    let fromSlots, toSlots, deliveryfromSlots, deliverytoSlots: String?
//    let pickupTimeSlot, deliveryTimeSlot, slotststus: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, fromSlots, toSlots, deliveryfromSlots, deliverytoSlots
//        case pickupTimeSlot = "PickupTimeSlot"
//        case deliveryTimeSlot = "DeliveryTimeSlot"
//        case slotststus
//    }
//}



struct TimeSlotModel: Codable {
    let error, deliveryDate , errorMessage: String?
    let pickupTimeSlot, deliveryTimeSlot: [TimeSlot]?

    enum CodingKeys: String, CodingKey {
        case error
        case deliveryDate = "delivery_date"
        case pickupTimeSlot = "pickup_time_slot"
        case deliveryTimeSlot = "delivery_time_slot"
        case errorMessage = "error_message"
    }
}

// MARK: - TimeSlot
struct TimeSlot: Codable {
    let id: Int?
    let fromSlots, toSlots, deliveryTimeSlot, pickupTimeSlot: String?

    enum CodingKeys: String, CodingKey {
        case id, fromSlots, toSlots
        case deliveryTimeSlot = "DeliveryTimeSlot"
        case pickupTimeSlot = "PickupTimeSlot"
    }
}
