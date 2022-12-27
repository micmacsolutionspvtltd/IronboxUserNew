//
//  OrderViewModel.swift
//  Ironbox User
//
//  Created by MAC on 02/12/22.
//

import Foundation

class OrderViewModel : ObservableObject{
    @Published var getTimeSlotData : TimeSlotModel?
    @Published var pickupTime : [String] = []
    @Published var deliveryTime : [String] = []

    func getTimeSlots(bookingDate : String , zoneId : String , completionHandler : @escaping(Bool,TimeSlotModel?,Error?) -> Void){
        let params : [String : String] = [
            "zoneid" : zoneId,
            "order_date":bookingDate,
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.getTimeSlots , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: TimeSlotModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                    pickupTime = []
                getTimeSlotData = result
                    for i in result?.pickupTimeSlot ?? []{
                        pickupTime.append(i.pickupTimeSlot ?? "")
                    }
                    for i in result?.deliveryTimeSlot ?? []{
                        deliveryTime.append(i.deliveryTimeSlot ?? "")
                    }
                    if result?.error == "true"{
                        completionHandler(true , result ,error)
                    }else{
                        completionHandler(false , result ,error)
                    }
                   
                }else{
                    completionHandler(false , result ,error)
                }
               
           
            }
        }
    }
    func orderBooking(addressId : String , bookingDate : String , pickUpSlotId : String , quantity : String , tagId : String, damageClothIron : String , deliveryTimeSlotId : String , deliveryDate : String , completionHandler : @escaping(Bool,TimeSlotModel?,Error?) -> Void){
        let params : [String : String] = [
            "id" : StorageSettings().userId,
            "addressId":addressId,
            "bookingDate" : bookingDate,
            "PickTimeSlotId" : pickUpSlotId ,
            "quantity" : quantity,
            "tagid" : tagId,
            "is_damaged_iron" : damageClothIron,
            "DeliveryTimeSlotId" : deliveryTimeSlotId ,
            "deliverydate" : deliveryDate
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.orderBookingApi , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: TimeSlotModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
             
                    if result?.error == "true"{
                        completionHandler(true , result ,error)
                    }else{
                        completionHandler(false , result ,error)
                    }
                   
                }else{
                    completionHandler(false , result ,error)
                }
               
           
            }
        }
    }
    func tagIdValidation(tagId : String  , completionHandler : @escaping(Bool,TagIDModel?,Error?) -> Void){
        let params : [String : String] = [
            "tag_id" : tagId
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.tagIdValidation , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: TagIDModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                
                        completionHandler(true , result ,error)
                 
                }else{
                    completionHandler(false , result ,error)
                }
               
           
            }
        }
    }
    func oneClickBooking(quantity : String , tagId : String , completionHandler : @escaping(Bool,SplashImageModel?,Error?) -> Void){
        let params : [String : String] = [
            "id" : StorageSettings().userId ,
            "quantity":quantity,
            "tag_id" : tagId
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.oneClickBooking , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: SplashImageModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {

                }else{
                 
                }
               
           
            }
        }
    }
}
