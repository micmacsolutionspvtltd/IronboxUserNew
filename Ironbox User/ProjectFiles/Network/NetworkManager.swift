//
//  NetworkManager.swift
//  Fustionkitchen
//
//  Created by Macintosh HDD on 04/10/21.
//  Copyright © 2021 fusionpos. All rights reserved.
//

import Foundation
import SystemConfiguration

class NetWorkManger
{
    static var sharedInstance = NetWorkManger()
//    private init(){}

    var isConnectedToNetwork: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
    func postData<T:Decodable>(request: URLRequest, resultType:T.Type, completionHandler:@escaping(Bool,_ reuslt: T?,Error?)-> Void) {
        guard isConnectedToNetwork else {
            completionHandler(false, nil, NetworkError.noInternetAccess)
            return
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil) {
                do{
                
                    let json = try JSONSerialization.jsonObject(with: data!, options: [.allowFragments,.mutableLeaves,.mutableContainers])
                    debugPrint("----- Response ----- " ,json)
                    let response = try JSONDecoder().decode(resultType.self, from: data!)
                    completionHandler(true,response,nil)
                }
                catch{
                    debugPrint(error)
                    completionHandler(false,nil,error)
                   
                }
            }else{
                completionHandler(false,nil,error)
            }
        }.resume()
    }
    
}
