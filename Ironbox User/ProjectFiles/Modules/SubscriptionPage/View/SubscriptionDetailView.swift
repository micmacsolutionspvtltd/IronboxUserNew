//
//  SubscriptionDetailView.swift
//  Ironbox User
//
//  Created by MAC on 08/12/22.
//

import SwiftUI

struct SubscriptionDetailView: View {
    var subscriptionPackage : Pack?
    @ObservedObject var viewModel = SubscriptionViewModel()
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var cashBackisSelected = false
    @State var refferalIsSelected = false
    @State var walletData : WalletModel?
    @State var referralData : UserRefferalValidateModel?
    @State var totalAmountCalculation : String = ""
    @State var offerApplied : Bool = false
    @State var textFieldText : String = ""
    @State var offerListPopupShow : Bool = false
    @State var promoCodeData : UserPromoCodeModel?
    @State var promoValidateData : PromoValidateModel?
    @State var razorPayShow : Bool? = false
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Constants.CustomColors.appBackGroundColor
                ScrollView{
                    VStack{
                        ZStack{
                            Text("Subscription Details")
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
                        .padding(EdgeInsets(top: 30, leading: 10, bottom: 20, trailing: 20))
                        .frame(minWidth: geometry.size.width,maxHeight: 60)
                        .background(Constants.CustomColors.colorAppBlue)
                        HStack{
                            Text("Package Details").font(.system(size: 14, weight: .regular, design: .rounded))
                            Spacer()
                        }.padding(.horizontal , 15).padding(.top , 15)
                      
                        VStack{
                            HStack{
                                VStack(alignment: .leading , spacing : 5){
                                    Text("Package Name").font(.system(size: 16, weight: .bold, design: .rounded))
                            Text(subscriptionPackage?.packageName ?? "").font(.system(size: 14, weight: .light, design: .rounded))
                            Text("Description").font(.system(size: 16, weight: .bold, design: .rounded))
                            Text(subscriptionPackage?.desc ?? "").font(.system(size: 14, weight: .light, design: .rounded))
                                }
                                Spacer()
                            }
                            Divider()
                            HStack{
                                VStack{
                                    Text("Cost").font(.system(size: 16, weight: .bold, design: .rounded))
                                    Text(subscriptionPackage?.amount ?? "").font(.system(size: 14, weight: .light, design: .rounded))
                                }.frame(maxWidth : .infinity)
                                VStack{
                                    Text("Total Points").font(.system(size: 16, weight: .bold, design: .rounded))
                                    Text(subscriptionPackage?.freePoints ?? "0").font(.system(size: 14, weight: .light, design: .rounded))
                                }.frame(maxWidth : .infinity)
                                VStack{
                                    Text("Validity").font(.system(size: 16, weight: .bold, design: .rounded))
                                    Text("\(subscriptionPackage?.expiryDays ?? "0") Days").font(.system(size: 14, weight: .light, design: .rounded))
                                }.frame(maxWidth : .infinity)
                            }
                        }.padding(10)  .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)).background(Color.white).cornerRadius(10).padding(.horizontal , 10)
                        if (walletData?.refferalTotalAmount ?? "") != "0" || (walletData?.cashbackTotalAmount ?? "") != "0"{
                            if (walletData?.refferalTotalAmount ?? "") != "0" && (walletData?.refferalTotalAmount ?? "") != "" &&   (walletData?.cashbackTotalAmount ?? "") != "0" &&  (walletData?.cashbackTotalAmount ?? "") != "" {
                                HStack{
                                    Text("Selection Wallet Option Pay").font(.system(size: 14, weight: .regular, design: .rounded))
                                    Spacer()
                                }.padding(.horizontal , 15).padding(.top , 15)
                                }
                            }
                      
                        VStack(spacing : 0){
                            if (walletData?.refferalTotalAmount ?? "") != "0" && (walletData?.refferalTotalAmount ?? "") != ""{
                                Button{
                                    cashBackisSelected = false
                                    refferalIsSelected = !refferalIsSelected
                                    if refferalIsSelected == true{
                                        refferalIsSelected = true
                                        viewModel.userReferralIdValidate(totalAmount: (walletData?.refferalTotalAmount ?? "")) { resilt, response, error in
                                            referralData = response
                                            totalAmountCalculation = String((Float(subscriptionPackage?.amount ?? "") ?? 0.00) - (Float(response?.totalamount ?? 0) ))
                                        }
                                      
                                       
                                    }else{
                                        refferalIsSelected = false
                                        totalAmountCalculation = (subscriptionPackage?.amount ?? "")
                                    }
                                }label: {
                            HStack{
                                VStack(alignment: .leading , spacing : 5){
                                    Text("Refferal amount ₹ " + "\(walletData?.refferalTotalAmount ?? "")").font(.system(size: 15, weight: .regular, design: .rounded))
                                    Text("Utilized 10% amount").font(.system(size: 13, weight: .regular, design: .rounded))
                                    
                                }
                                Spacer()
                                Image(systemName: refferalIsSelected ? "checkmark.square" : "square").resizable().frame(width: 20, height: 20).foregroundColor(refferalIsSelected ? Color.white : Constants.CustomColors.colorAppBlue)
                            }.padding(10).background(refferalIsSelected ? Constants.CustomColors.colorAppBlue : Color.white)
                                }.foregroundColor(refferalIsSelected ? Color.white : Color.black)
                        }
                            if (walletData?.cashbackTotalAmount ?? "") != "0" &&  (walletData?.cashbackTotalAmount ?? "") != ""{
                                Button{
                                    refferalIsSelected = false
                                    cashBackisSelected = !cashBackisSelected
                                    if cashBackisSelected == true{
                                        cashBackisSelected = true
                                        totalAmountCalculation = String((Float(subscriptionPackage?.amount ?? "") ?? 0.00) - (Float(walletData?.cashbackTotalAmount ?? "") ?? 0.00))
                                    }else{
                                        cashBackisSelected = false
                                        totalAmountCalculation = (subscriptionPackage?.amount ?? "")
                                    }
                                }label: {                                
                            HStack{
                                VStack(alignment: .leading , spacing : 5){
                                    Text("Cashback amount ₹ " + "\(walletData?.cashbackTotalAmount ?? "")").font(.system(size: 15, weight: .regular, design: .rounded))
                                    Text("Utilized 10% amount").font(.system(size: 13, weight: .regular, design: .rounded))
                                    
                                }
                                Spacer()
                                Image(systemName: cashBackisSelected ? "checkmark.square" : "square").resizable().frame(width: 20, height: 20).foregroundColor(cashBackisSelected ? Color.white : Constants.CustomColors.colorAppBlue)
                            }.padding(10).background(cashBackisSelected ? Constants.CustomColors.colorAppBlue : Color.white).foregroundColor(cashBackisSelected ? Color.white : Color.black)
                                }
                            }
                        }.background(Color.white).padding(10).foregroundColor(.black)
                            
                        HStack{
                            Text("Select Offers").font(.system(size: 14, weight: .regular, design: .rounded))
                            Spacer()
                        }.padding(.horizontal , 15).padding(.top , 15)
                        if offerApplied{
                         
                            HStack{
                                Image( "offerMore").resizable().frame(width: 20, height: 20).foregroundColor(Constants.CustomColors.colorAppBlue)
                                Text(String(promoValidateData?.discountAmount ?? 0)).font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue)
                                Spacer()
                                Button{
                                    offerApplied = false
                                 }label: {
                                Image(systemName:  "multiply").frame(width: 20, height: 20).foregroundColor(Constants.CustomColors.colorAppBlue)
                                }
                            }.padding(.horizontal , 15).padding(15)  .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)).background(Color.white).cornerRadius(10).padding(.horizontal , 10)

                        }else{
                            
                        
                        Button{
                            offerListPopupShow = true
                       
                        }label: {
                        HStack{
                            Image("offerMore").resizable().frame(width: 20, height: 20).foregroundColor(Constants.CustomColors.colorAppBlue)
                            Text("Select Offers").font(.system(size: 16, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue)
                            Spacer()
                            Image(systemName:  "chevron.right").frame(width: 20, height: 20).foregroundColor(Constants.CustomColors.colorAppBlue)
                        }.padding(.horizontal , 15).padding(15)  .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2)).background(Color.white).cornerRadius(10).padding(.horizontal , 10)
                        }
                    }
                        HStack{
                            Text("Bill Details").font(.system(size: 14, weight: .regular, design: .rounded))
                            Spacer()
                        }.padding(.horizontal , 15).padding(.top , 15)
                        VStack{
                            HStack{
                            Text("Total").font(.system(size: 16, weight: .bold, design: .rounded))
                            Spacer()
                            Text("₹ \(subscriptionPackage?.amount ?? "")").font(.system(size: 16, weight: .bold, design: .rounded))
                            }.padding(.vertical,2)
                            Divider().frame(height: 2).background(Color.gray)
                            if refferalIsSelected{
                                HStack{
                                Text("Refferal Amount").font(.system(size: 16, weight: .regular, design: .rounded))
                                Spacer()
                                    Text("- ₹ \(referralData?.totalamount ?? 0)").font(.system(size: 16, weight: .regular, design: .rounded))
                                }.padding(.vertical,2)
                            }
                        
                            if cashBackisSelected{
                                HStack{
                                Text("Cashback Amount").font(.system(size: 16, weight: .regular, design: .rounded))
                                Spacer()
                                    Text("- ₹ \(walletData?.cashbackTotalAmount ?? "")").font(.system(size: 16, weight: .regular, design: .rounded))
                                }.padding(.vertical,2)
                            }
                         
                            if offerApplied{
                                HStack{
                                Text("Discount Price").font(.system(size: 16, weight: .regular, design: .rounded))
                                Spacer()
                                    Text("₹ \(promoValidateData?.discountAmount ?? 0)").font(.system(size: 16, weight: .regular, design: .rounded)).padding(.bottom , 40)
                                }.padding(.vertical,2)
                            }
                       
                        }.padding(.horizontal , 20)
                        
                    }
                }
                HStack(spacing : 0){
                    Button{
                        
                    }label: {
                        VStack(spacing : 3){
                            Text("Amount to pay").font(.system(size: 14)).fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue)
                            Text("Total $ \(totalAmountCalculation)").font(.system(size: 16)).fontWeight(.medium).foregroundColor(Constants.CustomColors.colorAppBlue)
                        }
                     
                    }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppleBackground)
                    Button{
                      //  orderDetailPopup = true
                    razorPayShow = true
                    }label: {
                        Text("Pay Now").fontWeight(.bold).foregroundColor(.white)
                    }.frame(height : 50).frame(maxWidth : .infinity).background(Constants.CustomColors.colorAppBlue)
                }.position(x: geometry.size.width/2, y: geometry.size.height/1.035).cornerRadius(20 , corners: [.topLeft , .topRight])
                if offerListPopupShow{
                    VStack{
                        Spacer()

                        OfferPopUpView(textFieldText: $textFieldText, popUpShow: $offerListPopupShow , userPromoCodeData : promoCodeData , getData: {
                            viewModel.checkValidPromoCode(totalAmount: subscriptionPackage?.amount ?? "", offerCode: textFieldText) { result, response, error in
                                if response?.error == "true"{
                                    toastMsg = response?.errorMessage ?? ""
                                     errorPopup = true
                                }else{
                                    offerApplied = true
                                    totalAmountCalculation = String((Float(totalAmountCalculation) ?? 0.00) - Float(response?.discountAmount ?? 0) )

                                }
                            }
                        }).frame(height : 250).background(Color.white).cornerRadius(15 , corners: [.topRight , .topLeft])
                    }      .background(Color.black.opacity(0.6)
                        .edgesIgnoringSafeArea(.all))
                }
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
                .onAppear(){
                    totalAmountCalculation = (subscriptionPackage?.amount ?? "")
                    
                    viewModel.getPromoCodeDetails { result, response, error in
                        promoCodeData = response
                    }
                    
                    viewModel.getWaletDetails(completionHandler: { (result , response, error) in
                        walletData = response
                        
                    })
                }
            if razorPayShow ?? false{
                RazorPayMethod(amount : totalAmountCalculation ?? "" , getPaymetId: { result in
                    if result == "Failure"{
                        toastMsg = "Payment failed please try again"
                        errorPopup = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            NavigationUtil.popToRootView()
                        }
                    }else{
                        viewModel.subscripionPaymentApi(totalAmount: totalAmountCalculation, refferAmt: refferalIsSelected ? String(referralData?.totalamount ?? 0) : "", promoId: offerApplied ? String(promoValidateData?.promoID ?? 0) : "", refferId: String(referralData?.refID ?? 0), promoCodeAmt:  offerApplied ? String(promoValidateData?.discountAmount ?? 0) : "", packageId: String(subscriptionPackage?.id ?? 0), cashBackAmt: cashBackisSelected ? (walletData?.cashbackTotalAmount ?? "") : "") { result, response, error in
                            toastMsg = "Payment failed please try again"
                            errorPopup = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                NavigationUtil.popToRootView()
                            }
                        }
                    }
                })
            }
        }.toast(isShowing: $errorPopup,textContent: toastMsg)
    }
}

struct SubscriptionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionDetailView()
    }
}
