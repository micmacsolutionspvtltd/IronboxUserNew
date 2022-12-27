//
//  OrderPageView.swift
//  Ironbox User
//
//  Created by MAC on 01/12/22.
//

import SwiftUI

struct OrderDatas : Codable , Hashable {
    var selectedDate : String?
    var selectedPickUpTime : String?
    var selectedPickUpTimeId : String?
    var selectedDeliveryTime : String?
    var selectedDeliveryTimeId : String?
    var clothCount : String?
    var tagNumber : String?
    var selectAddress : String?
    var selectAddressId : String?
    var deliveryDate : String?
}

struct OrderPageView: View {
    @State var minimumOrderQty = ""
    @State var selectedDate : String? = ""
    @State var selectedPickUpTime : String? = ""
    @State var selectedDeliveryTime : String? = ""
    @ObservedObject var viewModel = AddressViewModel()
    @ObservedObject var orderViewModel = OrderViewModel()
    @State var addressData : GetAddressModel?
    @State var selectZoneId : Int? = 0
    @State var selectedTimeId : Int? = 0
    @State var selectedDeliveryId : Int? = 0
    @State var addressSelectPopup : Bool = false
    @State var clothCount = ""
    @State var tagNumber = ""
    @State var cookingInstruction = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var selectedAddress = ""
    @State var isSelected = false
    @State var orderDetailPopup = false
    @State var timeSlotsArray  = [String]()
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    @State var selectAddressId : Int = 0
    @State var processData : OrderDatas?
    var body: some View {
        
            GeometryReader{ geometry in
                ZStack{
                    ScrollView{
                        VStack{
                            ZStack{
                                Text("Schedule my pickup")
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
                            }
                            
                            .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 20))
                            .frame(minWidth: geometry.size.width,maxHeight: 60)
                            .background(Constants.CustomColors.colorAppBlue)
                            VStack(alignment: .center , spacing: 5){
                                Image("orderPage").resizable().frame(width: 300, height: 200)
                             //   if viewModel.addressData != nil{
                                    VStack{
                                        if viewModel.addressData?.count != 0{
                                            HStack{
                                                Image("map_marker").resizable().frame(width: 50, height: 50)
                                                VStack{
                                                    HStack{
                                                        Text("Delivery to Home").font(.system(size: 21, weight: .bold))
                                                        Spacer()
                                                        Button{
                                                            addressSelectPopup = true
                                                        }label: {
                                                            Text("Change").foregroundColor(Constants.CustomColors.colorAppBlue)
                                                               
                                                        }.padding(EdgeInsets(top: 8, leading: 0, bottom: 5, trailing: 10))
                                                      
                                                    }
                                                    HStack{
                                                        Text(selectedAddress).frame(alignment : .leading).padding(.bottom , 5)
                                                        Spacer()
                                                    }
                                                  
                                                }
                                               
                                            }
                                        }else{
                                            NavigationLink(destination: AddressView()){
                                            HStack{
                                                Image("map_marker").resizable().frame(width: 50, height: 50)
                                                VStack{
                                                    HStack{
                                                        Text("Add Address").font(.system(size: 21, weight: .bold))
                                                        Spacer()
                                                   //     Button{
                                                         //   addressSelectPopup = true
                                                  //      }label: {
                                                            Text("Add").foregroundColor(Constants.CustomColors.colorAppBlue)
                                                               
                                                        
                                                   // }//
                                                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 5, trailing: 10))
                                                      
                                                    }
                                                    HStack{
                                                        Text("You don't have address please add address").multilineTextAlignment(.leading).frame(alignment : .leading).padding(.bottom , 5)
                                                        Spacer()
                                                    }
                                                  
                                                }
                                               
                                            }
                                        }
                                        }

                                        CartItemContentView(selectedItemName: $selectedDate, tittleText: "Pickup Date", buttonName:  "Select Date", imageName: "chevron.down" , firstImg: "calendar" , dropDownDatas : viewModel.timeSlotData ,getDataValue: {
                                           
                                            orderViewModel.getTimeSlots(bookingDate: selectedDate ?? "", zoneId: String(selectZoneId ?? 0), completionHandler: { (result , response ,error) in
                                                if result == true{
                                                    
                                                }else{
                                                    toastMsg = "Pickup time slots not available"
                                                    errorPopup = true
                                                }
                                            })
                                        })
                                        CartItemContentView(selectedItemName: $selectedPickUpTime, tittleText: "Pickup time", buttonName:  "Select Pickup time", imageName: "chevron.down" , firstImg: "clock.fill" , dropDownDatas : orderViewModel.pickupTime  ,getDataValue: {
                                            for i in orderViewModel.getTimeSlotData?.pickupTimeSlot ?? []{
                                                if i.pickupTimeSlot == selectedPickUpTime{
                                                    selectedTimeId = i.id
                                                }
                                            }
                                        })
                                        CartItemContentView(selectedItemName: $selectedDeliveryTime, tittleText: "Delivery time", buttonName:  "Select Delivery time", imageName: "chevron.down" , firstImg: "clock.fill" , dropDownDatas : orderViewModel.deliveryTime   ,getDataValue: {
                                            for i in orderViewModel.getTimeSlotData?.deliveryTimeSlot ?? []{
                                                if i.deliveryTimeSlot == selectedDeliveryTime{
                                                    selectedDeliveryId = i.id
                                                }
                                            }
                                        })
                                        CartClothView(clothCount: $clothCount, tittleText: "Cloth count : Avaiable points",  textPlaceHolder : "Enter Cloth Count", firstImg: "clock.fill"  ,getDataValue: {
    
                                        })
                                        CartClothView(clothCount: $tagNumber, tittleText: "Tag Number" , textPlaceHolder : "Enter Tag Number",  firstImg: "clock.fill"  , textAlignMent: .center ,getDataValue: {
    
                                        })
                                        TextField("Add cooking Instructions(Optional)", text: $cookingInstruction)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity, minHeight :51, maxHeight: 51)
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)).padding(.horizontal , 15).padding(.top ,7)
                                        HStack{
                                            Image(systemName: isSelected ? "checkmark.square" : "square").resizable().frame(width: 25, height: 25).foregroundColor(Constants.CustomColors.colorAppBlue)
                                            Text("Proceed ironing even if the cloth has stain or damage")
                                                .font(.system(size: 12, design: .rounded))
                                                .fontWeight(.light).foregroundColor(.black)
                                          
                                        }.padding(.horizontal , 15)
                                    }.padding(13).frame(maxWidth : geometry.size.width/1.05).background(RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.white)
                                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(10)
                               // }
                               
                            }.foregroundColor(Constants.CustomColors.textBGColor)
                                .padding(.bottom , 70)
                        }
                    }
                    HStack(spacing : 0){
                        Button{
                            
                        }label: {
                            Text("Cancel").fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue)
                        }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppleBackground)
                        Button{
                            
                            checkValidations()
                        }label: {
                            Text("Proceed Ironing").fontWeight(.bold).foregroundColor(.white)
                        }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppBlue)
                    }.position(x: geometry.size.width/2, y: geometry.size.height/1.035).cornerRadius(20 , corners: [.topLeft , .topRight])
                    if addressSelectPopup{
                        VStack{
                            Spacer()
                            AddressChangeView(popUpShow: $addressSelectPopup , addressData : addressData , selectAddress: $selectedAddress, selectAddressId: $selectAddressId).background(Color.white).cornerRadius(15 , corners: [.topRight , .topLeft])
                        }      .background(Color.black.opacity(0.6)
                            .edgesIgnoringSafeArea(.all))
                    }
                    if orderDetailPopup{
                        VStack{
                            Spacer()
                            OrderDetailPopupView(popUpShow: $orderDetailPopup , orderProcessData: processData!, confirmClick: {
                                orderViewModel.orderBooking(addressId: String(selectAddressId ), bookingDate: selectedDate ?? "", pickUpSlotId: String(selectedTimeId ?? 0), quantity: clothCount, tagId: tagNumber, damageClothIron: isSelected ? "1" : "0", deliveryTimeSlotId: String(selectedDeliveryId ?? 0), deliveryDate: processData?.deliveryDate ?? "") { result, response, error in
                                    if result == true{
                                        if response?.error == "true"{
                                            
                                        }else{
                                            
                                        }
                                    }
                                }
                            }).background(Color.white).cornerRadius(15 , corners: [.topRight , .topLeft])
                        }      .background(Color.black.opacity(0.6)
                            .edgesIgnoringSafeArea(.all))
                    }
                   
                }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
                    .onAppear(){
                        viewModel.getAddress { _, response, _ , timeSlots in
                            if response != nil{
                                addressData = response
                                timeSlotsArray = timeSlots ?? []
                                if addressData?.address?.count != 0{
                                   
                                    selectedAddress = addressData?.address?[0].address ?? ""
                                    selectAddressId = addressData?.address?[0].id ?? 0
                                    selectZoneId = addressData?.address?[0].zoneID
                                }
                            }
                        }
                    }
            }.toast(isShowing: $errorPopup,textContent: toastMsg)
    }
    func checkValidations(){
        if selectedAddress == ""{
            toastMsg = "Please select address"
            errorPopup = true
            return
        }else if selectedDate == "" || selectedDate == "select date"{
            toastMsg = "Please select pickupdate"
            errorPopup = true
            return
        }else if selectedPickUpTime == ""{
            toastMsg = "Please select pickuptime"
            errorPopup = true
            return
        }else if selectedDeliveryTime == ""{
            toastMsg = "Please select Deliverytime"
            errorPopup = true
            return
        }else if clothCount == ""{
            toastMsg = "Please select clothcount"
            errorPopup = true
            return
        }else if tagNumber == ""{
            toastMsg = "Please select tagNumber"
            errorPopup = true
            return
        }else{
            orderViewModel.tagIdValidation(tagId: tagNumber) { result, response, error in
                if result == true{
                    if response?.status == "true"{
                        processData = OrderDatas(selectedDate: selectedDate, selectedPickUpTime: selectedPickUpTime, selectedPickUpTimeId: String(selectedTimeId ?? 0), selectedDeliveryTime: selectedDeliveryTime, selectedDeliveryTimeId: String(selectedDeliveryId ?? 0), clothCount: clothCount, tagNumber: tagNumber, selectAddress: selectedAddress, selectAddressId: String(selectAddressId) , deliveryDate: orderViewModel.getTimeSlotData?.deliveryDate)
                        orderDetailPopup = true
                    }else{
                        toastMsg = "Please select enter Valid tag id"
                        errorPopup = true
                        return
                    }
                }
            }
         
        }
    }
}

