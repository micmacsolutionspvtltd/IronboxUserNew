//
//  HomeViewModel.swift
//  Ironbox User
//
//  Created by MAC on 19/11/22.
//

import Foundation



class HomeViewModel : ObservableObject{
    @Published var homeDetailsData : HomeDetails?
    @Published var homeAllData : HomePageDetailModel?
    @Published var imageValueData : SplashImageModel?
    func homeDetailsApi( completionHandler : @escaping(Bool ,Error?) -> Void){
        let params : [String : String] = [
            "login_status":"1",
            "id" : StorageSettings().userId
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.home , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: HomePageDetailModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                    homeAllData = result
                    homeDetailsData = result?.details
                     completionHandler(true , error)
                }else{
                    completionHandler(false , error)
                }
            }
        }
    }
    func splashImageGetApi( ){
        let params : [String : String] = [
            "login_status":"1",
            "type" : "3"
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.appImages , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: SplashImageModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                        imageValueData = result
                }else{
                 
                }
               
           
            }
        }
    }

}
