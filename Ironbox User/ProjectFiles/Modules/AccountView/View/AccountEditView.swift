//
//  AccountEditView.swift
//  Ironbox User
//
//  Created by MAC on 23/11/22.
//

import SwiftUI

struct AccountEditView: View {
    @State var userName : String = ""
    @State var emailId : String = ""
    @State var mobileNumber : String = ""
    @State var alterNumber : String = ""
    @State var gender : String = ""
    @State var familyMemberCount : String = ""
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    @EnvironmentObject var homeViewModel : HomeViewModel
    @ObservedObject var viewMOdel = ProfileViewModel()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                ScrollView{
                    VStack{
                    ZStack{
                        Text("My Profile")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .accentColor(Color.white)
                        HStack{
                            HStack(alignment: .bottom ){
                                Button(action:{
                                    self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Image(systemName: "arrow.left")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25.0, height: 25.0)
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer()
                            }
                        }
                    }
                    .padding(EdgeInsets(top: 30, leading: 10, bottom: 20, trailing: 20))
                    .frame(minWidth: geometry.size.width,maxHeight: 60)
                    .background(Constants.CustomColors.colorAppBlue)
                        HStack{
                            Spacer()
                        Button{
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack{
                                Image(systemName: "square.and.pencil").resizable().frame(width: 20, height: 20)
                                Text("View").fontWeight(.medium)
                            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).background(.white).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Constants.CustomColors.colorAppBlue, lineWidth: 1))
                        }
                    
                        
                        }.padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
                        VStack{
                            ProfileTextFieldView(tittleText: "User Name", textFieldText: $userName, placholderName: "")
                            ProfileTextFieldView(tittleText: "Email - ID", textFieldText: $emailId, placholderName: "")
                            ProfileTextFieldView(tittleText: "Mobile Number", textFieldText: $mobileNumber, placholderName: homeViewModel.homeDetailsData?.mobile ?? "" , editDisable: true)
                            ProfileTextFieldView(tittleText: "Alternate Mobile number", textFieldText: $alterNumber, placholderName: homeViewModel.homeDetailsData?.alternateNumber ?? "")
                            ProfileTextFieldView(tittleText: "Gender", textFieldText: $gender , placholderName: homeViewModel.homeDetailsData?.gender ?? "")
                            ProfileTextFieldView(tittleText: "Family member count", textFieldText: $familyMemberCount, placholderName: homeViewModel.homeDetailsData?.familyCount ?? "")
                           
                        }.background(.white).cornerRadius(5).padding()
                        Spacer().frame(height : 100)
                    }
                }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
                VStack{
                    Button{
                        // razorPayShow = true
                        viewMOdel.editProfileDetail(name: userName, email: emailId, mobile: mobileNumber, familyCount: familyMemberCount, gender: gender, alterNateNumber: alterNumber) { result, response, errror in
                            errorPopup = true
                            if response?.status == "true"{
                                toastMsg = response?.errorMessage ?? ""
                            }else{
                                toastMsg = response?.errorMessage ?? ""
                            }
                            homeViewModel.homeDetailsApi { result, error in
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    } label: {
                        Text("Save").frame(width: geometry.size.width, height: 50).background( Constants.CustomColors.colorAppBlue).foregroundColor(.white)//.cornerRadius(10)
                    }
                }.position(x: geometry.size.width/2, y: geometry.size.height/1.03)
            }.background(Constants.CustomColors.appBackGroundColor)
        }.onAppear(){
            userName = homeViewModel.homeDetailsData?.name ?? ""
            emailId = homeViewModel.homeDetailsData?.email ?? ""
            mobileNumber = homeViewModel.homeDetailsData?.mobile ?? ""
            alterNumber = homeViewModel.homeDetailsData?.alternateNumber ?? ""
            gender = homeViewModel.homeDetailsData?.gender ?? ""
            familyMemberCount = homeViewModel.homeDetailsData?.familyCount ?? ""
        }.toast(isShowing: $errorPopup,textContent: toastMsg)
    }
}

struct AccountEditView_Previews: PreviewProvider {
    static var previews: some View {
        AccountEditView()
    }
}

struct ProfileTextFieldView : View{
   
    var tittleText : String
    @Binding var textFieldText : String
    var placholderName : String
    var editDisable : Bool = false
    var body: some View{
        VStack{
            HStack{
                
                VStack(alignment : .leading , spacing : 10){
                    Text(tittleText).font(.system(size: 15, weight: .bold, design: .rounded))
                    TextField(placholderName, text: $textFieldText).disabled(editDisable)
                        .padding(10) .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray, lineWidth: 1))
                }

            }
            Divider().frame( height: 2).foregroundColor(.gray)
        }.padding(EdgeInsets(top: 5, leading: 10, bottom: 1, trailing: 10))
    }
}