struct OrderPageView_Previews: PreviewProvider {
    static var previews: some View {
        OrderPageView( )
    }
}



struct CartItemContentView: View {
    @Binding var selectedItemName : String?
    var tittleText = "Date Of Order"
    @State var buttonName = "30-03-3022"
    var imageName = "calendar"
    var firstImg = "calendar"
    var dropDownDatas : [String] = []
    var getDataValue : () -> ()
    @State var text = "Hello World"

   
    var body: some View {
        VStack(alignment : .leading){
            Text(tittleText)
                .foregroundColor(Constants.CustomColors.textBGColor)
                .frame(alignment: .leading).padding(.vertical ,7).padding(.horizontal ,10)
              //  Spacer()
        HStack{
           
            Button{
              //  print(dropDownDatas)
              // getDataValue()
            }label: {
                ZStack{
                    Menu {
                        VStack{
                            ForEach(dropDownDatas , id :\.self){ names in
                                Button(action: {
                                    buttonName = names
                                  selectedItemName = names
                                    getDataValue()
                                }) {
                                    Label(names, systemImage: "pencil")
                                }
                            }
                        }
                    } label: {
                        ZStack(alignment : .leading){
                            Text(buttonName).padding(.leading , 30).frame(alignment : .leading)
                          
                        HStack{
                            Image(systemName: firstImg).frame(width: 20, height: 20).foregroundColor(Constants.CustomColors.colorAppBlue)
                            Spacer()
                            Image(systemName: imageName)
                                
                                .frame(width: 20, height: 20)
                               // .padding([.trailing],5)
                        }
                    }.frame(width: UIScreen.main.bounds.width/1.3)
                }
                }.frame(height: 25).padding(13).foregroundColor(Constants.CustomColors.textBGColor)
                    .background(Color("ColorAppGrey")).cornerRadius(8)

                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                   // .background(Color("ColorAppGrey"))

            }
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 15, trailing: 5))
        .frame(width: UIScreen.main.bounds.width/1.1)
        //.background(Color.black)
    }.background(RoundedRectangle(cornerRadius: 5)
        .fill(Color.white)
        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(10)
        
    }
}

