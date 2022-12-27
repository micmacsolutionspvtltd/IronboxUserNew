//
//  SlidingView.swift
//  Ironbox User
//
//  Created by MAC on 05/11/22.
//

import SwiftUI
import WebKit


struct SlidingView: View {
    var data: [OnboardingDataModel]
    var doneFunction: () -> ()
    
    @State var slideGesture: CGSize = CGSize.zero
    @State var curSlideIndex = 0
    var distance: CGFloat = UIScreen.main.bounds.size.width
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    
    func nextButton() {
        if self.curSlideIndex == self.data.count - 1 {
            doneFunction()
            return
        }
        
        if self.curSlideIndex < self.data.count - 1 {
            withAnimation {
                self.curSlideIndex += 1
            }
        }
    }
    func autoSlide() {
        if self.curSlideIndex == self.data.count - 1 {
            withAnimation {
                doneFunction()
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
                HStack{
                    Spacer()
                    Spacer()
                    Button(action: doneFunction) {
               self.arrowView()
                  
                    }.padding(.trailing , -40)
                }
                Spacer()
            ZStack(alignment: .center) {
               
                    ForEach(0..<3) { i in
                        OnboardingStepView(data: self.data[i])
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
             //   }

            }
            
            
            VStack {
              //  Spacer()
                VStack {
                    self.progressView().padding(EdgeInsets(top: 20, leading: 1, bottom: 10, trailing: 1))
                   
//                    Button(action: nextButton) {
//                        self.arrowView()
//
//                    }
                }
            }
                Spacer()
        }.padding(20)
            }
            
        }.onReceive(timer) { _ in
            autoSlide()
        }
    }
    
    func arrowView() -> some View {
        Group {
           
                HStack {
                    Text("SKIP")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(Constants.CustomColors.colorAppBlue)
                }
                .frame(width: 120, height: 40)
           
      
        }
    }
    
    func progressView() -> some View {
        HStack {
            ForEach(0..<data.count) { i in
                Circle()
                    .scaledToFit()
                    .frame(width: 10)
                    .foregroundColor(self.curSlideIndex == i ? Constants.CustomColors.colorAppBlue : Color(.systemGray))
            }
        }
    }
}

//struct SlidingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlidingView()
//    }
//}

struct OnboardingStepView: View {
    var data: OnboardingDataModel
    
    var body: some View {
        VStack {
//            Image(data.image)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .padding(.bottom, 30)
            WelcomePageImage(withURL: data.image).frame(width: 200, height: 200)
            Text(data.heading)
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            Text(data.text)
                .font(.system(size: 17, design: .rounded))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
        }
        .padding()
        .contentShape(Rectangle())
    }
}


struct WelcomePageImage : View{
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
  //  @State var cornerRadiuss : CGFloat? = 0

    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View {
        
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.width/1.2).padding(.bottom, 30)
              //  .cornerRadius(cornerRadiuss ?? 0)
                .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
                    
               
                    
        }
    }
}

