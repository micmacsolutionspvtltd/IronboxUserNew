//
//  OfferPopUpView.swift
//  Ironbox User
//
//  Created by MAC on 09/12/22.
//

import SwiftUI

struct OfferPopUpView: View {
    @Binding var textFieldText : String
    @Binding var popUpShow : Bool
    @State var userPromoCodeData : UserPromoCodeModel?
  //  @ObservedObject var viewModel = SubscriptionViewModel()
    var getData : () -> ()
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
                        .frame(width: 15.0, height: 15.0)
                        .foregroundColor(.black).frame(maxWidth : .infinity , alignment : .trailing)
                }.frame(maxWidth : .infinity)
                
            }.padding(.bottom , 15)
                HStack{
                    TextField("Coupon Code", text: $textFieldText).padding(.horizontal , 10)
                    Button{
                        popUpShow = false
                        getData()
                    }label: {
                        Text("Apply Coupon").foregroundColor(.white)
                    }.frame(width : 150 , height: 45) .background(Constants.CustomColors.colorAppBlue).cornerRadius(7)
                }.overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray, lineWidth: 1))

                List(userPromoCodeData?.prmocode ?? [] , id : \.self){ promo in
                    HStack{
                        Image("offerMore").resizable().frame(width: 35, height: 35)
                        VStack(alignment : .leading , spacing : 4){
                            Text(promo.promocode ?? "").fontWeight(.bold)
                            Text("Validity \(promo.validity ?? "")").font(.system(size: 12))
                        }
                        Spacer()
                        Button{
                            textFieldText = promo.promocode ?? ""
                            popUpShow = false
                            getData()
                        }label: {
                            Text("Apply").font(.system(size: 18)).foregroundColor(Constants.CustomColors.colorAppBlue)
                        }
                    }
                }.listStyle(.grouped)
                
            }.padding().frame(maxWidth : .infinity)
        }
    }
}

struct OfferPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        OfferPopUpView(textFieldText: .constant("Coupon Code"), popUpShow: .constant(false), getData: {
            
        }).previewLayout(.sizeThatFits)
    }
}
