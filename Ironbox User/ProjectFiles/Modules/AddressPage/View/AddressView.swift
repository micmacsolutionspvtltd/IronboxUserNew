//
//  AddressView.swift
//  Ironbox User
//
//  Created by MAC on 16/11/22.
//

import SwiftUI
import GoogleMaps
import CoreLocation
import Combine
import GooglePlaces
import UIKit


struct AddressView: View {
    @State var addressData : Address?
    @State var addressSearch : String = ""
    @ObservedObject var locationManager = LocationManager()
    @State var address : GMSAddress?
    @State var fullAddress = ""
    @State var searchAddress : CLLocationCoordinate2D = CLLocationCoordinate2D()
    @State var openPlacePicker = false
    @State var addFlatClicked : Bool = false
    @State var flatNo : String = ""
    @State var blockNo : String = ""
    @State var buildingName : String = ""
    @State var streetName : String = ""
    @State var areaName : String = ""
    @State var cityName : String = ""
    @State var landMark : String = ""
    @State var pincode : String = ""
    @State var errorPopup : Bool? = false
    @State var toastMsg : String = "Not valid"
    @State var addressType : String = ""
    @State var lat : Double = 0.0
    @State var long : Double = 0.0
    @State var addressSuccessPopup = false
    @ObservedObject var viewModel = AddressViewModel()
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    var body: some View {
        GeometryReader{ geometry in
            
            VStack{
                ZStack{
                    Text("Add Address")
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
                            Button(action:{
                                openPlacePicker = true
                            }){
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25.0, height: 25.0)
                                    .foregroundColor(.white)
                                
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 30, leading: 10, bottom: 20, trailing: 20))
                .frame(minWidth: geometry.size.width,maxHeight: 60)
                .background(Constants.CustomColors.colorAppBlue)
              
                //SignupTextField(placeHolderText : "Search Your address" , image : "substitution" , userName : $addressSearch)
              
                ZStack{
                   
                        VStack{
                            if addressData != nil{
                              //  GoogleMapsView(address: $address , gestureEnable: addFlatClicked , lat : Double(lat) ?? 0.00 , long : Double(long) ?? 0.00).frame(maxWidth: .infinity).frame(height: UIScreen.main.bounds.height/2)
                                GoogleMapsEditView( address: $address, gestureEnable: addFlatClicked, lat: Double(addressData?.latitude ?? "0.0") ?? 0.0, long: Double(addressData?.longitude ?? "0.0") ?? 0.0)
                            }else{
                            GoogleMapsView(location :locationManager.locationCoordinate, address: $address , gestureEnable: addFlatClicked)//.frame(maxWidth: .infinity).frame(height: UIScreen.main.bounds.height/2)
                            }
                        }
                    
             
                    if addFlatClicked{
                        
                       
//                        VStack{
//
//                            Spacer().background(Color.red)
                       
                        VStack{
                            
                            ScrollView{
                                
                                Divider().frame(width: 70, height: 5, alignment: .center).background(Color.gray).padding(.top , 10)
                            HStack{
                                VStack(alignment : .leading){
                                    Text("Delivery Location").font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue).frame(alignment : .leading)
                                    Text("Adjust Pin to set the delivery location").font(.system(size: 14, weight: .light, design: .rounded)).multilineTextAlignment(.leading).frame(alignment : .leading)
                                }
                                Spacer()
                                Button(action:{
                                    addFlatClicked = false
                                }){
                                    Image(systemName: "multiply")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20.0, height: 20.0)
                                        .foregroundColor(.black)

                                }
                            }.padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                            VStack{

                                AddAddressTextView(textFieldText: $buildingName, placholderName: "Building Name (Optional)")
                                HStack(spacing : 5){
                                    AddAddressTextView(textFieldText: $blockNo, placholderName: "Block No (optional)")
                                    AddAddressTextView(textFieldText: $flatNo, placholderName: "Flat / House No")
                                }
                                AddAddressTextView(textFieldText: $streetName, placholderName: "Street Name")
                                AddAddressTextView(textFieldText: $areaName, placholderName: "Area")
                                HStack(spacing : 5){
                                AddAddressTextView(textFieldText: $cityName, placholderName: "City")
                                AddAddressTextView(textFieldText: $pincode, placholderName: "Pincode")
                                }
                                AddAddressTextView(textFieldText: $landMark, placholderName: "Landmark")
                                HStack(spacing : 20){
                                    Button{
                                        addressType = "1"
                                    }label: {
                                       Text("Home")
                                            .fontWeight(.bold).foregroundColor(addressType == "1" ? Color.white :  Constants.CustomColors.colorAppBlue).frame(maxWidth: .infinity)
                                    }
                                    .frame(height: 40).background(addressType == "1" ? Constants.CustomColors.colorAppBlue : Color.white).cornerRadius(7)
                                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Constants.CustomColors.colorAppBlue , lineWidth: 1))
                                    Button{
                                        addressType = "2"
                                    }label: {
                                       Text("Office")
                                            .fontWeight(.bold).foregroundColor(addressType == "2" ? Color.white :  Constants.CustomColors.colorAppBlue).frame(maxWidth: .infinity)

                                    }
                                    .frame(height: 40).background(addressType == "2" ? Constants.CustomColors.colorAppBlue : Color.white).cornerRadius(7)
                                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Constants.CustomColors.colorAppBlue , lineWidth: 1))
                                    Button{
                                        addressType = "3"
                                    }label: {
                                       Text("Others")
                                            .fontWeight(.bold).foregroundColor(addressType == "3" ? Color.white :  Constants.CustomColors.colorAppBlue).frame(maxWidth: .infinity)
                                    }
                                    .frame(height: 40).background(addressType == "3" ? Constants.CustomColors.colorAppBlue : Color.white).cornerRadius(7)
                                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Constants.CustomColors.colorAppBlue , lineWidth: 1))
                                  //  .background(addressType == "Spice Kitchen" ? Color.red : Color.black)
//                                   // .cornerRadius(10)
                                }.padding(EdgeInsets(top: 5, leading: 10, bottom: 1, trailing: 10))
                            }.padding(.horizontal , 15)
