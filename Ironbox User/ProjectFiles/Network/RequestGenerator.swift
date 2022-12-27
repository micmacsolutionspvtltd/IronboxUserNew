//
//  RequestGenerator.swift
//  Fustionkitchen
//
//  Created by Macintosh HDD on 05/10/21.
//  Copyright © 2021 fusionpos. All rights reserved.
//

import UIKit

class RequestGenerator: NSObject {
    static let sharedInstance = RequestGenerator()
    
    func generateURLRequest(urlValue: String, requestBody: [String:String]? = [:],queryItem:[URLQueryItem]? = []) throws -> URLRequest {
        print("URL = ",urlValue)
        var requestBodyValue:[URLQueryItem] = []
        print("Parameter = ",requestBody ?? ["":""])
        if let requestBodyVal = requestBody {
            for value in requestBodyVal {
                requestBodyValue.append(URLQueryItem(name: value.key, value: value.value))
            }

        }
        print(requestBodyValue)
        var urlComponents = URLComponents(string: urlValue)
        urlComponents?.queryItems = requestBodyValue
     
        var urlRequest = URLRequest(url: urlComponents!.url!)
      

//        urlRequest.httpBody = requestBodyValue
        urlRequest.setValue("text/html; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
    
    func generateURLRequestTypeTwo(endpoint: Endpoint,requestParams:[String:String]? = [:],requestBody: [String:String]? = nil,queryItem:[URLQueryItem]? = []) throws -> URLRequest {
        print("URL = ",endpoint.url)
        var requestBodyValue:[URLQueryItem] = []
        print("Parameter = ",requestBody ?? ["":""])
        if let requestBodyVal = requestBody {
            for value in requestBodyVal {
                requestBodyValue.append(URLQueryItem(name: value.key, value: value.value))
            }

        }
        print(requestBodyValue)
        var urlComponents = URLComponents()
        if let requestParams = requestParams,requestParams.count > 0 {
            urlComponents = URLComponents(string: endpoint.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        }else{
            urlComponents = URLComponents(string: endpoint.url)!
            urlComponents.queryItems = requestBodyValue
        }
       
     
        var requestParamValue:Data? = nil
        if let requestParamVal = requestParams {
            let json = try JSONSerialization.data(withJSONObject: requestParamVal, options: [])
            requestParamValue = json
        }
        
        var urlRequest = URLRequest(url: urlComponents.url!)
      
    
//        urlRequest.httpBody = requestBodyValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestParamValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        return urlRequest
    }
    
    
    func generateURLRequestTypeThree(endpoint: Endpoint, requestBody: [String:Any]? = nil, queryParams: [URLQueryItem]? = nil, additionalHeader: [String: String]? = nil ,authTokenValue:String? = nil,resourcePath : String? = nil) throws -> URLRequest {
        print("URL = ",endpoint.url)
        print("==========Request parameters==========\n")
        
        print(requestBody)
        
        let urlString = endpoint.url
        
        let urlStringWithPath = urlString + (resourcePath ?? "")
        var urlComponents = URLComponents(string: urlStringWithPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        urlComponents?.queryItems = queryParams
        
        guard let url = urlComponents?.url else {
            throw NetworkError.unknown(reason: "Unable to generate request")
        }
        
    

        
//        let userCredential = URLCredential(user: Constants.Authkeys.username2,
//                                           password: Constants.Authkeys.password2,
//                                           persistence: .permanent)
//
//        URLCredentialStorage.shared.setDefaultCredential(userCredential, for: protectionSpace)
        var requestBodyValue:Data? = nil
        if let requestBodyVal = requestBody {
            let json = try JSONSerialization.data(withJSONObject: requestBodyVal, options: [])
            requestBodyValue = json
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        urlRequest.httpBody = requestBodyValue
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
        
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        if let additionalHeaders = additionalHeader {
            for header in additionalHeaders {
                urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        if let authToken = authTokenValue {
            print("toketn : ",authToken)
            urlRequest.addValue(authToken, forHTTPHeaderField: "access-token")
        }
        
        
//        else {
//            throw NetworkError.unAuthorised
//            }
            
        
        return urlRequest
    }
}
