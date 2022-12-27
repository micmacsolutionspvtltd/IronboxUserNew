//
//  SignUpTextField.swift
//  Ironbox User
//
//  Created by MAC on 11/11/22.
//

import Foundation
import SwiftUI



struct SignupTextField : View{
    var placeHolderText : String = ""
    var image = "group"
    @Binding  var userName : String
    
    var body: some View{
        HStack(spacing : 20){
          //  Spacer().frame(width: 1)
            Image(image)
                .resizable().scaledToFit().frame(width: 25, height: 25).padding(.leading ,15)

            TextField(placeHolderText, text: $userName).textContentType(.oneTimeCode)
        }.frame( height: 50).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)).background(RoundedRectangle(cornerRadius: 5)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1))
    }
}

