//
//  ViewAddressCell.swift
//  Ironbox User
//
//  Created by MAC on 30/11/22.
//

import SwiftUI
import GoogleMaps


struct ViewAddressCell: View {
    var addressData : Address?
    
    @State var editClicked : Bool = false
    var primaryClicked : () -> ()
    var body: some View {
        VStack(alignment : .leading , spacing: 8){
            HStack{
                if addressData?.type == "1"{
                    Text("Home").frame(alignment : .leading)
                }else if addressData?.type == "2"{
                    Text("Office").frame(alignment : .leading)
                }else{
                    Text("Others").multilineTextAlignment(.leading).frame(maxWidth : .infinity).frame(alignment : .leading)
                }
            }.frame(maxWidth : .infinity).frame(height : 40).background(Constants.CustomColors.colorAppBlue).cornerRadius(8 , corners: [.topLeft , .topRight]).foregroundColor(.white)
            HStack(spacing : 10){
            Text(addressData?.address ?? "")
            Spacer()
            Button{
                
            } label: {
                Image(systemName: "xmark.bin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25.0, height: 25.0)
                    .foregroundColor(Constants.CustomColors.colorAppBlue)
            }
            }.padding(10)
            VStack(spacing : 0){
                Divider().frame(height : 1).background(Color.gray)
            
            HStack{
                Button{
                   editClicked = true
                }label : {
                    Text("Edit").fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue)
                }.frame( maxWidth: .infinity).frame(height : 50)
                if addressData?.primaryAddress == "1"{
                    Button{
                        
                    } label: {
                        Text("Primary address").fontWeight(.bold).foregroundColor(.white)
                    }.frame( maxWidth: .infinity).frame(height : 50).background(Constants.CustomColors.colorAppBlue).buttonStyle(.plain)
                }else{
                    Button{
                        primaryClicked()
                    } label: {
                        Text("Set as primary").fontWeight(.bold)
                            .foregroundColor(.white)
                    }.frame( maxWidth: .infinity).frame(height : 50).background(Constants.CustomColors.colorAppBlue).buttonStyle(.borderless)
                }
           
            }.cornerRadius(8 , corners: [.bottomLeft , .bottomRight])
        }
            .background(
                NavigationLink(destination: AddressView(addressData : addressData ), isActive: $editClicked, label: {
                    
                }).hidden()
            )
        }.frame( maxWidth: .infinity).background(RoundedRectangle(cornerRadius: 8)
            .fill(Color.white)
            .shadow(color:  Color.black.opacity(0.3), radius: 3, x: 1, y: 1))//.padding(5)
        
    }
}

struct ViewAddressCell_Previews: PreviewProvider {
    static var previews: some View {
        ViewAddressCell( primaryClicked:{
            
        }) .previewLayout(.sizeThatFits)
    }
}
