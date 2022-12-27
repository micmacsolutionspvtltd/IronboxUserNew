//
//  MoreView.swift
//  Ironbox User
//
//  Created by MAC on 22/11/22.
//

import SwiftUI

struct MoreView: View {
    @State var logOutDestination = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode> 
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                ScrollView{
                    VStack{
                    ZStack{
                        Text("More Setting")
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
                        VStack(spacing : 0){
                        VStack(alignment : .leading){
                            Text("Wallet and subscription").fontWeight(.bold).multilineTextAlignment(.leading).frame( maxWidth: .infinity , alignment : .leading)
                            HStack( spacing: 0){
                                NavigationLink(destination: WalletPageView()){
                                MoreSettingContentView(imageName: "walletMore", text: "Wallet").frame( maxWidth: .infinity)
                                }
                                NavigationLink(destination: SubscriptionView()){
                                MoreSettingContentView(imageName: "subscriptions", text: "Subscription").frame( maxWidth: .infinity)
                                }
                                NavigationLink(destination: AddBagView()){
                                MoreSettingContentView(imageName: "tcMore", text: "Request Bag").frame( maxWidth: .infinity)
                                }
                               // Spacer().frame( maxWidth: .infinity)
                            }
                            
                        }.padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
                        VStack(alignment : .leading){
                            Text("Orders and Billings").fontWeight(.bold).multilineTextAlignment(.leading).frame( maxWidth: .infinity , alignment : .leading)
                            HStack( spacing: 0){
                        NavigationLink(destination: OrderHistoryView()){
                            MoreSettingContentView(imageName: "historyMore", text: "Order history").frame( maxWidth: .infinity)
                                }
                                NavigationLink(destination: SubscriptionPackageHistory()){
                                MoreSettingContentView(imageName: "transaction", text: "Transactions").frame( maxWidth: .infinity)
                                }
                                Spacer().frame( maxWidth: .infinity)
                            }
                            
                        }.padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                        VStack(alignment : .leading){
                            Text("Rewards and Leagl").fontWeight(.bold).multilineTextAlignment(.leading).frame( maxWidth: .infinity , alignment : .leading)
                            HStack{
                                MoreSettingContentView(imageName: "referMore", text: "Refer")
                                MoreSettingContentView(imageName: "offerMore", text: "Offer zone")
                                MoreSettingContentView(imageName: "tcMore", text: "T & C")
                            }
                            
                        }.padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                        }.foregroundColor(.black)
                        VStack(spacing : 0){
                            NavigationLink(destination : MyAccountView()){
                                MoreDetailShowView(imageName: "accountMore", tittleText: "Account and Preference", contentText: "View , Profile , Edit")
                            }
                            NavigationLink(destination : GetAddressView()){
                            MoreDetailShowView(imageName: "addressMore", tittleText: "Address", contentText: "Add , Edit , delete , pickup")
                            }
                            MoreDetailShowView(imageName: "needHelp", tittleText: "Need Help?", contentText: "Call or Chat with US")
                            
                            Button {
                                StorageSettings().userId = ""
                                logOutDestination = true
                            } label: {
                                MoreDetailShowView(imageName: "signOutMore", tittleText: "Sign Out", contentText: "Verion 1.0")
                            }

                           
                        }.background(.white).cornerRadius(5).padding()
                    }.frame(minWidth : geometry.size.width)
                }.background(Constants.CustomColors.appBackGroundColor)
            }//.ignoresSafeArea(.all)
                .background(
                    NavigationLink(destination: LoginView(), isActive: $logOutDestination){
                    
                }.hidden()
            )
        }
    }
    func otpProvider(){
      //  Phoneprovi
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}


struct MoreSettingContentView : View{
    var imageName : String
    var text : String
    var body: some View{
        VStack(spacing : 3){
            Image(imageName).resizable().frame(width: 50, height: 50)
            Text(text).font(.system(size: 13)).lineLimit(1).frame( maxWidth: .infinity)
        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 1, trailing: 0)).frame( maxWidth: .infinity)
    }

}



struct MoreDetailShowView : View{
    var imageName : String
    var tittleText : String
    var contentText : String
    var body: some View{
        VStack{
            HStack{
                Image(imageName).resizable().frame(width: 40, height: 40)
                Spacer().frame(width : 20)
                VStack(alignment : .leading , spacing : 5){
                    Text(tittleText).font(.system(size: 15, weight: .bold, design: .rounded))//.multilineTextAlignment(.leading).frame(width: .infinity, alignment : .leading)
                    Text(contentText).font(.system(size: 13, weight: .light, design: .rounded)).multilineTextAlignment(.leading)//.frame(width: .infinity, alignment : .leading)
                }.foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right").resizable().aspectRatio(contentMode: .fit).frame(width: 25, height: 25)
            }
            Divider().frame( height: 2).foregroundColor(.gray)
        }.padding(EdgeInsets(top: 12, leading: 10, bottom: 1, trailing: 10))
    }
}

