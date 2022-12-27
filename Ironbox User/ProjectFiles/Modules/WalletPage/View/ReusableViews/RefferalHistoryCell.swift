//
//  RefferalHistoryCell.swift
//  Ironbox User
//
//  Created by MAC on 14/12/22.
//

import SwiftUI

struct RefferalHistoryCell: View {
    var body: some View {
        VStack(spacing : 5){
            HStack{
                Text("Name").fontWeight(.bold).frame(maxWidth : .infinity , alignment : .leading)
                Text("20").frame(width : 100 , alignment : .leading)
            }
            HStack{
                Text("123456789").frame(maxWidth : .infinity , alignment : .leading)
                Text("12/12/2022").frame(width : 100 , alignment : .leading)
            }
        } .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1).padding(10)
    }
}

struct RefferalHistoryCell_Previews: PreviewProvider {
    static var previews: some View {
        RefferalHistoryCell().previewLayout(.sizeThatFits)
    }
}
