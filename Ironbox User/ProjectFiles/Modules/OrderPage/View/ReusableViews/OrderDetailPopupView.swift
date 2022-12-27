//
//  OrderDetailPopupView.swift
//  Ironbox User
//
//  Created by MAC on 07/12/22.
//

import SwiftUI

struct OrderDetailPopupView: View {
    @Binding var popUpShow : Bool
    @State var moveSuccessPage = false
    var orderProcessData : OrderDatas?
    var confirmClick : () -> ()
    var body: some View {
        VStack(alignment : .leading){
            VStack{
               
            HStack{
                Spacer().frame(maxWidth : .infinity)
                Divider().frame(width: 70, height: 5, alignment: .center).background(Color.gray).padding(.top , 10).frame(maxWidth : .infinity)
                Button(action:{
                 popUpShow = false
                }){
                    Image(systemName: "multiply")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(.black).frame(maxWidth : .infinity , alignment : .trailing)
                }.frame(maxWidth : .infinity)
                
            }
            Text("Booking Details").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue).frame(maxWidth: .infinity,alignment: .center)

            }.padding().frame(maxWidth : .infinity)
            VStack{
                VStack(spacing : 5){
                HStack{
                    Text("Pickup Location").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                    Text(": \(orderProcessData?.selectAddress ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                }
                HStack{
                    Text("Pickup Date").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                    Text(": \(orderProcessData?.selectedDate ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                }
                HStack{
                    Text("Pickup Time").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                    Text(": \(orderProcessData?.selectedPickUpTime ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                }
                HStack{
                    Text("Delivery Date").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                    Text(": \(orderProcessData?.deliveryDate ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                }
                HStack{
                    Text("Delivery Time").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                    Text(": \(orderProcessData?.selectedDeliveryTime ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                }
                    HStack{
                        Text("Tag Number").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                        Text(": \(orderProcessData?.tagNumber ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                    }
            }
                VStack{
//                    Text("Tag Number").fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue).frame(maxWidth : .infinity,alignment: .leading).padding(.top ,5)
//                    HStack{
//                        Text("12345").font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(Color.white)
//                    }.frame(maxWidth : .infinity).padding(.vertical , 10).background(Constants.CustomColors.colorAppBlue)
//                    Divider().background(Constants.CustomColors.colorAppBlue).padding(2)
                    VStack(spacing : 7){
                    HStack{
                        Text("Available Points").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                        Text("12").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .trailing)
                    }.padding(.horizontal , 5)
                    HStack{
                        Text("Number of cloth").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                        Text(": \(orderProcessData?.clothCount ?? "")").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .trailing)
                    }.padding(.horizontal , 5)
                        Divider().background(Constants.CustomColors.colorAppBlue).padding(2)
                        HStack{
                            Text("Remaining Points").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .leading)
                            Text("12").font(.system(size: 16, weight: .regular, design: .rounded)).frame(maxWidth : .infinity,alignment: .trailing)
                        }.padding(.horizontal , 5)
                        Divider().background(Constants.CustomColors.colorAppBlue).padding(2)
                }
                }
            }.padding(10)//.frame(maxWidth : .infinity)
            Button{
                moveSuccessPage = true
            } label: {
                HStack{
                    Text("Confirm").font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                }.frame(maxWidth : .infinity).padding(.vertical , 10).background(Constants.CustomColors.colorAppBlue)
            }
          //  HStack{
            .overlay(
                NavigationLink(destination: OrderSuccessPageView() , isActive: $moveSuccessPage){
                 
                   
                }.hidden()
                )//.padding(12).frame(maxWidth : .infinity)
          //  }
        }
    }
}

struct OrderDetailPopupView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailPopupView(popUpShow: .constant(false), confirmClick: {
            
        }).previewLayout(.sizeThatFits)
    }
}
