//
//  OrderHistoryViewModel.swift
//  Ironbox User
//
//  Created by Naveen Kumar on 25/12/22.
//

import Foundation


class OrderHistoryViewMOdel : ObservableObject{
    @Published var orderHistoryData : BookingHistoryModel?
    
    func orderHistoryApi(completionHandler : @escaping(Bool,BookingHistoryModel?,Error?) -> Void){
        let params : [String : String] = [
            "id" : StorageSettings().userId,
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.orderHistroy , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: BookingHistoryModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [weak self] in
                if restValue == true {
                  //  self?.orderHistoryData = result
                    completionHandler(true , result , error)
                }else{
                    completionHandler(true , result , error)

                }
                
                
            }
        }
    }
    
}
