//
//  GetAddressView.swift
//  Ironbox User
//
//  Created by MAC on 30/11/22.
//

import SwiftUI
import GoogleMaps


struct GetAddressView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = AddressViewModel()
    @State var getAddressData : GetAddressModel?
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                ScrollView{
                    VStack{
                        ZStack{
                            Text("Address Setting")
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
                        .frame(minWidth: geometry.size.width,maxHeight: 60)
                        .background(Constants.CustomColors.colorAppBlue)
                        VStack(alignment: .center , spacing: 5){
                            Image("adressTopImg").resizable().frame(width: 200, height: 200)
                            Text("Address Book").font(.system(size: 22)).fontWeight(.bold)
                            Text("A new address can be added and \n existing address can be edited here").font(.system(size: 16)).fontWeight(.light).frame(alignment: .center)
                        }.foregroundColor(Constants.CustomColors.textBGColor)
                      
                        List(getAddressData?.address ?? [] , id : \.self){ addressValues in
                            ViewAddressCell(addressData: addressValues, primaryClicked: {
                                viewModel.setPrimaryAddress(addressId: (String(addressValues.id ?? 0))) { result, response, error in
                                    errorPopup = true
                                    toastMsg = "Primary Address"
                                    getAddressApi()
                                }
                            })
                                .listRowSeparator(.hidden)
                        }.listStyle(.plain).frame(width: geometry.size.width - 5, height: geometry.size.height - 50, alignment: .center)
                    }.frame(maxWidth : .infinity)
                }
                NavigationLink(destination: AddressView()){
                    ZStack{
                            Text("ADD NEW ADDRESS").foregroundColor(.white).fontWeight(.bold)
                        HStack{
                        Spacer()
                        Image(systemName: "plus").resizable().frame(width: 23, height: 23).padding().foregroundColor(Constants.CustomColors.colorAppBlue).background(Color.white).cornerRadius(.infinity)
                            Spacer().frame(width : 2)
                        }
                    
                        
                    }.frame(width: geometry.size.width/1.2, height: 60).background(Constants.CustomColors.colorAppBlue).cornerRadius(.infinity)
                }.position(x: geometry.size.width/2, y: geometry.size.height/1.13)
            }.toast(isShowing: $errorPopup,textContent: toastMsg).onAppear(){
               getAddressApi()
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }.ignoresSafeArea(.all)
    }
    func getAddressApi(){
        viewModel.getAddress(completionHandler: { _ , response , _,_  in
            getAddressData = response
        })
    }
}

struct GetAddressView_Previews: PreviewProvider {
    static var previews: some View {
        GetAddressView()
    }
}
