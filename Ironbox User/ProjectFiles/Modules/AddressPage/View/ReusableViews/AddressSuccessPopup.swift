//
//  AddressSuccessPopup.swift
//  Ironbox User
//
//  Created by MAC on 09/12/22.
//

import SwiftUI

struct AddressSuccessPopup: View {
    
    var body: some View {
        VStack{
            Image("tracking").resizable().frame(width: 150, height: 150, alignment: .center)
            Text("Address Added \n Successfully")
        }.frame(width: 200, height: 200).background(Color.white).cornerRadius(15)
    }
}

struct AddressSuccessPopup_Previews: PreviewProvider {
    static var previews: some View {
        AddressSuccessPopup().previewLayout(.sizeThatFits)
    }
}
