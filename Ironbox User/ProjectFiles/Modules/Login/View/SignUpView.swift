//
//  SignUpView.swift
//  Ironbox User
//
//  Created by MAC on 10/11/22.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
        @State var userName : String = ""
        @State var emailAddress : String = ""
        @State var referCode : String = ""
    @State var continueClicked : Bool = false
    var userId : String
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    @ObservedObject var viewModel = LoginViewModel()
    @State var isSelected = false
        var body: some View {
            GeometryReader{ geometry in

            ScrollView{
                ZStack{
                    Image("signUpBackGround").resizable()
                    Image("splashicon").resizable().frame(width: 100, height: 100).position(x: geometry.size.width/2, y: geometry.size.height/6)
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName : "arrow.left").resizable().frame(width: 30, height: 30)
                    }
                   .position(x: geometry.size.width/10, y: geometry.size.height/12).foregroundColor(.white)
                    VStack(alignment : .leading, spacing : 20){
                        SignupTextField(placeHolderText : "Name" , image : "group" , userName : $userName)
                        SignupTextField(placeHolderText : "Email (Optional)" , image : "email" , userName : $emailAddress)
                        SignupTextField(placeHolderText : "Referral Code (Optional)" , image : "substitution" , userName : $referCode)
                        HStack{
                            Button{
                                isSelected = !isSelected
                                if isSelected == true{
                                    isSelected = true
                                }else{
                                    isSelected = false
                                }
                            }label: {
                                HStack{
                                    Image(systemName: isSelected ? "checkmark.square" : "square").resizable().frame(width: 25, height: 25).foregroundColor(Constants.CustomColors.colorAppBlue)
                                    Text("I agree")
                                        .font(.system(size: 15, design: .rounded))
                                        .fontWeight(.medium).foregroundColor(.black)
                                }
                            }
                            Button{

                            }label: {
                        Text("terms and condition")
                                        .font(.system(size: 15, design: .rounded))
                                        .fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue)
                                }

                        }.padding(.leading , 5)
                    


                    }.padding(20).padding(.top , 230)
                       
                       
                        Button{
                            if !isSelected{
                                toastMsg = "Please accept terms and condition"
                                errorPopup = true
                                return
                            }else if userName == ""{
                                toastMsg = "Please enter username"
                                errorPopup = true
                                return
                            }
                            viewModel.signUpApi(userId: userId, name: userName, email: emailAddress, referral: referCode) { result , response, error in
                                if result == true{
                                    toastMsg = response?.errorMessage ?? ""
                                    errorPopup = true
                                    if response?.error == "true"{
                                    DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                                            StorageSettings().userId = (response?.userId ?? "")
                                            continueClicked = true
                                    })
                                    }

                                }else{
                                    toastMsg = "Please try again"
                                    errorPopup = true
                                }
                               
                            }
                        }label: {
                            Text("Register")
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                    .foregroundColor(Color.white)
                                    .background(Constants.CustomColors.colorAppBlue)
                                   // .cornerRadius(15)
                        }.padding(.top , 15.0)
                        .position(x: geometry.size.width/2, y: geometry.size.height/1.02)
    
                }.frame(maxWidth: .infinity , maxHeight: UIScreen.main.bounds.height)
            }.background(Color(red: 0.973, green: 0.973, blue: 0.973)).ignoresSafeArea().navigationBarHidden(true).toast(isShowing: $errorPopup,textContent: toastMsg)
                    .background(
                        NavigationLink(destination: AppTabbarView(), isActive: $continueClicked){
                        }
                            .hidden()
                    )
        }
           
          
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(userId: "")
    }
}
