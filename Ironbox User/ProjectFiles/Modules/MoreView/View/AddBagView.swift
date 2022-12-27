//
//  AddBagView.swift
//  Ironbox User
//
//  Created by MAC on 22/12/22.
//

import SwiftUI

struct AddBagView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                ScrollView{
                    VStack(spacing : 30){
                    ZStack{
                        Text("Add bag")
                            .font(.system(size: 22))
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
                    }.padding(EdgeInsets(top: 30, leading: 10, bottom: 20, trailing: 20))
                            .frame(minWidth: geometry.size.width,maxHeight: 60)
                            .background(Constants.CustomColors.colorAppBlue)
                        
                        Image("orderPage").resizable().frame( maxWidth: .infinity).frame( height: 220).cornerRadius(15).shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1).padding()
                        HStack{
                            VStack(alignment : .leading){
                              Text("Add Bag")
                              Text("Price : 50")
                            }
                            Spacer()
                            HStack{
                                Button{
                                    
                                } label: {
                                    Image(systemName: "minus.square").resizable().frame(width: 10, height: 10)
                                }
                                Text("0")
                                Button{
                                    
                                } label: {
                                    Image(systemName: "plus").resizable().frame(width: 10, height: 10)
                                }
                            }.padding(5).background(Constants.CustomColors.colorAppBlue).foregroundColor(.white).cornerRadius(5)
                        }.padding().background(RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(.horizontal , 15)
                    }
                }
            }
        }
    }
}

struct AddBagView_Previews: PreviewProvider {
    static var previews: some View {
        AddBagView()
    }
}
