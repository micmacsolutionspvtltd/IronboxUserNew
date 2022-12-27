//
//  LoginViewModel.swift
//  Ironbox User
//
//  Created by MAC on 11/11/22.
//

import Foundation


class LoginViewModel : ObservableObject{
    @Published var imageData : SplashImageModel?
    
    
    func otpGetApi(mobileNumber : String , completionHandler : @escaping(Bool,UserLoginOtpGetModel?,Error?) -> Void){
        let params : [String : String] = [
            "mobile":mobileNumber,
            "os" : "ios"
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.otpGet , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: UserLoginOtpGetModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                 
                    completionHandler(true ,result ,error)
                    
                }else{
                    completionHandler(false ,result ,error)
                }
               
           
            }
        }
    }
    func otpVerifyApi(mobileNumber : String , otpNumber : String , completionHandler : @escaping(Bool,UserOtpVerifyModel?,Error?) -> Void){
        let params : [String : String] = [
            "mobile":mobileNumber,
            "otp" : otpNumber
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.otpVerify , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: UserOtpVerifyModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                 
                    completionHandler(true ,result ,error)
                    
                }else{
                    completionHandler(false ,result ,error)
                }
               
           
            }
        }
    }
    func resendOtp(mobileNumber : String , completionHandler : @escaping(Bool,UserLoginOtpGetModel?,Error?) -> Void){
        let params : [String : String] = [
            "mobile":mobileNumber,
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.otpVerify , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: UserLoginOtpGetModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                    completionHandler(true ,result ,error)
                }else{
                    completionHandler(false ,result ,error)
                }
               
           
            }
        }
    }
    func splashImageGetApi(type : String , completionHandler : @escaping(Bool,SplashImageModel?,Error?) -> Void){
        let params : [String : String] = [
            "login_status":"1",
            "type" : type
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.appImages , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: SplashImageModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                //    if result?.error == "true"{
                        completionHandler(true ,result ,error)
//                    }else{
//                        completionHandler(false ,result ,error)
//                    }
                }else{
                    completionHandler(false ,result ,error)
                }
               
           
            }
        }
    }
    func signUpApi(userId : String , name : String , email : String ,referral : String , completionHandler : @escaping(Bool,SplashImageModel?,Error?) -> Void){
        let params : [String : String] = [
            "login_status":"1",
            "id" : userId,
            "name": name,
            "email" : email,
            "referral" : referral
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.signUpapi , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: SplashImageModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                    if result?.error == "true"{
                        completionHandler(true ,result ,error)
                    }else{
                        completionHandler(false ,result ,error)
                    }
                }else{
                    completionHandler(false ,result ,error)
                }
               
           
            }
        }
    }
    
}
