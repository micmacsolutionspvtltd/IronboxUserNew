//
//  NetworkError.swift
//  FitKet
//
//  Created by Hariharan G on 5/19/20.
//  Copyright © 2020 Fitket. All rights reserved.
//

import UIKit

struct ErrorConstants {
    static let genericErrorMessage = "Error Occurred. Please try again in sometime."
    static let serverError = "Server failed to process your request"
    static let badRequest = "Unable to process your request. Please try again."
    static let resourceNotFound = "Please try again later (Resource Not Found)."
    static let sessionExpired = "Your session has been expired So Kindly login again to use the features."
}


enum NetworkError: Error {
    case noInternetAccess
    case unAuthorised
    case requestTimedOut
    case badRequest
    case sessionExpired
    case serverError (reason: String)
    case unknown(reason: String)
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .sessionExpired: return ErrorConstants.sessionExpired
        case .noInternetAccess: return "Please check your internet connection and try again"
        case .unAuthorised: return "Session Expired. Please sign in again"
        case .requestTimedOut: return "Request timed out"
        case .badRequest: return ErrorConstants.badRequest
        case .serverError (let reason): return "\(ErrorConstants.serverError) (\(reason)). Please try again."
        case .unknown(let reason): return reason
        }
    }

    var localizedDescription: String {
        return self.description
    }

}