//
                            VStack{
                                Text(fullAddress)
                                    .frame( height: 45).frame(maxWidth : .infinity).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)).onChange(of: address) { mapAddress in
                                        let removeSomeCommas = "\(mapAddress?.thoroughfare ?? " "), \(mapAddress?.subLocality ?? " "),\(mapAddress?.locality ?? " "), \(mapAddress?.administrativeArea ?? " "), \(mapAddress?.postalCode ?? "")"
                                       // fullAddress = removeSomeCommas.replacingOccurrences(of: " ,", with: "")
                                        fullAddress = address?.lines?[0] ?? ""
                                        
                                    }
                            }.frame(height : 0).hidden()
                            Button{
                                errorPopup = true
                                if addressType.isEmpty{
                                    toastMsg = "Please select address type"
                                    return
                                }else if flatNo.isEmpty{
                                    toastMsg = "Please enter flatno"
                                    return
                                }else if streetName.isEmpty{
                                    toastMsg = "Please enter street name"
                                    return
                                }else if landMark.isEmpty{
                                    toastMsg = "Please enter landmark"
                                    return
                                }else if areaName.isEmpty{
                                    toastMsg = "Please enter area name"
                                    return
                                }else if cityName.isEmpty{
                                    toastMsg = "Please enter city name"
                                    return
                                }
                                if addressData != nil{
                                    viewModel.editAddress(loginType: addressType, flatNo: flatNo, landMark: landMark, pinCode: pincode,streetName: streetName, address: fullAddress, lat: String(address?.coordinate.latitude ?? 0.0), lon: String(address?.coordinate.longitude ?? 0.0), area: areaName, city: cityName, addressId: String(addressData?.id ?? 0) , buildingName : buildingName , blockNo : blockNo , otherName: "") { status, response, error in
                                        if status == true{
                                            addressSuccessPopup = true
                                            toastMsg = response?.errorMessage ?? ""
                                        }else{
                                            toastMsg = "\(error)"
                                        }
                                        if response?.error == "true"{
                                            DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
                                                addressSuccessPopup = false
                                                presentationMode.wrappedValue.dismiss()
                                            }
                                        }
                                    }
                                }else{
                                viewModel.addAddress(loginType: addressType, flatNo: flatNo, landMark: landMark, pinCode: pincode, streetName: streetName, address: fullAddress, lat: String(address?.coordinate.latitude ?? 0.0), lon: String(address?.coordinate.longitude ?? 0.0), area: areaName, city: cityName ,otherName : "" , buildingName : buildingName , blockNo : blockNo) { status, response, error in
                                    if status == true{
                                        
                                        toastMsg = response?.errorMessage ?? ""
                                    }else{
                                        toastMsg = "\(error)"
                                    }
                                    if response?.error == "true"{
                                        addressSuccessPopup = true
                                        DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
                                            addressSuccessPopup = false
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    }
                                  
                                }
                                }

                            }label: {
                                Text("SAVE ADDRESS").fontWeight(.bold).foregroundColor(.white)
                            }.frame(maxWidth : .infinity).frame(height: 50).background(Constants.CustomColors.colorAppBlue).cornerRadius(10).padding()
                        }
                        }.frame(maxWidth: .infinity).frame(height: UIScreen.main.bounds.height/1.3).background(.white)
                          //  .animation(Animation.easeOut(duration: 5.0).delay(0.5))
                       // }.background(Color.clear)
                    }
                 
                    if addressSuccessPopup{
                        GeometryReader{ _ in
                            AddressSuccessPopup().frame(width: 350, height: 250)
                            .background(Color.white)
                             .cornerRadius(8)
                            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                        }.background(Color.black.opacity(0.6))
                            .edgesIgnoringSafeArea(.all)
//
                    }
                }.frame(maxHeight: .infinity)
                
                if !addFlatClicked{
                Divider().frame(width: 70, height: 5, alignment: .center).background(Color.gray)
                HStack{
                    VStack(alignment : .leading){
                        Text("Delivery Location").font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(Constants.CustomColors.colorAppBlue).frame(alignment : .leading)
                        Text("Adjust Pin to set the delivery location").font(.system(size: 14, weight: .light, design: .rounded)).multilineTextAlignment(.leading).frame(alignment : .leading)
                    }
                    Spacer()
                }.padding()
                VStack{
                    Text(fullAddress)
                        .frame( height: 45).frame(maxWidth : .infinity).padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)).overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)).onChange(of: address) { mapAddress in
                            let removeSomeCommas = "\(mapAddress?.thoroughfare ?? " "), \(mapAddress?.subLocality ?? " "),\(mapAddress?.locality ?? " "), \(mapAddress?.administrativeArea ?? " "), \(mapAddress?.postalCode ?? "")"
                            cityName = "\(mapAddress?.locality ?? "") , \(mapAddress?.administrativeArea ?? "")"
                            areaName = mapAddress?.subLocality ?? ""
                            streetName = mapAddress?.thoroughfare ?? ""
                            pincode = mapAddress?.postalCode ?? ""
                            fullAddress = removeSomeCommas.replacingOccurrences(of: " ,", with: "")
                            fullAddress = mapAddress?.lines?[0] ?? ""
                        }
                }.padding()
                Button{
                    addFlatClicked = true
                }label: {
                    Text("ADD FLAT NO / HOUSE NO / BUILDING").foregroundColor(.white)
                }.frame(maxWidth : .infinity).frame(height: 50).background(Constants.CustomColors.colorAppBlue).cornerRadius(10).padding()
            }
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
            .onAppear(){
                if addressData != nil{
                    blockNo = addressData?.blockNo ?? ""
                    buildingName = addressData?.buildingName ?? ""
                    flatNo = addressData?.flatNo ?? ""
                    landMark = addressData?.landmark ?? ""
                    cityName = addressData?.city ?? ""
                    areaName = addressData?.area ?? ""
                    streetName = addressData?.street ?? ""
                    pincode = addressData?.pincode ?? ""
                    fullAddress = addressData?.address ?? ""
                    lat = Double(addressData?.latitude ?? "") ?? 0.00
                    long = Double(addressData?.longitude ?? "") ?? 0.00
                    addressType = addressData?.type ?? "3"
                }
            }.toast(isShowing: $errorPopup,textContent: toastMsg)
                .sheet(isPresented: $openPlacePicker) {
                PlacePicker(address: $searchAddress)
            }
           
        }
    }

}

