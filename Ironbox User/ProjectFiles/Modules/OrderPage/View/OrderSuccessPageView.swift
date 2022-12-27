//
//  OrderSuccessPageView.swift
//  Ironbox User
//
//  Created by MAC on 07/12/22.
//

import SwiftUI

struct OrderSuccessPageView: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Constants.CustomColors.appBackGroundColor
                ScrollView{
                    VStack{
                    ZStack{
                        Text("Order Successful")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(nil)
                            .accentColor(Color.white)
                    }
                    .padding(EdgeInsets(top: 30, leading: 10, bottom: 20, trailing: 20))
                    .frame(minWidth: geometry.size.width,maxHeight: 60)
                    .background(Constants.CustomColors.colorAppBlue)
                        Image("ironBoxIcon").resizable().frame(width: 120, height: 120)
                        Text("Booking Successful").font(.system(size: 18)).fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue)
                        VStack(spacing : 5){
                            OrderSuccessPageContents(textKey: "Booking ID: ", textValue: "Pickup Date")
                            OrderSuccessPageContents(textKey: "Pickup Location : ", textValue: "02/12/2022")
                            OrderSuccessPageContents(textKey: "Pickup Location : ", textValue: "Pickup Time")
                            OrderSuccessPageContents(textKey: "", textValue: "12.00PM")

                        }.padding(10).background(Color.white).padding()
                        VStack(spacing : 5){
                            Text("Booking Details").fontWeight(.bold).foregroundColor(.white).frame(maxWidth : .infinity).padding(.vertical , 7).background(Constants.CustomColors.colorAppBlue)
                            VStack(spacing : 3){
                                OrderSuccessPageContents(textKey: "Tag number", textValue: ":" , textsAlignment: .leading)
                                OrderSuccessPageContents(textKey: "Number of cloth", textValue: ":" , textsAlignment: .leading)
                                OrderSuccessPageContents(textKey: "Delivery Date", textValue: ":" , textsAlignment: .leading)
                                OrderSuccessPageContents(textKey: "Delivery time", textValue: ":" , textsAlignment: .leading)
                            }.padding(.horizontal , 10)
                       
                           
                            Text("Subscription Details").fontWeight(.bold).foregroundColor(.white).frame(maxWidth : .infinity).padding(.vertical , 7).background(Constants.CustomColors.colorAppBlue)
                            VStack(spacing : 3){
                            OrderSuccessPageContents(textKey: "Available points", textValue: "12" )
                            OrderSuccessPageContents(textKey: "Number of cloth", textValue: "12" )
                                Divider().background(Constants.CustomColors.colorAppBlue)
                            OrderSuccessPageContents(textKey: "Remaining Points", textValue: "12")
                                Divider().background(Constants.CustomColors.colorAppBlue)
                            }.padding(.horizontal , 10)
                           
                            
                        }.background(Color.white).cornerRadius(10).padding()
                    }.padding(.bottom ,50)
                }
                Button{
                    NavigationUtil.popToRootView()
                }label: {
                    
                
                Text("Home").fontWeight(.bold).foregroundColor(.white)
                }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppBlue).position(x: geometry.size.width/2, y: geometry.size.height).cornerRadius(20 , corners: [.topLeft , .topRight])
            }.edgesIgnoringSafeArea(.all).navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }
    }
}

struct OrderSuccessPageView_Previews: PreviewProvider {
    static var previews: some View {
        OrderSuccessPageView()
    }
}


struct OrderSuccessPageContents: View {
    var textKey  = "Booking Id"
    var textValue = "PickUp Date"
    var textsAlignment : Alignment = .trailing
    var body: some View {
        HStack{
            Text(textKey).font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
            Text(textValue).font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: textsAlignment)
        }
    }
}
