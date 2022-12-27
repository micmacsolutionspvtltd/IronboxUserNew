//
//  PackageListCell.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct PackageListCell: View {
    var historyDatas : SubscriptionHistory?
    var body: some View {
        VStack{
            HStack{
                Image("splashicon").resizable().frame(width: 25, height: 25)
                Text(historyDatas?.packageName ?? "").foregroundColor(.white)
                Spacer()
            } .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 0))
                .frame(maxWidth: .infinity,maxHeight: 40)
                .background((historyDatas?.packageActiveStatus ?? "") == "1"  ? Color.green :  Constants.CustomColors.colorAppBlue).cornerRadius(5 , corners: [.topLeft , .topRight])
            VStack(spacing : 5){
                HStack{
                    Text("OrderID").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    Text(": \(historyDatas?.subID ?? "0")").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                }
                HStack{
                    Text("Payment Date").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    Text(": \(Common.sharedInstance.dateFormatterStraight(date: historyDatas?.paymentdate ?? ""))").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                }
                HStack{
                    Text("Expiry Date").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    Text(": \(Common.sharedInstance.dateFormatterStraight(date: historyDatas?.subscriberExpiryDate ?? ""))").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                }
                HStack{
                    Text("Package Status").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    Text(": \((historyDatas?.packageActiveStatus ?? "") == "1" ? "Active" : "Completed")").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                }

            }.padding(.horizontal , 10)
            Divider()
            HStack{
                VStack(spacing : 5){
                    Text("Package Amount").font(.system(size: 13))
                    Text("₹ \(historyDatas?.packageAmount ?? "")").font(.system(size: 13))
                }.padding(.vertical , 4).frame(maxWidth : .infinity)
                Divider().frame(width : 2)
                VStack(spacing : 5){
                    Text("Credits").font(.system(size: 13))
                    Text(historyDatas?.totalPoints ?? "").font(.system(size: 13))
                }.padding(.vertical , 4).frame(maxWidth : .infinity)
                Divider().frame(width : 2)
                VStack(spacing : 5){
                    Text("Available Credits").font(.system(size: 12))
                    Text(historyDatas?.remainingPoints ?? "").font(.system(size: 13))
                }.padding(.vertical , 4).frame(maxWidth : .infinity)
            }.frame(height : 60)
        }.background(RoundedRectangle(cornerRadius: 5)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1))//.padding(5)

    }
}

struct PackageListCell_Previews: PreviewProvider {
    static var previews: some View {
        PackageListCell().previewLayout(.sizeThatFits)
    }
}
