//
//  AddressViewMode.swift
//  Ironbox User
//
//  Created by MAC on 25/11/22.
//

import Foundation

class AddressViewModel : ObservableObject{
    
    @Published var imageData : SplashImageModel?
    @Published var addressData : [Address]?
    @Published var timeSlotData : [String] = []
    
    func addAddress(loginType : String , flatNo : String , landMark : String , pinCode : String , streetName : String , address : String , lat : String , lon : String , area : String , city : String , otherName : String , buildingName : String , blockNo : String , completionHandler : @escaping(Bool,UserLoginOtpGetModel?,Error? ) -> Void){
        let params : [String : String] = [
            "login_status":"1",
            "id":StorageSettings().userId,
            "type": loginType,
            "flatNo":flatNo,
            "street":streetName ,
            "landmark":landMark ,
            "area":area,
            "city":city,
            "pincode":pinCode,
            "address": address,
            "latitude":lat,
            "longitude":lon,
            "othername": otherName,
            "buildingname": buildingName,
            "blockNo" : blockNo,
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.addAddress , requestBody : params))!
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
    func getAddress( completionHandler : @escaping(Bool,GetAddressModel?,Error? , [String]?) -> Void){
        let params : [String : String] = [
            "id":StorageSettings().userId,

        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.getAddress , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: GetAddressModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                    timeSlotData = []
                    addressData = result?.address
                    for i in result?.orderDate ?? []{
                        timeSlotData.append(i.dates ?? "")
                    }
                    completionHandler(true , result ,error , timeSlotData)
                }else{
                    completionHandler(false , result ,error , timeSlotData)
                }
               
           
            }
        }
    }
    func setPrimaryAddress(addressId : String , completionHandler : @escaping(Bool,GetAddressModel?,Error?) -> Void){
        let params : [String : String] = [
            "id":StorageSettings().userId,
            "AddressId" : addressId
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.primaryAddress , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: GetAddressModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
               
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
               
           
            }
        }
    }
    func editAddress(loginType : String , flatNo : String , landMark : String , pinCode : String , streetName : String , address : String , lat : String , lon : String , area : String , city : String , addressId : String , buildingName : String , blockNo : String , otherName : String, completionHandler : @escaping(Bool,UserLoginOtpGetModel?,Error?) -> Void){
        let params : [String : String] = [
            "login_status":"1",
            "id":StorageSettings().userId,
            "type": loginType,
            "flatNo":flatNo,
            "street":streetName ,
            "landmark":landMark ,
            "area":area,
            "city":city,
            "pincode":pinCode,
            "address": address,
            "latitude":lat,
            "longitude":lon,
            "blockNo" : blockNo,
            "othername" : otherName,
            "buildingname" : buildingName,
            "AddressId" : addressId
        ]
        
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.editAddress , requestBody : params))!
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
}