struct CartClothView: View {
    @Binding var clothCount : String
    var tittleText = "Date Of Order"
    @State var textPlaceHolder = "30-03-3022"
  
    var firstImg = "calendar"
    var textAlignMent :  TextAlignment = .leading
    var getDataValue : () -> ()
    @State var text = "Hello World"
    
   
    var body: some View {
        VStack(alignment : .leading){
            Text(tittleText)
                .foregroundColor(Constants.CustomColors.textBGColor)
                .frame(alignment: .leading).padding(.vertical ,7).padding(.horizontal ,10)
              //  Spacer()
        HStack{
           
        
                ZStack {
                        ZStack(alignment : .leading){
                          
                        HStack{
                            Image(systemName: firstImg).frame(width: 20, height: 20).foregroundColor(Constants.CustomColors.colorAppBlue)
                            TextField(textPlaceHolder, text: $clothCount).multilineTextAlignment(textAlignMent)
                           
                               // .padding([.trailing],5)
                        }
                    }.frame(width: UIScreen.main.bounds.width/1.3)
                }
            
                .frame(height: 25).padding(13).foregroundColor(Constants.CustomColors.textBGColor)
                    .background(Color("ColorAppGrey")).cornerRadius(8)

                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                   // .background(Color("ColorAppGrey"))

            }
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 15, trailing: 5))
        .frame(width: UIScreen.main.bounds.width/1.1)
        //.background(Color.black)
   // }.background(RoundedRectangle(cornerRadius: 5)
     //   .fill(Color.white)
       // .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1)).padding(10)
        
    }
}