//
//struct AddressView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressView()
//    }
//}






struct GoogleMapsView: UIViewRepresentable {
    // 1
  //  @ObservedObject var locationManager : LocationManager
    @State var location: CLLocationCoordinate2D?
    private let zoom: Float = 14.0
    let marker : GMSMarker = GMSMarker()
    @Binding var address : GMSAddress?
    @State var gestureEnable : Bool = true
    @State var lat : Double = 15.824867
    @State var long : Double = 78.021093
   // let cities : [TrackDataModelElement]

//       ]
    // 2
    func makeUIView(context: Self.Context) -> GMSMapView {
//        if lat == 15.824867{
//            lat = location?.latitude ?? lat
//            long = location?.longitude ?? long
//        }
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(location?.latitude ?? 13.06) , longitude: CLLocationDegrees(location?.longitude ?? 80.16), zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
      
//        let tap = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.doubleTapped))
//        tap.numberOfTapsRequired = 2
//        mapView.addGestureRecognizer(tap)
        return mapView
    }
    
    // 3
    func updateUIView(_ mapView: GMSMapView, context: Context) {
//        if lat == 15.824867{
//            lat = location?.latitude ?? lat
//            long = location?.longitude ?? long
//        }
             mapView.clear()
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(location?.latitude ?? 13.06), longitude: CLLocationDegrees(location?.longitude ?? 80.16))
                marker.title = "Your order will be deliverd here"
              //  marker.icon = UIImage(named: "scheduleImage")
              //  marker.setIconSize(scaledToSize: .init(width: 40, height: 40))
                 //  marker.icon = UIImage(named: "run")
      //  mapView.settings.setAllGesturesEnabled(gestureEnable == true ? false : true)
                marker.snippet = "Move pin your exact location"
                marker.map = mapView
        mapView.selectedMarker = marker
    }
    
    func customLabel(text : String) -> UILabel{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 60))
            label.textAlignment = .center
            label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.text = text
            return label
    }
    func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }

     class Coordinator: NSObject , GMSMapViewDelegate{
         var parent: GoogleMapsView

         init(_ parent: GoogleMapsView) {
             self.parent = parent
         }

         @objc func doubleTapped() {
             print("Double Tapped...")
         }
         func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
            // marker.position =  CLLocationCoordinate2D(latitude: CLLocationDegrees(location?.coordinate.latitude ?? 0.0), longitude: CLLocationDegrees(location?.coordinate.longitude ?? 0.0))
             parent.location = position.target
             getAddressFromLatLong(position.target)
          
         }
         func getAddressFromLatLong(_ locat: CLLocationCoordinate2D)
         {
             let reverseGeoCoder = GMSGeocoder()
             //  let coordinate = manager.location?.coordinate
             reverseGeoCoder.reverseGeocodeCoordinate(locat, completionHandler: {(placeMark, error) -> Void in
                 if error == nil {
                     if let placeMarkObject = placeMark
                     {
                         //  print(placeMarkObject.results()!)
                         let addressCount = placeMarkObject.results()?.count
                         if addressCount != 0
                         {
                          //   print(self.strAddrLine)
                           //  print(placeMarkObject.firstResult()?.thoroughfare ?? "")
                             self.parent.address = placeMarkObject.firstResult() ?? GMSAddress()
                             
                       }
                     }
                     else
                     {
                         //Do Nothing
                     }
                 } else {
                     print(error?.localizedDescription)
                 }
             })
         }
