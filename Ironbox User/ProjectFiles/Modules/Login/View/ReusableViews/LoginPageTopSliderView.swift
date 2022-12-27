//
//  LoginPageTopSliderView.swift
//  Ironbox User
//
//  Created by MAC on 11/11/22.
//

import Foundation
import SwiftUI


struct LoginTopSliderView: View {
    var data: [OnboardingDataModel]
    
    
    @State var slideGesture: CGSize = CGSize.zero
    @State var curSlideIndex = 0
    var distance: CGFloat = UIScreen.main.bounds.size.width
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    

    func autoSlide() {
        if self.curSlideIndex == self.data.count - 1 {
            withAnimation {
                self.curSlideIndex = -1
            }
        }
        
        if self.curSlideIndex < self.data.count - 1 {
            withAnimation {
                self.curSlideIndex += 1
            }
        }
    }

    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            if data.count != 0{
            VStack{
            ZStack(alignment: .center) {
                ForEach(0..<data.count) { i in
                    LoginSliderDesign(data: self.data[i])
                        .offset(x: CGFloat(i) * self.distance)
                        .offset(x: self.slideGesture.width - CGFloat(self.curSlideIndex) * self.distance)
                        .animation(.spring())
                        .gesture(DragGesture().onChanged{ value in
                            self.slideGesture = value.translation
                        }
                        .onEnded{ value in
                            if self.slideGesture.width < -50 {
                                if self.curSlideIndex < self.data.count - 1 {
                                    withAnimation {
                                        self.curSlideIndex += 1
                                    }
                                }
                            }
                            if self.slideGesture.width > 50 {
                                if self.curSlideIndex > 0 {
                                    withAnimation {
                                        self.curSlideIndex -= 1
                                    }
                                }
                            }
                            self.slideGesture = .zero
                        })
                }
            }.frame( height: 250).padding(.top , -50)
            
            
            VStack {
              //  self.progressView().padding(EdgeInsets(top: 20, leading: 1, bottom: 10, trailing: 1))
               Spacer()

            }
        }
            .padding(20)
        }
        }.onReceive(timer) { _ in
            autoSlide()
        }
    }

    
    func progressView() -> some View {
        HStack {
            ForEach(0..<data.count) { i in
                Circle()
                    .scaledToFit()
                    .frame(width: 10)
                    .foregroundColor(self.curSlideIndex == i ? Color(UIColor.hexStr(hexStr: "3498DB", alpha: 1)) : Color(.systemGray))
            }
        }
    }
}

struct LoginSliderDesign: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
            LoginBannerImage(withURL: data.image)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
                .padding(.bottom, -20)
            
            Text(data.heading)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold).foregroundColor(Constants.CustomColors.colorAppBlue)
                
            

        }
        .padding()
        .contentShape(Rectangle())
    }
}





struct LoginBannerImage : View{
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
  //  @State var cornerRadiuss : CGFloat? = 0

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)//.padding(.bottom,-40)
              //  .cornerRadius(cornerRadiuss ?? 0)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
                    
               
                    
        }
    }
}
