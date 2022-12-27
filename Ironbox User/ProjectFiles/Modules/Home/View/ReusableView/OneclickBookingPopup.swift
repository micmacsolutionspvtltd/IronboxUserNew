//
//  OneclickBookingPopup.swift
//  Ironbox User
//
//  Created by Naveen Kumar on 25/12/22.
//

import SwiftUI

struct OneclickBookingPopup: View {
    @Binding var quantity : String
    @Binding var tagId : String
    @Binding var popupHide : Bool
    @EnvironmentObject var viewModel : HomeViewModel
    var processIroning : () -> ()
    var body: some View {
        VStack(alignment : .leading , spacing: 10){
            Text("Cloth Count :- (Available Points : \(viewModel.homeDetailsData?.subscribtionPoints ?? "")").font(.system(size :17)).foregroundColor(Constants.CustomColors.textBGColor).frame(maxWidth : .infinity)
            SignupTextField(placeHolderText: "Minimum cloth count \(viewModel.homeAllData?.subscriberDetails?.minimumOrderQuantity ?? "")", image: "substitution" , userName: $quantity).padding(.horizontal , 10)
            SignupTextField(placeHolderText: "Please enter tag no", image: "substitution" , userName: $tagId).padding(.horizontal , 10)
            HStack(spacing : 0){
                Button{
                    popupHide = false
                }label: {
                    Text("Cancel").fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue)
                }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppleBackground).cornerRadius(10, corners: [.bottomLeft])
                Button{
                    processIroning()
                   // checkValidations()
                }label: {
                    Text("Proceed Ironing").fontWeight(.bold).foregroundColor(.white)
                }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppBlue).cornerRadius(10, corners: [ .bottomRight])
            }.frame(maxWidth : .infinity).padding(10)
        }.padding().background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(10)
    }
}

struct OneclickBookingPopup_Previews: PreviewProvider {
    static var previews: some View {
        OneclickBookingPopup(quantity: .constant(""), tagId: .constant(""), popupHide: .constant(false), processIroning: {
            
        }).previewLayout(.sizeThatFits)
    }
}
