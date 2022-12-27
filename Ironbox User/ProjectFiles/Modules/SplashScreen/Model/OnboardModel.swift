//
//  OnboardModel.swift
//  Ironbox User
//
//  Created by MAC on 07/11/22.
//

import Foundation


struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

//extension OnboardingDataModel {
//     var data: [OnboardingDataModel] = [
//        OnboardingDataModel(image: "onboarding-relax", heading: "Welcome to App", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
//        OnboardingDataModel(image: "onboarding-lookingatart", heading: "Explore the World", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
//        OnboardingDataModel(image: "onboarding-relax", heading: "Live Life Baby", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
//    ]
//}


struct SplashImageModel: Codable {
    let error, errorMessage, image1, image2 , userId: String?
    let image3 , title1 , title2 , title3: String?
    let des1 , des2 , des3 : String?

    enum CodingKeys: String, CodingKey {
        case error , userId , title2 , title3 , title1
        case des1 , des2 , des3
        case errorMessage = "error_message"
        case image1 = "Image1"
        case image2 = "Image2"
        case image3 = "Image3"
    }
}

