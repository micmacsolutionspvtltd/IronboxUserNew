//
//  AddressChangeView.swift
//  Ironbox User
//
//  Created by MAC on 05/12/22.
//

import SwiftUI
import GoogleMaps

struct AddressChangeView: View {
    @Binding var popUpShow : Bool
    @State var addressData : GetAddressModel?
    @Binding var selectAddress : String
    @Binding var selectAddressId : Int
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
            Text("Select your Delivery Address").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue).frame(maxWidth: .infinity,alignment: .leading)
                List(addressData?.address ?? [] , id : \.self){ addressValues in
                    Button{
                        selectAddress = addressValues.address ?? ""
                        selectAddressId = addressValues.id ?? 0
                        popUpShow = false
                    }label: {
                        HStack{
                            Image("map_marker").resizable().frame(width: 50, height: 50)
                            VStack{
                                HStack{
                                    Text("Delivery to \(addressValues.type ?? "")").font(.system(size: 19, weight: .medium))
                                    Spacer()
                                }
                                HStack{
                                    Text(addressValues.address ?? "").frame(alignment : .leading).padding(.bottom , 5)
                                    Spacer()
                                }
                              
                            }
                           
                        }
                    }

                }.listStyle(.plain).frame(height: 200)
            }.padding().frame(maxWidth : .infinity)
            HStack{
                NavigationLink(destination: AddressView()){
                    HStack{
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(Constants.CustomColors.colorAppBlue).padding(5).background(Color.white).cornerRadius(5)
                        Text("Add New Address").font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                        Spacer()
                        
                    }
                   
                }.padding(12).frame(maxWidth : .infinity)
            }.background(Constants.CustomColors.colorAppBlue)
        }
    }
}

struct AddressChangeView_Previews: PreviewProvider {
    static var previews: some View {
        AddressChangeView(popUpShow: .constant(false), selectAddress: .constant(""), selectAddressId: .constant(0)).previewLayout(.sizeThatFits)
    }
}
