//
//  AddressDetailPageView.swift
//  Ironbox User
//
//  Created by MAC on 08/12/22.
//

import SwiftUI

struct AccountDetailPageView: View {
    @EnvironmentObject var homeViewModel : HomeViewModel
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Constants.CustomColors.appBackGroundColor
                ScrollView{
                    VStack{
                        ZStack{
                            Text("My profile")
                                .font(.system(size: 20))
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
                        .frame(minWidth: geometry.size.width,maxHeight: 60).background(Constants.CustomColors.colorAppBlue)
                        NavigationLink(destination : AccountEditView()){                        
                        HStack{
                            Spacer()
                            HStack{
                                Image(systemName: "square.and.pencil").resizable().frame(width: 20, height: 20)
                                Text("Edit").fontWeight(.medium)
                            }.padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)).background(.white).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Constants.CustomColors.colorAppBlue, lineWidth: 1))
                        }.padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
                        }
                        VStack{
                            AccountContentsShowView(tittle: "User name", descriptions: homeViewModel.homeDetailsData?.name ?? "")
                            AccountContentsShowView(tittle: "Email ID", descriptions: homeViewModel.homeDetailsData?.email ?? "")
                            AccountContentsShowView(tittle: "Mobile Number", descriptions: homeViewModel.homeDetailsData?.mobile ?? "Not added")
                            AccountContentsShowView(tittle: "Alternate Number", descriptions: homeViewModel.homeDetailsData?.alternateNumber ?? "Not added")
                            AccountContentsShowView(tittle: "Gender", descriptions: homeViewModel.homeDetailsData?.gender ?? "Not added")
                            AccountContentsShowView(tittle: "Family member count", descriptions: "Not specified")
                        }.padding(.vertical ,15).background(Color.white).cornerRadius(10).padding(10)
                    }
                }.onAppear(){
                    homeViewModel.homeDetailsApi { result, error in
                        if result == true{
                           // homeDetailsData = result
                        }else{
                            toastMsg = String("\(error)")
                            errorPopup = true
                        }
                    }
                }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
            }.toast(isShowing: $errorPopup,textContent: toastMsg)
        }
    }
}

struct AddressDetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailPageView()
    }
}

struct AccountContentsShowView: View {
    var tittle : String
    var descriptions : String
    var body: some View {
        VStack{
            HStack{
            
            VStack(alignment : .leading ,spacing: 5){
                Text(tittle).font(.system(size: 17, weight: .regular, design: .rounded))
                Text(descriptions).font(.system(size: 14, weight: .light, design: .rounded))
               
            }
             Spacer()
            
            }.padding( .horizontal , 10).padding(.vertical , 7).frame(maxWidth : .infinity)
            Divider().frame(height : 2).background(Constants.CustomColors.colorAppGrey)
        }

    }
}
