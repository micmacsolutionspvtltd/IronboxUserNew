//
//  OrderHistoryCell.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct OrderHistoryCell: View {
    var bookHistoryData : BookingList?
    var body: some View {
        VStack{
            HStack{
                VStack(spacing : 5){
                    Text("Booking Point").font(.system(size: 14)).fontWeight(.bold)
                    Text(String(bookHistoryData?.subPoints ?? 0)).font(.system(size: 14)).fontWeight(.bold)
                    Text("Confirmed").font(.system(size: 14)).fontWeight(.bold)
                }.frame(width : 120)
             
                VStack{
                    HStack{
                        Text("Booking ID").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                        Text(": \(bookHistoryData?.orderId ?? "")").font(.system(size: 14))            .minimumScaleFactor(0.005)
                            .lineLimit(1).frame(maxWidth : .infinity , alignment: .leading)
                    }
                    HStack{
                        Text("Pickup Date").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                        Text(": \(Common.sharedInstance.dateFormatterStraight(date: bookHistoryData?.pickingDate ?? ""))").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    }
                    HStack{
                        Text("Delivery Date").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                        Text(": \(Common.sharedInstance.dateFormatterStraight(date: bookHistoryData?.deliveryDate ?? ""))").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    }
                    HStack{
                        Text("Number Of Cloths").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                        Text(": \(bookHistoryData?.quantity ?? 0)").font(.system(size: 14)).frame(maxWidth : .infinity , alignment: .leading)
                    }
                }.padding(5).background(Color.white).cornerRadius(5 , corners: [.topRight , .bottomRight])
            }.background(RoundedRectangle(cornerRadius: 5)
                .fill(Constants.CustomColors.colorAppBlue)
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1))//.padding(.vertical , 15)
        }
    }
}

struct OrderHistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryCell().previewLayout(.sizeThatFits)
    }
}
