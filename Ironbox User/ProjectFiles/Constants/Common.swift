//
//  Common.swift
//  Ironbox User
//
//  Created by MAC on 24/11/22.
//

import Foundation
import GooglePlaces
import GoogleMaps
import GooglePlacesAPI

typealias CompletionBlock = (String, String) -> Void
typealias pincode = String
typealias latitude = String
typealias longitude = String
typealias city = String
typealias address = String
typealias placeName = String
class Common {
    
    
    // MARK: - Class Methods
    static let sharedInstance = Common()
  
    private init() {
        
       
        
    }
func getAutoCompleteAddress(placeId:String,onCompletion:@escaping(Bool,placeName?,address?,city?,pincode?)->Void) {
    GooglePlacesAPI.GooglePlaces.provide(apiKey: "AIzaSyDwHUKGXjsCNn-Oepw6L5t6Mn2HS7ucV3M")
    GooglePlacesAPI.GooglePlaces.placeDetails(forPlaceID: placeId, language: "en_US") { (response, error) -> Void in
        
        guard let place = response?.result, response?.status == GooglePlaces.StatusCode.ok else {
            onCompletion(false,nil,nil,nil,nil)
            return
        }
        
        
        let city = place.addressComponents.first(where: { $0.types.first == "locality" })?.longName
        let pincode = place.addressComponents.first(where: { $0.types.first == "postal_code" })?.longName
        onCompletion(true,place.name,place.formattedAddress,city,pincode)
        
    }
}
    func dateFormatterStraight(date : String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let resultString = dateFormatter.string(from: date!)
      
        return resultString
    }

}
