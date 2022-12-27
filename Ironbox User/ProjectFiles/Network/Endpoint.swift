//
//  Endpoints.swift
//  FitKet
//
//  Created by Hariharan G on 5/19/20.
//  Copyright © 2020 Fitket. All rights reserved.
//

import UIKit
import SystemConfiguration



var urlType1 = "http://43.205.221.246/Iron/public/api"
var urlType2 = "http://202.83.31.153:8077"
var imageUrl = "http://43.205.221.246/Iron/public/banner_image/"

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

enum Endpoint {
    case login
    case resetSeats
    case otpGet
    case otpVerify
    case resendOtp
    case appImages
    case signUpapi
    case home
    case addAddress
    case editAddress
    case getAddress
    case primaryAddress
    case subscriptionPackage
    case getTimeSlots
    case orderBookingApi
    case tagIdValidation
    case walletView
    case userPromocode
    case refferalValidate
    case promoValidate
    case razorPayPayment
    case packageHistory
    case editProfile
    case orderHistroy
    case oneClickBooking
    var url:String {
        return tempUrl + "/" + self.path
    }
    
    var tempUrl:String {
        switch self {
        case .login , .otpGet , .otpVerify , .resendOtp , .appImages , .signUpapi , .home , .addAddress , .editAddress , .getAddress , .primaryAddress , .subscriptionPackage , .getTimeSlots , .orderBookingApi , .tagIdValidation , .walletView , .userPromocode , .refferalValidate , .promoValidate , .razorPayPayment , .packageHistory , .editProfile , .orderHistroy , .oneClickBooking: return urlType1
        case .resetSeats : return urlType2
        }
    }
    
    private var path: String {
        switch self {
        case .login:
            return "KFE_Android/login_valid.php"
        case .otpGet :
            return "UserLogin"
        case .resetSeats:
            return "api/kfecinema/resetseats"
        case .otpVerify :
            return "UserCheckOpt"
        case .resendOtp :
            return "ResentOtp"
        case .appImages:
            return "AppImages"
        case .signUpapi:
            return "AddUserDetails"
        case .home:
            return "Home"
        case .addAddress:
            return "AddAddresses"
        case .editAddress:
            return "EditAddress"
        case .getAddress:
            return "GetAddress"
        case .primaryAddress:
            return "AddPrimaryAddress"
        case .subscriptionPackage:
            return "SubscriberPackageslist"
        case .getTimeSlots:
            return "GetTimeSlots"
        case .orderBookingApi:
            return "Booking"
        case .tagIdValidation:
            return "check_tag"
        case .walletView:
            return "walletview"
        case .userPromocode:
            return "UserPromocodes"
        case .refferalValidate:
            return "referralamount"
        case .promoValidate:
            return "ValidPromocodes"
        case .razorPayPayment:
            return "SuscriberRazorPay"
        case .packageHistory:
            return "subcriberpaylist"
        case .editProfile:
            return "EditProfile"
        case .orderHistroy:
            return "OrdersHistory"
        case .oneClickBooking:
            return "OneClickBooking"
        }
    }
    var httpMethod: HTTPMethod {
        switch self {
        case .resetSeats , .otpGet , .otpVerify , .resendOtp , .appImages , .signUpapi , .home , .addAddress , .editAddress , .getAddress , .primaryAddress , .subscriptionPackage , .getTimeSlots , .orderBookingApi , .tagIdValidation , .walletView , .userPromocode , .refferalValidate , .promoValidate , .razorPayPayment , .packageHistory , .editProfile , .orderHistroy , .oneClickBooking : return .post
        case .login: return .get
        
        }
    }
}
