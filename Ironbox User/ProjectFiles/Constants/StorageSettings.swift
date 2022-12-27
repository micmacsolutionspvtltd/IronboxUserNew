//
//  StorageSettings.swift
//  Ironbox User
//
//  Created by MAC on 14/11/22.
//

import Foundation
import Combine

class StorageSettings:ObservableObject{
    @Published var userId:String {
        didSet {
            UserDefaults.standard.set(userId, forKey: "userId")
        }
    }
    
    @Published var userName:String {
        didSet {
            UserDefaults.standard.set(userName, forKey: "userName")
        }
    }
    
    @Published var emailAddress:String {
        didSet {
            UserDefaults.standard.set(emailAddress, forKey: "emailAddress")
        }
    }
    
    @Published var mobileNumber:String {
        didSet {
            UserDefaults.standard.set(mobileNumber, forKey: "mobileNumber")
        }
    }
    

    
    init(){
        userId = UserDefaults.standard.string(forKey: "userId") ?? ""
        userName = UserDefaults.standard.string(forKey: "userName") ?? ""
        emailAddress = UserDefaults.standard.string(forKey: "emailAddress") ?? ""
        mobileNumber = UserDefaults.standard.string(forKey: "mobileNumber") ?? ""

    }
}

