//
//  AccountProfileViewModel.swift
//  Ironbox User
//
//  Created by Naveen Kumar on 25/12/22.
//

import Foundation



class ProfileViewModel : ObservableObject{
    
    @Published var imageData : SplashImageModel?
    @Published var addressData : [Address]?
    @Published var timeSlotData : [String] = []
    
   // "http://43.205.221.246/Iron/public/api/EditProfile?id=9133&name=Test&email=testing1@gmail.com&
  //  mobile=9876549870&family_count=4&gender=F&alternate_number=3456787654"
    
    func editProfileDetail(name : String , email : String , mobile : String , familyCount : String , gender : String , alterNateNumber : String , completionHandler : @escaping(Bool,TagIDModel?,Error? ) -> Void){
        let params : [String : String] = [
            "id":StorageSettings().userId,
            "name":name,
            "email": email,
            "mobile":mobile ,
            "family_count":familyCount ,
            "gender":gender,
            "alternate_number":alterNateNumber,
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.editProfile , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: TagIDModel.self ) { (restValue, result, error) in
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
