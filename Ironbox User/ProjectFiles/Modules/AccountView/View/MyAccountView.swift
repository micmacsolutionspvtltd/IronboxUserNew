//
//  MyAccountView.swift
//  Ironbox User
//
//  Created by MAC on 23/11/22.
//

import SwiftUI

struct MyAccountView: View {
    @State var logOutDestination = false
    @EnvironmentObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                ScrollView{
                    VStack{
                        ZStack{
                            Text("Account")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .accentColor(Color.white)
                            HStack{
                                HStack(alignment: .bottom ){
                                    Button(action:{
                          NavigationUtil.popToRootView()
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
                        Image(systemName: "person.circle").resizable().frame(width: 130, height: 130)
                        Text(viewModel.homeDetailsData?.name ?? "")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(viewModel.homeDetailsData?.mobile ?? "")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.bottom , 20)
                        Spacer()
                    }.frame(height: geometry.size.height/2.3).frame(minWidth : geometry.size.width).background(Constants.CustomColors.colorAppBlue) .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
                    VStack{
                        NavigationLink(destination: AccountDetailPageView()) {
                            AccountDetailView(tittleText: "My Profile", contentText: viewModel.homeDetailsData?.mobile ?? "")
                        }
                        
                        NavigationLink(destination: GetAddressView()){
                        AccountDetailView(tittleText: "Address", contentText: "Add pickup and delivery address")
                        }
                        AccountDetailView(tittleText: "Subscription", contentText: ("Available points : " + (viewModel.homeDetailsData?.subscribtionPoints ?? "")))
                        Button {
                            StorageSettings().userId = ""
                            logOutDestination = true
                        } label: {
                            AccountDetailView(tittleText: "Sign Out", contentText: ("Version : " + String(Bundle.main.releaseVersionNumber ?? "1")))
                        }
                    }.background(.white).cornerRadius(5).padding()
                }
            }.background(Constants.CustomColors.appBackGroundColor).ignoresSafeArea(.all)
        }.background(
            NavigationLink(destination: LoginView(), isActive: $logOutDestination){
            
        }.hidden()
    )
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}



struct AccountDetailView : View{
   
    var tittleText : String
    var contentText : String
    var body: some View{
        VStack{
            HStack{
                
                VStack(alignment : .leading , spacing : 5){
                    Text(tittleText).font(.system(size: 15, weight: .bold, design: .rounded))//.multilineTextAlignment(.leading).frame(width: .infinity, alignment : .leading)
                    Text(contentText).font(.system(size: 13, weight: .light, design: .rounded)).multilineTextAlignment(.leading)//.frame(width: .infinity, alignment : .leading)
                }
                Spacer()
                Image(systemName: "chevron.right").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
            }.foregroundColor(.black)
            Divider().frame( height: 2).foregroundColor(.gray)
        }.padding(EdgeInsets(top: 12, leading: 10, bottom: 1, trailing: 10))
    }
}

