//
//  GenericResponse.swift
//  FitKet
//
//  Created by Hariharan G on 5/26/20.
//  Copyright © 2020 Fitket. All rights reserved.
//

import UIKit

class GenericResponse<T: Codable> {
    private(set) var message: String?
    private(set) var responseData: T?

    init(message: String?, responseData: T?){
        self.message = message
        self.responseData = responseData
    }
}

class NewGenericResponse<T: Codable> {
    private(set) var errorDescription: String?
    private(set) var errorMessage: String?
    private(set) var responseMessage: String?
    private(set) var statusCode: Int?
    private(set) var responseFlag: Int?
    private(set) var response: T?

    init(errorDescription: String?,errorMessage: String?,responseMessage: String?,statusCode: Int?,response: T?,responseFlag:Int?){
        self.errorDescription = errorDescription
        self.errorMessage = errorMessage
        self.responseMessage = responseMessage
        self.statusCode = statusCode
        self.responseFlag = responseFlag
        self.response = response
    }
}

class BookFuelResponse<T: Codable> {
    private(set) var response: T?
    private(set) var responseMessage: String?
    private(set) var statusCode: Int?
    init(response: T?,responseMessage:String?,statusCode:Int?){
        self.response = response
        self.responseMessage = responseMessage
        self.statusCode = statusCode
    }
}
