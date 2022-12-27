//
//  CommonExtension.swift
//  Ironbox User
//
//  Created by MAC on 09/11/22.
//

import Foundation
import UIKit
import SwiftUI
import WebKit
import Combine



extension View{
    func toast(isShowing : Binding<Bool?> , duration : TimeInterval = 2.0 , textContent : String = "Something Went Wrong" , backGroundColor : Color? = Color.black) -> some View{
        modifier(ToastModifier(isShowing: isShowing, textContentValue : textContent, backGroundColor: backGroundColor ?? Color.black, duration: duration))
    }
}

struct ToastModifier : ViewModifier{
    @Binding var isShowing : Bool?
    let textContentValue : String
    let backGroundColor : Color
    let duration : TimeInterval
    func body(content: Content) -> some View {
        ZStack{
            content
            if isShowing ?? false{
                VStack{
                    Spacer()
                    HStack{
                        Text(textContentValue)
                            .foregroundColor(.white)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(backGroundColor)
                    .cornerRadius(.infinity)
                    
                }.padding()
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                            withAnimation{
                                isShowing = false
                            }
                        }
                    }
            }
         
             
        }
    }
}

struct GifImage : UIViewRepresentable{
         let name : String
    
        init(_ name : String){
            self.name = name
        }
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
           let url = Bundle.main.url(forResource: name, withExtension: "gif")!
           let data = try! Data(contentsOf: url)
           webView.load(
               data ,
               mimeType: "image/gif" ,
               characterEncodingName: "UTF-8",
               baseURL: url.deletingLastPathComponent()
           )
           return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
    }
    

}
class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Data, Never>()
    var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

//@objc(NSAttributedStringTransformer)
//class NSAttributedStringTransformer: NSSecureUnarchiveFromDataTransformer {
//    override class var allowedTopLevelClasses: [AnyClass] {
//        return super.allowedTopLevelClasses + [NSAttributedString.self]
//    }
////}
//@objc(EmailTransformer)
//class EmailTransformer: ValueTransformer {
//    override class func transformedValueClass() -> AnyClass {
//        return NSData.self
//    }
//
//    override open func reverseTransformedValue(_ value: Any?) -> Any? {
//        guard let value = value as? Data else {
//            return nil
//        }
//        return NSKeyedUnarchiver.unarchiveObject(with: value)
//    }
//
//    override class func allowsReverseTransformation() -> Bool {
//        return true
//    }
//
//    override func transformedValue(_ value: Any?) -> Any? {
//        guard let value = value as? [Email] else {
//            return nil
//        }
//        return NSKeyedArchiver.archivedData(withRootObject: value)
//    }
//}
