//
//  LoginView.swift
//  Ironbox User
//
//  Created by MAC on 08/11/22.
//

import SwiftUI

struct LoginView: View {
    @State private var onboardinDone = false
    @State private var mobileNumber: String = ""
    @State private var otpNumber : String = ""
    @State var moveDashBoardPage : Bool = false
    @State var continueClicked : Bool = false
    let otpTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var countDownTimer = 60
    @State var timeRunning = false
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    @ObservedObject var viewModel = LoginViewModel()
    @State var moveToHomePage : Bool = false
    @State var moveToSignupPage : Bool = false
    @State var userId = ""
    
   @State var data = [OnboardingDataModel]()
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    LoginTopSliderView(data: data).navigationBarBackButtonHidden(true).padding(.bottom, 30)
                    if continueClicked{
                    VStack{
                        Text("OTP Verification")
                            .font(.system(size: 20, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0)).frame(maxWidth: .infinity,alignment: .leading)
                        Text("We have sent a verification code to \(mobileNumber)")
                            .font(.system(size: 15, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0)).frame(maxWidth: .infinity,alignment: .leading)
                        VStack(spacing : 40){
                            ZStack{
                                HStack(spacing : 40){
                                    ForEach(0..<4){ i in
                                    ZStack{
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray, lineWidth: 1).background(Color.white).frame(width: 45, height: 45)
                                            HStack{
                                                Text(getSingleText(at: i))
                                            }
                                        }
                                }
                                    
                                }
                                TextField("", text: $otpNumber)
                                    .frame(height: 45, alignment: .center)
                                    .font(Font.system(size: 0))
                                    .accentColor(.clear)
                                    .foregroundColor(.clear)
                                    .multilineTextAlignment(.center)
                                    .textContentType(.oneTimeCode)
                                    .keyboardType(.numberPad).onReceive(otpNumber.publisher.collect()) {
                                        self.otpNumber = String($0.prefix(4))
                                    }

                            }
                        }
                        Button{
                          
                            viewModel.resendOtp(mobileNumber: mobileNumber) { result, response, errror in
                                if result == true{
                                    if response?.error == "true"{
                                        toastMsg = "Otp send suceessfully"
                                        countDownTimer = 60
                                        timeRunning = true
                                    }else{
                                        toastMsg = response?.errorMessage ?? ""
                                    }
                                }else{
                                    toastMsg = "\(errror!)"
                                   
                                }
                                errorPopup = true
                            }
                        } label: {
                            
                            Text("Didn't Receive any otp? retry in \(timeRunning ? "00:\(countDownTimer)" : "Resend")")
                                .font(.system(size: 15, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.gray).onReceive(otpTimer){ _ in
                                    if countDownTimer > 0 && timeRunning{
                                        countDownTimer -= 1
                                    }else{
                                        timeRunning = false
                                    }
                                }
                        }.allowsHitTesting(timeRunning ? false : true).padding(.top , 10)
                  
                            Button{
                                if otpNumber.count != 4{
                                    toastMsg = "In correct OTP"
                                    errorPopup = true
                                   return
                                }
                                viewModel.otpVerifyApi(mobileNumber: mobileNumber , otpNumber: otpNumber) { result, response, errror in
                                    if result == true{
                                        toastMsg = response?.errorMessage ?? ""
                                        if response?.error == "true"{
                                            continueClicked = false
                                            timeRunning = false
                                            if response?.type == "Register"{
                                                StorageSettings().userId = String(response?.id ?? 0)
                                                
                                                moveDashBoardPage = true
                                            }else{
                                                userId = String(response?.id ?? 0)
                                                moveToSignupPage = true
                                            }
                                        } 
                                    }else{
                                        toastMsg = "\(errror!)"
                                    }
                                    errorPopup = true
                                }
                            }label: {
                                Text("Verify and Proceed")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                        .foregroundColor(Color.white)
                                        .background(Constants.CustomColors.colorAppBlue)
                                        .cornerRadius(15)
                            }.padding(.top , 15.0)
                        
                    }.padding(10).background(RoundedRectangle(cornerRadius: 8)
                        .fill(Constants.CustomColors.colorAppleBackground)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(8)
                    }else{
                    VStack{
                        Text("Get Started")
                            .font(.system(size: 20, design: .rounded))
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0)).frame(maxWidth: .infinity,alignment: .leading)
                        VStack(spacing : 40){
                            HStack(spacing : 10){
                                Image("nationalFlag")
                                    .resizable().scaledToFit().frame(width: 25, height: 25)
                                Divider().frame(width: 1.5).background(.black).padding(EdgeInsets(top: 7, leading: 0, bottom: 7, trailing: 0))
                                TextField("EnterMobile Number", text: $mobileNumber).textContentType(.oneTimeCode).keyboardType(.numberPad)
                            }.frame( height: 45).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))   .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )//.background(.gray).cornerRadius(5)


                                Button{

                                    viewModel.otpGetApi(mobileNumber: mobileNumber) { result, response, errror in
                                        if result == true{
                                            if response?.error == "true"{
                                                continueClicked = true
                                                timeRunning = true
                                            }
                                       
                                            toastMsg = response?.errorMessage ?? ""
                                        }else{
                                            toastMsg = "\(errror!)"
                                        }
                                        errorPopup = true
                                    }
                                }label: {
                                    Text("Send OTP")
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 45)
                                            .foregroundColor(Color.white)
                                            .background(Constants.CustomColors.colorAppBlue)
                                            .cornerRadius(15)
                                }.padding(.top , 15.0)
                            VStack(spacing : 3){
                                Text("By Continuing your agree to our")
                                    .font(.system(size: 14, design: .rounded))
                                    .fontWeight(.bold)
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 8, trailing: 0)).frame(maxWidth: .infinity,alignment: .center)
                                HStack(spacing : 3){
                                    Text("Terms of Service")
                                        .font(.system(size: 14, design: .rounded))
                                        .fontWeight(.medium).lineLimit(1).foregroundColor(Constants.CustomColors.colorAppBlue)
                                        
                                    Text("and")
                                        .font(.system(size: 14, design: .rounded))
                                        .fontWeight(.bold)
                                       
                                    Text("Privacy and Policy")
                                        .font(.system(size: 14, design: .rounded))
                                        .fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue)
                                }
                            }
                        }
                     
                    }.padding(10).background(RoundedRectangle(cornerRadius: 8)
                        .fill(Constants.CustomColors.colorAppleBackground)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(8)
                    }
                }

            }
            .onAppear(){
                viewModel.splashImageGetApi(type: "2") { result, response, error in
                    if result{
                        data = [
                            OnboardingDataModel(image: (imageUrl + (response?.image1 ?? "") ), heading: response?.title1 ?? "", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                            OnboardingDataModel(image: (imageUrl + (response?.image2 ?? "") ), heading: response?.title2 ?? "", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
                            OnboardingDataModel(image: (imageUrl + (response?.image3 ?? "") ), heading: response?.title3 ?? "", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                               ]
                    }else{
                        
                    }
                }
            }

        }.toast(isShowing: $errorPopup,textContent: toastMsg)
            .background(
                NavigationLink(destination: SignUpView(userId: userId), isActive: $moveToSignupPage){
                    
                }
                    .hidden()
            )
            .background(
                NavigationLink(destination: AppTabbarView(), isActive: $moveDashBoardPage){
                    
                }
                    .hidden()
            )
   
    }
    func limitText(_ upper: Int) {
         if otpNumber.count > upper {
             otpNumber = String(otpNumber.prefix(upper))
         }
     }
     func getSingleText(at index: Int) -> String {
        if index >= self.otpNumber.count {
            return ""
        }else{
            return self.otpNumber.digits[index].numberString
        }
    }

}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


