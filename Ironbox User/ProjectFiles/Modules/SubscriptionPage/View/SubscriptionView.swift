//
//  SubscriptionView.swift
//  Ironbox User
//
//  Created by MAC on 29/11/22.
//

import SwiftUI
import Razorpay

struct SubscriptionView: View {
   
    @State var selectedNumber : Int?
    @ObservedObject var viewModel = SubscriptionViewModel()
    @State var razorPayShow : Bool? = false
    @State var subscriptionAmount = "0"
    @State var selectPackage : Pack?
    @State var detailPageMove = false
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    
    var body: some View {
            GeometryReader{ geometry in
                ZStack{
                    //  Constants.CustomColors.colorAppGrey
                    ScrollView{
                        VStack{
                            ZStack{
                                Text("Subscription")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                                    .accentColor(Color.white)
                                HStack{
                                    HStack(alignment: .bottom ){
                                        Button(action:{
                                            //   self.presentationMode.wrappedValue.dismiss()
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
                            List(viewModel.subscriptionData?.packs ?? [], id: \.self){ valids in
                                Button{
                                    //                            //    addBirthdayPopUp = true
                                    selectedNumber = valids.id
                                    subscriptionAmount = valids.amount ?? ""
                                    selectPackage = valids
                                    //                                print(valids)
                                }label:{
                                    
                                    SubscriptionCell(packs: valids, selectedNumber: $selectedNumber)
                                    
                                }
                                .listRowSeparator(.hidden)
                            }.listStyle(PlainListStyle()).frame(width: geometry.size.width - 5, height: geometry.size.height - 50, alignment: .center)
                            
                        }
                    }
                }.edgesIgnoringSafeArea(.all)
                
                //.background(Constants.CustomColors.colorAppGrey)
                VStack{
                    Button{
//                        if ((viewModel.subscriptionData?.message ?? "false") == "Already you are a subscriber"){
//                            toastMsg = viewModel.subscriptionData?.message ?? ""
//                            errorPopup = true
//
//                        }else
                        if selectPackage == nil{
                            toastMsg = "Please select subscription package"
                          errorPopup = true
                        }else{
                            detailPageMove = true
                        }
                
                    } label: {
                        Text("Buy Subscription").frame(width: geometry.size.width/1.2, height: 50).background( Constants.CustomColors.colorAppBlue).foregroundColor(.white).cornerRadius(10)
                        
                        
                    }
                }.frame(height : 100).frame(maxWidth : geometry.size.width).background( Constants.CustomColors.appBackGroundColor).position(x: geometry.size.width/2, y: geometry.size.height/1.09).cornerRadius(20 , corners: [.topLeft , .topRight])
                

            }.onAppear(){
                viewModel.getSubscriptionPage()
                UITabBar.appearance().isHidden = true
            }.toast(isShowing: $errorPopup,textContent: toastMsg)
            .overlay(
                NavigationLink(destination: SubscriptionDetailView(subscriptionPackage: selectPackage) , isActive: $detailPageMove){
                    
                    
                }.hidden()
            )
    }
}

struct SubscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionView()
    }
}


struct SubscriptionCell: View {
    @State var packs : Pack?
    @Binding var selectedNumber : Int?
    var body: some View {
        VStack(alignment : .leading , spacing : 7){
            Text(packs?.packageName ?? "").font(.system( size: 16, weight: .light, design: .rounded)).padding(.leading , 5)
               
            Text(packs?.desc ?? "").font(.system( size: 13, weight: .medium, design: .rounded)).padding(.leading , 5)
             HStack(alignment : .center , spacing  : 0){
                VStack(spacing : 5){
                    Text("Cost").font(.system(size: 12)).fontWeight(.light).padding(.leading, 5)
                    Text("₹ \(packs?.amount ?? "0")")
                        .fontWeight(.medium).padding(.leading, 5)
                }.frame(maxWidth : .infinity)
                VStack(spacing : 5){
                    Text("Total Points").font(.system(size: 12)).fontWeight(.light)
                    Text(packs?.freePoints ?? "0")
                        .fontWeight(.medium)
                }.frame(maxWidth : .infinity)
                VStack(spacing : 5){
                    Text("Validity").font(.system(size: 12)).fontWeight(.light)
                    Text("\(packs?.expiryDays ?? "0") Days").fontWeight(.medium)
                }.frame(maxWidth : .infinity)
            }.padding(5).overlay(RoundedRectangle(cornerRadius: 7).stroke(selectedNumber == packs?.id ? Constants.CustomColors.colorAppBlue : Color.gray, lineWidth: 1)).background(selectedNumber == packs?.id ? Constants.CustomColors.colorAppBlue.opacity(0.1) : Color.clear).padding(.vertical , 5)
        }.padding(7).background(RoundedRectangle(cornerRadius: 8)
            .fill(Constants.CustomColors.colorAppleBackground)
        .shadow(color: selectedNumber == packs?.id ? Constants.CustomColors.colorAppBlue : Color.black.opacity(0.3), radius: 3, x: 1, y: 1))
    }
}
