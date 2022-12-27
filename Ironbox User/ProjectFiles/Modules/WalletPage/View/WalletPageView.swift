//
//  WalletPageView.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct WalletPageView: View {
    @State var refferalClicked = true
    @State var cashbackClicked = false
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Constants.CustomColors.appBackGroundColor
              //  ScrollView{
                    VStack{
                        ZStack{
                            Text("Subscription Buy History")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                                .accentColor(Color.white)
                            HStack{
                                HStack(alignment: .bottom ){
                                    Button(action:{
                      //  self.presentationMode.wrappedValue.dismiss()
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
                        }.padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 0))
                            .frame(maxWidth: geometry.size.width,maxHeight: 60)
                            .background(Constants.CustomColors.colorAppBlue)
                        
                        VStack(spacing : 15){
                            VStack(spacing : 15){
                                Text("Available Balance").font(.system(size: 18)).fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue)
                                Text("₹").font(.system(size: 18)).fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue)
                            }
                            HStack{
                                Text("Refferal Balance").font(.system(size: 16)).fontWeight(.bold).foregroundColor(Color.black).frame(maxWidth : .infinity , alignment : .leading)
                                Text("₹").font(.system(size: 18)).fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue).frame(maxWidth : .infinity , alignment : .trailing)
                            }
                            Divider()
                            HStack{
                            Text("CashBack Balance").font(.system(size: 16)).fontWeight(.bold).foregroundColor(Color.black).frame(maxWidth : .infinity , alignment : .leading)
                            Text("₹").font(.system(size: 18)).fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue).frame(maxWidth : .infinity , alignment : .trailing)
                        }
                        }.padding().background(RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(10)
                        HStack{
                            Button{
                                cashbackClicked = false
                                refferalClicked = true
                                
                            } label: {
                                Text("Refferral History").font(.system(size: 16)).fontWeight(.bold).foregroundColor(Color.black)
                            }.frame(maxWidth : .infinity)
                            Button{
                                refferalClicked = false
                                cashbackClicked = true
                            } label: {
                                Text("CashBack History").font(.system(size: 16)).fontWeight(.bold).foregroundColor(Color.black)
                            }.frame(maxWidth : .infinity)
                    }.padding(13).background(RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(10)

                        if refferalClicked{
                            List(0..<10 , id : \.self){ num in
                                RefferalHistoryCell()
                            }.listStyle(.plain)
                        }else{
                            List(0..<10 , id : \.self){ num in
                                CashbackHistoryCell()
                            }.listStyle(.plain)

                        }

                    }
             // }
            }.navigationBarBackButtonHidden().navigationBarHidden(true)
        }
    }
}

struct WalletPageView_Previews: PreviewProvider {
    static var previews: some View {
        WalletPageView()
    }
}
