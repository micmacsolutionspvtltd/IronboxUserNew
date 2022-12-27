//
//  UserLoginOtpGetModel.swift
//  Ironbox User
//
//  Created by MAC on 11/11/22.
//

import Foundation


struct UserLoginOtpGetModel: Codable ,Hashable{
    let error, errorMessage: String?
    let otp: Int?

    enum CodingKeys: String, CodingKey {
        case error
        case errorMessage = "error_message"
        case otp = "Otp"
    }
}
