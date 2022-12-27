//
//  OrderHistoryView.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct OrderHistoryView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = OrderHistoryViewMOdel()
    @State var orderTrackPage : Bool = false
    @State var orderHistoryData : BookingHistoryModel?

    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Constants.CustomColors.appBackGroundColor
                    VStack{
                        ZStack{
                            Text("Order History")
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
                        List(orderHistoryData?.bookingList ?? [] , id : \.self){ historyData in
                            Button{
                                orderTrackPage = true
                            }label: {
                                OrderHistoryCell(bookHistoryData: historyData)
                            }
                            .overlay(VStack {
                                        if orderTrackPage {
                                            NavigationLink(destination:  OrderTrackPageView(), isActive: $orderTrackPage) {

                                            }.isDetailLink(false).opacity(0)
                                                .background(Color.clear)

                                        }
                                    })
                        }.listStyle(.plain)
                    }
            
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        }.onAppear(){
            viewModel.orderHistoryApi(completionHandler: { (result , response , error) in
                orderHistoryData = response
            })
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
