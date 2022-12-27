//
//  SubscriptionViewModel.swift
//  Ironbox User
//
//  Created by MAC on 01/12/22.
//

import Foundation


class SubscriptionViewModel : ObservableObject{
    @Published var subscriptionData : SubscriptionPackageModel?
    @Published var walletData : WalletModel?
    
    func getSubscriptionPage( ){
        let params : [String : String] = [
            "id":StorageSettings().userId,

        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.subscriptionPackage , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: SubscriptionPackageModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [weak self] in
                if restValue == true {
                    self?.subscriptionData = result
                 //   completionHandler(true , result ,error)
                }else{
                  //  completionHandler(false , result ,error)
                }
               
           
            }
        }
    }
    func getWaletDetails(completionHandler : @escaping(Bool,WalletModel?,Error?) -> Void){
        let params : [String : String] = [
            "user_id":StorageSettings().userId,
            //"user_id": "9133"
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.walletView , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: WalletModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                  //  walletData = result
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
            }
        }
    }
    func getPromoCodeDetails(completionHandler : @escaping(Bool,UserPromoCodeModel?,Error?) -> Void){
        let params : [String : String] = [
            "user_id":StorageSettings().userId,
            //"user_id": "9133" ,
            "offet_type" : "Wallet"
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.userPromocode , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: UserPromoCodeModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                  //  walletData = result
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
            }
        }
    }
    func userReferralIdValidate(totalAmount : String , completionHandler : @escaping(Bool,UserRefferalValidateModel?,Error?) -> Void){
        let params : [String : String] = [
            "userid":StorageSettings().userId,
           // "userid": "9133",
            "amount" : totalAmount
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.refferalValidate , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: UserRefferalValidateModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                  //  walletData = result
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
            }
        }
    }
    
    func checkValidPromoCode(totalAmount : String , offerCode : String, completionHandler : @escaping(Bool,PromoValidateModel?,Error?) -> Void){
        let params : [String : String] = [
            "userid":StorageSettings().userId,
           // "userid": "9133",
            "amount" : totalAmount,
            "offer_code" : offerCode
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.promoValidate , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: PromoValidateModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                  //  walletData = result
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
            }
        }
    }
    func subscripionPaymentApi(totalAmount : String , refferAmt : String, promoId : String, refferId : String, promoCodeAmt : String ,packageId : String , cashBackAmt : String , completionHandler : @escaping(Bool,PromoValidateModel?,Error?) -> Void){
        let params : [String : String] = [
            "user_id":StorageSettings().userId,
            "orderId" : "manual",
            "transactionId" : "nil" ,
            "txn_amount" : totalAmount ,
            "tnx_status" :  "SUCCESS",
            "referral_amount" : refferAmt ,
            "promocode_id" : promoId ,
            "referral_id" : refferId ,
            "promocode_amount" : promoCodeAmt ,
            "package_id" : packageId ,
            "cashback_amount" : cashBackAmt
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.razorPayPayment , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: PromoValidateModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [unowned self] in
                if restValue == true {
                  //  walletData = result
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
            }
        }
    }
    func subscripionPackageHistory( completionHandler : @escaping(Bool,SubscriptionHistoryModel?,Error?) -> Void){
        let params : [String : String] = [
            "user_id":StorageSettings().userId,
        ]
        let urlRequest = (try?  RequestGenerator.sharedInstance.generateURLRequestTypeTwo(endpoint:Endpoint.packageHistory , requestBody : params))!
        NetWorkManger.sharedInstance.postData(request: urlRequest, resultType: SubscriptionHistoryModel.self ) { (restValue, result, error) in
            DispatchQueue.main.async { [weak self] in
                if restValue == true {
                  //  self?.subscriptionPakageHistoryData = result?.data ?? []
                  //  walletData = result
                    completionHandler(true , result ,error)
                }else{
                    completionHandler(false , result ,error)
                }
            }
        }
    }
}
