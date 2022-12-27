//
//  HomeView.swift
//  Ironbox User
//
//  Created by MAC on 15/11/22.
//

import SwiftUI
import GoogleMaps

fileprivate let PRECALCULATED_WIDTH = true

extension HorizontalAlignment {
   private enum MyLeadingAlignment: AlignmentID {
      static func defaultValue(in dimensions: ViewDimensions) -> CGFloat {
         return dimensions[HorizontalAlignment.leading]
      }
   }
   static let myLeading = HorizontalAlignment(MyLeadingAlignment.self)
}

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    let text = "Subscribe and place your order"
    init() {
            let font = UIFont.preferredFont(forTextStyle: .body)
            textWidth = (text as NSString).size(withAttributes: [.font : font]).width
        }

        @State private var go = false

        private let textWidth: CGFloat

        private let animation = Animation.linear(duration: 5).repeatForever(autoreverses: false)
        private let transition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
        private let alignment = Alignment(horizontal: .myLeading, vertical: .center)

        @State private var reset = false
    @State var oneClickBookShow : Bool = false
    @State var tagId = ""
    @State var clothQty = ""
    @ObservedObject var orderViewModel = OrderViewModel()
    var body: some View {
        
        GeometryReader{ gp in
            ZStack{
               Constants.CustomColors.appBackGroundColor
                ScrollView{
                    VStack{
                        VStack(alignment : .leading , spacing: 10){
                            VStack(alignment : .leading , spacing: 10){
                            HStack{
                                VStack(alignment : .leading){
                                    Text("Hi \(viewModel.homeDetailsData?.name ?? "")").font(.system(size: 25, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue)
                                  
                                }
                                Spacer()
                                HStack(spacing : 8){
                                    Image("wallet").resizable().frame(width: 30, height: 30)
                                    Text(viewModel.homeDetailsData?.subscribtionPoints ?? "0").fontWeight(.medium)
                                }.padding(.vertical , 5).padding(.horizontal , 15).background(.white).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Constants.CustomColors.colorAppBlue, lineWidth: 2))
                            }
                            HStack{
                                Text("Order by 9 AM We will delivery tommorow").font(.system(size: 14)).foregroundColor(.black).fontWeight(.bold).frame(maxWidth : .infinity)
                            }.frame(maxWidth : .infinity).padding(.vertical , 15).background(.white).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(Constants.CustomColors.colorAppBlue, lineWidth: 2))
                            }.padding().background(Color.white)
                            HomeBannerImage(withURL: imageUrl + (viewModel.imageValueData?.image1 ?? "")).frame( maxWidth: .infinity).frame( height: 220).cornerRadius(15).shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1).padding()//.overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }//.padding().cornerRadius(10)
//                            .background(
//                                LinearGradient(gradient: SwiftUI.Gradient(colors: [Color(Constants.CustomColors.colorGradient),Constants.CustomColors.colorAppBlue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                     
                       // Text("Get Services").font(.system(size: 25, weight: .bold, design: .rounded)).foregroundColor(Color.black).frame(maxWidth : .infinity , alignment : .leading).padding(.horizontal , 15)
                     
                        Text(viewModel.imageValueData?.title1 ?? "")
                                .frame(maxWidth: .infinity)//.overlay(runnerView, alignment: .trailing)
                               // .id(reset)       // << should be separated otherwise running animation breaks
//                                .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
//                                    reset.toggle()
//                                }
                                .padding(.vertical , 5).padding(.bottom , 10).background(Color.black)
                        
                        
                    }.padding(.bottom ,15)
                        HStack{
                            NavigationLink{
                               // AddressView(address: GMSAddress())
                                OrderPageView(minimumOrderQty : "")
                            }label: {
                            
                            HomeShowItemsView(img: "schedulePickUp", tittle: "Schedule My Pickup")
                        }
                            Button{
                                oneClickBookShow = true
                            }label: {
                            HomeShowItemsView(img: "oneClickWhite", tittle: "One Click Booking")
                            }
                        }
                       
                      
                    }//.padding()
                if oneClickBookShow{
                    GeometryReader{_ in
                        
                        OneclickBookingPopup(quantity : $clothQty, tagId : $tagId , popupHide: $oneClickBookShow, processIroning :{
                            if clothQty == ""{
                                toastMsg = "Please Enter cloth quantity"
                                errorPopup = true
                                return
                            }else if (Int(clothQty) ?? 0) >= 100{
                                toastMsg = "Please Enter cloth less than 100"
                                errorPopup = true
                                return

                            }
                            orderViewModel.tagIdValidation(tagId: tagId) { result, response, error in
                                if result == true{
                                    if response?.status == "true"{
                                        oneClickBooking()
                                    }else{
                                        toastMsg = "Please select enter Valid tag id"
                                        errorPopup = true
                                        return
                                    }
                                    oneClickBookShow = false
                                }
                            }
                            
                        }).position(x: gp.size.width / 2, y: gp.size.height / 2)

                    }  .background(Color.black.opacity(0.6)
                        .edgesIgnoringSafeArea(.all))
                }
                }.toast(isShowing: $errorPopup,textContent: toastMsg)
            }.onAppear(){
                viewModel.homeDetailsApi { result, error in
                    if result == true{
                        
                    }else{
                        toastMsg = String("\(error)")
                        errorPopup = true
                    }
                }
                viewModel.splashImageGetApi()
            }
        }
            
    func oneClickBooking(){
        orderViewModel.oneClickBooking(quantity: clothQty, tagId: tagId) { result, response, error in
            toastMsg = "Order successfully done"
            errorPopup = true
        }
    }
