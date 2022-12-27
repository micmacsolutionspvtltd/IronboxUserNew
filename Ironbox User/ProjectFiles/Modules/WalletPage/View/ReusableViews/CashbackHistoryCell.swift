//
//  CashbackHistoryCell.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct CashbackHistoryCell: View {
    var body: some View {
        VStack(spacing : 5){
            HStack{
                Text("Package Name").fontWeight(.bold).frame(maxWidth : .infinity , alignment : .leading)
                Text("20").frame(width : 100 , alignment : .leading).foregroundColor(Constants.CustomColors.colorAppBlue)
            }
            HStack{
                Text("123456789").frame(maxWidth : .infinity , alignment : .leading)
             Spacer()
            }
        }
    }
}

struct CashbackHistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CashbackHistoryCell()
    }
}