//         func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//             print(position)
//         }
     }
    
}


struct GoogleMapsEditView: UIViewRepresentable {
    // 1
  //  @ObservedObject var locationManager : LocationManager
    @State var location: CLLocationCoordinate2D?
    private let zoom: Float = 14.0
    let marker : GMSMarker = GMSMarker()
    @Binding var address : GMSAddress?
    @State var gestureEnable : Bool = true
    @State var lat : Double = 15.824867
    @State var long : Double = 78.021093
   // let cities : [TrackDataModelElement]

//       ]
    // 2
    func makeUIView(context: Self.Context) -> GMSMapView {
//        if lat == 15.824867{
//            lat = location?.latitude ?? lat
//            long = location?.longitude ?? long
//        }
        let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(lat) , longitude: CLLocationDegrees(long), zoom: zoom)
      //  let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(location?.latitude ?? 13.06) , longitude: CLLocationDegrees(location?.longitude ?? 80.16), zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
      
//        let tap = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.doubleTapped))
//        tap.numberOfTapsRequired = 2
//        mapView.addGestureRecognizer(tap)
        return mapView
    }
    
    // 3
    func updateUIView(_ mapView: GMSMapView, context: Context) {
//        if lat == 15.824867{
//            lat = location?.latitude ?? lat
//            long = location?.longitude ?? long
//        }
             mapView.clear()
       // marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(location?.latitude ?? 13.06), longitude: CLLocationDegrees(location?.longitude ?? 80.16))
        marker.position = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
                marker.title = "Your order will be deliverd here"
              //  marker.icon = UIImage(named: "scheduleImage")
              //  marker.setIconSize(scaledToSize: .init(width: 40, height: 40))
                 //  marker.icon = UIImage(named: "run")
      //  mapView.settings.setAllGesturesEnabled(gestureEnable == true ? false : true)
                marker.snippet = "Move pin your exact location"
                marker.map = mapView
        mapView.selectedMarker = marker
    }
    
    func customLabel(text : String) -> UILabel{
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 60))
            label.textAlignment = .center
            label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.text = text
            return label
    }
    func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }

     class Coordinator: NSObject , GMSMapViewDelegate{
         var parent: GoogleMapsEditView

         init(_ parent: GoogleMapsEditView) {
             self.parent = parent
         }

         @objc func doubleTapped() {
             print("Double Tapped...")
         }
         func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
            // marker.position =  CLLocationCoordinate2D(latitude: CLLocationDegrees(location?.coordinate.latitude ?? 0.0), longitude: CLLocationDegrees(location?.coordinate.longitude ?? 0.0))
           //  parent.location = position.target
             parent.lat = position.target.latitude
             parent.long = position.target.longitude
             getAddressFromLatLong(position.target)
          
         }
         func getAddressFromLatLong(_ locat: CLLocationCoordinate2D)
         {
             let reverseGeoCoder = GMSGeocoder()
             //  let coordinate = manager.location?.coordinate
             reverseGeoCoder.reverseGeocodeCoordinate(locat, completionHandler: {(placeMark, error) -> Void in
                 if error == nil {
                     if let placeMarkObject = placeMark
                     {
                         //  print(placeMarkObject.results()!)
                         let addressCount = placeMarkObject.results()?.count
                         if addressCount != 0
                         {
                          //   print(self.strAddrLine)
                           //  print(placeMarkObject.firstResult()?.thoroughfare ?? "")
                             self.parent.address = placeMarkObject.firstResult() ?? GMSAddress()
                             
                       }
                     }
                     else
                     {
                         //Do Nothing
                     }
                 } else {
                     print(error?.localizedDescription)
                 }
             })
         }