@ViewBuilder var runnerView: some View {
// MARK: >> start of alternates
        if PRECALCULATED_WIDTH {
            // Simple/faster(?) variant when width of text is pre-calculated based on some known
            // font, which is not going to be changed externally.
            GeometryReader { gp in
                VStack {
                    Text(text).fontWeight(.bold)
                        .fixedSize()
                        .frame(width: gp.size.width + textWidth, alignment: .trailing)
                        .id(go)
                        .transition(transition)
                        .onAppear{ go.toggle() }
                        .animation(animation, value: go)
                }
            }.fixedSize(horizontal: false, vertical: true).foregroundColor(Constants.CustomColors.colorAppBlue)

        } else {
            // More dynamic and complex variant, does not depend on font or text size;
            // uses run-time layout engine to move text out of screen
            //
            // !!!IMPORTANT: This block must be directly copied inside
            // overlay instead of `runnerView`, otherwise introduced new
            // view (by ViewBuilder or Group) breaks overylay layout!!!
            ZStack(alignment: alignment) {
                Text(text).fontWeight(.bold).fixedSize().opacity(0)
                    .alignmentGuide(.myLeading) { $0[HorizontalAlignment.trailing] }
                GeometryReader { gp in
                    HStack(spacing: 0) {
                        Text(text).fixedSize()
                        Color.clear.frame(height: 4)
                    }
                    .animation(nil, value: go)
                    .id(go)
                    .transition(transition)
                    .onAppear{ go.toggle() }
                    .animation(animation, value: go)
                }
            }
            .frame(alignment: alignment).foregroundColor(Constants.CustomColors.colorAppBlue)
        }
}
// MARK: << end of alternates
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView( )
    }
}

struct HomeShowItemsView: View {
    
    var img : String
    var tittle : String
    
    var body: some View {
        VStack(spacing : 10){
            
                Image(img)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .center).padding(.vertical ,5)
            
           
            Text(tittle)
                .foregroundColor(Color.black).fontWeight(.regular).font(.system(size: 14)).frame(maxWidth : .infinity).padding(.vertical , 12.5).background(Color.white).cornerRadius(10 , corners: [.bottomLeft , .bottomRight])
        } .frame(width: UIScreen.main.bounds.width/2.2, height: 140).background(
           // LinearGradient(gradient: SwiftUI.Gradient(colors: [Color(Constants.CustomColors.colorGradient),Constants.CustomColors.colorAppBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            Constants.CustomColors.colorAppBlue
                .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 1))
        
       // .frame(width: 200, height: 200, alignment: .center)
//        .background(Color.init(uiColor: Constants.Color.yellowColor))
//        .padding()
    }
}

struct HomeBannerImage : View{
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
  //  @State var cornerRadiuss : CGFloat? = 0

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        
            Image(uiImage: image)
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .frame( maxWidth: .infinity).frame( height: 220)
              //  .cornerRadius(cornerRadiuss ?? 0)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
                    
               
                    
        }
    }
}
