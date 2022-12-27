//
//  SubscriptionPackageHistory.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct SubscriptionPackageHistory: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = SubscriptionViewModel()
    @State var subscriptionHistoryData : SubscriptionHistoryModel?
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Constants.CustomColors.appBackGroundColor
              
                    VStack{
                        ZStack{
                            Text("Subscription  History")
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
                        } .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 0))
                            .frame(maxWidth: geometry.size.width,maxHeight: 60)
                            .background(Constants.CustomColors.colorAppBlue)
                        List(subscriptionHistoryData?.data ?? [] , id : \.self){ package in
                      //  List(0..<10){ _ in
                            PackageListCell(historyDatas: package)
                        }.listStyle(.plain)
                    }
                
            }.onAppear(){
                viewModel.subscripionPackageHistory(completionHandler: { (result, response, error) in
                    subscriptionHistoryData = response
                })
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}

struct SubscriptionPackageHistory_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionPackageHistory()
    }
}