//         func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//             print(position)
//         }
     }
    
}


extension GMSMarker {
    func setIconSize(scaledToSize newSize: CGSize) {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        icon?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        icon = newImage
    }
}


class LocationManager: NSObject, ObservableObject , CLLocationManagerDelegate {

    
    private let locationManager = CLLocationManager()

    // 1
     @Published var location: CLLocation? //{
//       willSet { objectWillChange.send() }
//     }
    @Published var locationCoordinate: CLLocationCoordinate2D?
    @Published var address : GMSAddress?
    // 2
    var latitude: CLLocationDegrees {
         return location?.coordinate.latitude ?? 0
     }
     
     var longitude: CLLocationDegrees {
         return location?.coordinate.longitude ?? 0
     }
    
    // 3
    override init() {
      super.init()

      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
      locationManager.requestWhenInUseAuthorization()
      locationManager.requestAlwaysAuthorization()
      locationManager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       
     //   print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        self.locationCoordinate = location.coordinate
        getAddressFromLatLong(location.coordinate)
        locationManager.stopUpdatingLocation()
    }
    func getAddressFromLatLong(_ locat: CLLocationCoordinate2D)
    {
        let reverseGeoCoder = GMSGeocoder()
        //  let coordinate = manager.location?.coordinate
        reverseGeoCoder.reverseGeocodeCoordinate(locat, completionHandler: {(placeMark, error) -> Void in
            if error == nil {
                if let placeMarkObject = placeMark
                {
                    //  print(placeMarkObject.results()!)
                    let addressCount = placeMarkObject.results()?.count
                    if addressCount != 0
                    {
                     //   print(self.strAddrLine)
                       
                        self.address = placeMarkObject.firstResult()
                        
                  }
                }
                else
                {
                    //Do Nothing
                }
            } else {
                print(error?.localizedDescription)
            }
        })
    }

}



