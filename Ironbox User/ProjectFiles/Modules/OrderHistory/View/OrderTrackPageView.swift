//
//  OrderTrackPageView.swift
//  Ironbox User
//
//  Created by MAC on 17/12/22.
//

import SwiftUI

struct OrderTrackPageView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        GeometryReader{ gp in
            ZStack{
               Constants.CustomColors.appBackGroundColor
                ScrollView{
                    VStack{
                        VStack{
                        HStack{
                            HStack(alignment: .bottom ){
                                Button(action:{
                                    self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Image(systemName: "arrow.left")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25.0, height: 25.0)
                                        .foregroundColor(.black)
                                }.padding()
                                Spacer()
                            }
                        }
                        HStack{
                            VStack( alignment: .leading , spacing: 5){
                                VStack(spacing: 20){
                                    Text("Track Order").font(.system(size: 19, weight: .bold, design: .rounded)).frame(maxWidth : .infinity , alignment : .leading)
                                    Text("07- Dec -2022").font(.system(size: 15, weight: .bold, design: .rounded)).frame(maxWidth : .infinity , alignment : .leading)
                                }
                           
                                Text("00-00-00").font(.system(size: 15, weight: .regular, design: .rounded)).frame(maxWidth : .infinity , alignment : .leading)
                                Text("BookingId : 12345").font(.system(size: 15, weight: .regular, design: .rounded)).frame(maxWidth : .infinity , alignment : .leading).foregroundColor(Constants.CustomColors.colorAppBlue)
                                Text("Total Points : 20").font(.system(size: 15, weight: .regular, design: .rounded)).frame(maxWidth : .infinity , alignment : .leading)
                             Spacer()
                            }.frame(maxWidth : .infinity).padding(.leading , 10)
                            HStack{
                                Image("adressTopImg").resizable().frame(width: 150, height: 150)
                            }.frame(maxWidth : .infinity).padding(.trailing , 10)
                        }
                        HStack{
                            HStack(alignment: .bottom ){
                                Button(action:{
                                   // self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Text("View Bill").fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue)
                                }
                                Spacer()
                            }.padding(.horizontal , 10)
                        }
                        VStack(spacing : 0){
                            Divider()
                            HStack{
                                Button(action:{
                                   // self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Text("Help").fontWeight(.bold)
                                }.frame(maxWidth : .infinity)
                                Divider().frame(width : 1)
                                Button(action:{
                                   // self.presentationMode.wrappedValue.dismiss()
                                }){
                                    Text("Feedback").fontWeight(.bold)
                                }.frame(maxWidth : .infinity)
                            }.foregroundColor(Constants.CustomColors.colorAppBlue).frame(height : 45)
                        }
                        }.background(Color.white)
                        VStack{
                            HStack{
                                VStack(spacing : 2){
                                    VStack(spacing : 2){
                                        Image("more").resizable().frame(width: 15, height: 15)
                                    Divider().frame(width: 1, height: 40).background(Color.black)
                                        
                                }.padding(.leading , 50)
                                    VStack(spacing : 2){
                                        Image("more").resizable().frame(width: 15, height: 15)//.padding(.top , 50)
                                    Divider().frame(width: 1, height: 40).background(Color.black)
                                        
                                }.padding(.leading , 50)
                                    VStack(spacing : 2){
                                        Image("more").resizable().frame(width: 15, height: 15)//.padding(.top , 50)
                                    Divider().frame(width: 1, height: 40).background(Color.black)
                                        
                                }.padding(.leading , 50)
                                    VStack(spacing : 2){
                                        Image("more").resizable().frame(width: 15, height: 15)//.padding(.top , 50)
                                    Divider().frame(width: 1, height: 40).background(Color.black)
                                        Image("more").resizable().frame(width: 15, height: 15)
                                        
                                }.padding(.leading , 50)
                                }//.padding(.to)
                              
                                
                                VStack(spacing : 20){
                            HStack{
                                Image("more").resizable().frame(width: 40, height: 40)
                                VStack(alignment : .leading){
                                    Text("Order Confirmed").font(.system(size: 16, weight: .medium, design: .rounded)).frame(maxWidth : .infinity , alignment: .leading)
                                    Text("Your order was confirmed by vendor").font(.system(size: 10))
                                }
                            }
                                    HStack{
                                        Image("more").resizable().frame(width: 40, height: 40)
                                        VStack(alignment : .leading){
                                            Text("Order pickup").font(.system(size: 16, weight: .medium, design: .rounded)).frame(maxWidth : .infinity , alignment: .leading)
                                            Text("Your order was confirmed by vendor").font(.system(size: 10))
                                        }
                                    }
                                    HStack{
                                        Image("more").resizable().frame(width: 40, height: 40)
                                        VStack(alignment : .leading){
                                            Text("Ironing inprocess").font(.system(size: 16, weight: .medium, design: .rounded)).frame(maxWidth : .infinity , alignment: .leading)
                                            Text("Your order was confirmed by vendor").font(.system(size: 10))
                                        }
                                    }
                                    HStack{
                                        Image("more").resizable().frame(width: 40, height: 40)
                                        VStack(alignment : .leading){
                                            Text("Ironing Completed").font(.system(size: 16, weight: .medium, design: .rounded)).frame(maxWidth : .infinity , alignment: .leading)
                                            Text("Your order was confirmed by vendor").font(.system(size: 10))
                                        }
                                    }
                                    HStack{
                                        Image("more").resizable().frame(width: 40, height: 40)
                                        VStack(alignment : .leading){
                                            Text("Order Delivered").font(.system(size: 16, weight: .medium, design: .rounded)).frame(maxWidth : .infinity , alignment: .leading)
                                            Text("Your order was confirmed by vendor").font(.system(size: 10))
                                        }
                                    }
                            }
                            }
                        }.padding(.top , 20)
                    }
                }
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }
    }
}

struct OrderTrackPageView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTrackPageView()
    }
}
