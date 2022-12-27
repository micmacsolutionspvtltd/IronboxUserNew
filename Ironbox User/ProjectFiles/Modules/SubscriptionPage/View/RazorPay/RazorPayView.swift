//
//  RazorPayView.swift
//  Ironbox User
//
//  Created by MAC on 02/12/22.
//

import Foundation
import SwiftUI
import Razorpay




struct RazorPayMethod: UIViewControllerRepresentable {
    var amount = "0"
    var getPaymetId : (String) -> ()
  
    func makeUIViewController(context: Context) -> CheckoutViewController {
        .init()
    }

    func updateUIViewController(_ uiViewController: CheckoutViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, getPaymetId , amount)
    }

    class Coordinator: NSObject, RazorpayPaymentCompletionProtocol {
        let parent: RazorPayMethod
        var getPaymetId : (String) -> ()
        var amount = "0"
        typealias Razorpay = RazorpayCheckout
        var razorpay: RazorpayCheckout!
        
        init(_ parent: RazorPayMethod ,_ getPaymetId : @escaping (String) -> () ,_ amount : String) {
            self.parent = parent
            self.getPaymetId = getPaymetId
            self.amount = amount
            super.init()
            razorpay =  RazorpayCheckout.initWithKey("rzp_test_F0OI03VaPbNCHU", andDelegate: self)
        //    razorpay =  RazorpayCheckout.initWithKey("rzp_live_y6W3EW6yAFrjkQ", andDelegate: self)

            //rzp_test_F0OI03VaPbNCHU     rzp_live_vq8tmnnZmbWVkx
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let options: [String:Any] = [
                    "amount": String("\((Float(amount) ?? 0.00) * 100.00)"), //This is in currency subunits. 100 = 100 paise= INR 1.
                            "currency": "INR",//We support more that 92 international currencies.
                            "description": "IronBox ",
                            "image": "https://cdn3.ticketnew.com/partners/img/kfecinemas/logo.png?v8",
                            "name": "Iron Box",
                            "prefill": [
                                "contact": StorageSettings().mobileNumber,
                                "email": StorageSettings().emailAddress
                            ],
                            "theme": [
                                "color": "#F37254"
                            ]
                        ]
                self.razorpay.open(options)
//                if let rzp = self.razorpay {
//                    rzp.open(options)
//                } else {
//                    print("Unable to initialize")
//                }// your code here
            }
            
        }
        
        func onPaymentError(_ code: Int32, description str: String) {
              print("error: ", code, str)
            getPaymetId("Failure")
           //   self.presentAlert(withTitle: "Alert", message: str)
            // parent.alert with message
          }

          func onPaymentSuccess(_ payment_id: String) {
              print("success:view ", payment_id)
              getPaymetId("Sucess")
           //   self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
          }
    }
}



class CheckoutViewController: UIViewController {
    
    var razorpay: RazorpayCheckout!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  razorpay = RazorpayCheckout.initWithKey("rzp_test_F0OI03VaPbNCHU", andDelegate: self)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
           //     self.showPaymentForm()
        }

    
//    internal func showPaymentForm(){
//        let options: [String:Any] = [
//                    "amount": "100000", //This is in currency subunits. 100 = 100 paise= INR 1.
//                    "currency": "INR",//We support more that 92 international currencies.
//                    "description": "purchase description",
//                    "image": "https://url-to-image.png",
//                    "name": "business or product name",
//                    "prefill": [
//                        "contact": "9797979797",
//                        "email": "foo@bar.com"
//                    ],
//                    "theme": [
//                        "color": "#F37254"
//                    ]
//                ]
//        razorpay.open(options)
//    }
}

extension CheckoutViewController : RazorpayPaymentCompletionProtocol {

    func onPaymentError(_ code: Int32, description str: String) {
        print("error: ", code, str)
//        self.presentAlert(withTitle: "Alert", message: str)
    }

    func onPaymentSuccess(_ payment_id: String) {
        print("success:viewcontroller ", payment_id)
//        self.presentAlert(withTitle: "Success", message: "Payment Succeeded")
    }
}