class MapViewController: UIViewController , GMSMapViewDelegate  , GMSAutocompleteViewControllerDelegate {
    @EnvironmentObject var locationManager : LocationManager
  let map =  GMSMapView(frame: .zero)
  var isAnimating: Bool = false

  override func loadView() {
    super.loadView()
    self.view = map
      
  }
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition)
    {
        let latitude = mapView.camera.target.latitude
        let longitude = mapView.camera.target.longitude
   
        let centerMapCoordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
       
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        //        let latitude = mapView.camera.target.latitude
        //        let longitude = mapView.camera.target.longitude
        //        print(latitude)
        //        print(longitude)
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
      //  dismiss(animated: true, completion: nil)
        guard let placeID = place.placeID else {
                return
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
        {
            print((place.coordinate.latitude) , (place.coordinate.latitude))
            let camera = GMSCameraPosition.camera(withLatitude: (place.coordinate.latitude), longitude: (place.coordinate.longitude), zoom: 15.5)
            self.locationManager.locationCoordinate = place.coordinate
            Common.sharedInstance.getAutoCompleteAddress(placeId: placeID) {  [self] (status, name, address, city, pincode) in
                if status {
                   dismiss(animated: true, completion: nil)
                 // self.searchAddressTextField.text = address
    //                locationTextField.text = address
    //                cityTextField.text = city
    //                pincodeTextField.text = pincode
//                    let marker = GMSMarker()
//                    marker.position =  cord2D
//                     marker.title = ""
//                    marker.snippet = name
//                    marker.map = self.mapView
//                    self.mapView.camera = GMSCameraPosition.camera(withTarget: cord2D, zoom: 15)
                }else {
                    
                }
            }
           // self.viewGoogleMap?.animate(to: camera)
        }
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        
    }
  
}





struct PlacePicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> GooglePlacesCoordinator {
        GooglePlacesCoordinator(self)
    }
    @Environment(\.presentationMode) var presentationMode
    @Binding var address: CLLocationCoordinate2D
   // @EnvironmentObject var locationManager : LocationManager
    func makeUIViewController(context: UIViewControllerRepresentableContext<PlacePicker>) -> GMSAutocompleteViewController {

        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = context.coordinator
        

        let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                  UInt(GMSPlaceField.placeID.rawValue) |
                                                  UInt(GMSPlaceField.coordinate.rawValue))!
        autocompleteController.placeFields = fields

        let filter = GMSAutocompleteFilter()
        filter.type = .address
        autocompleteController.autocompleteFilter = filter
        return autocompleteController
    }

    func updateUIViewController(_ uiViewController: GMSAutocompleteViewController, context: UIViewControllerRepresentableContext<PlacePicker>) {
    }

    class GooglePlacesCoordinator: NSObject , GMSAutocompleteViewControllerDelegate {

        var parent: PlacePicker

        init(_ parent: PlacePicker) {
            self.parent = parent
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
            DispatchQueue.main.async {
                print(place.description.description as Any)
              //  self.parent.address =  place.name!
                self.parent.address = place.coordinate
                self.parent.presentationMode.wrappedValue.dismiss()
//                print("latitude: \(place.coordinate.latitude)")
//                print("longitude: \(place.coordinate.longitude)")
            }
        }

        func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
            print("Error: ", error.localizedDescription)
        }

        func wasCancelled(_ viewController: GMSAutocompleteViewController) {
            parent.presentationMode.wrappedValue.dismiss()
        }

    }
}

struct MapViewControllerBridge: UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> MapViewController {
    // Replace this line
    return UIViewController() as! MapViewController
  }

  func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
  }
    
}




struct AddAddressTextView : View{
   
   // var tittleText : String
    @Binding var textFieldText : String
    var placholderName : String
    var body: some View{
        VStack{
            HStack{
                
                VStack(alignment : .leading , spacing : 10){
                    TextField(placholderName, text: $textFieldText)
                        .disableAutocorrection(true).padding(10).disabled(false) .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color.gray, lineWidth: 1))
                }

            }
          //  Divider().frame( height: 2).foregroundColor(.gray)
        }.padding(EdgeInsets(top: 5, leading: 10, bottom: 1, trailing: 10))
    }
}
