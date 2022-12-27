//
//  OnboardingView.swift
//  Ironbox User
//
//  Created by MAC on 05/11/22.
//

import SwiftUI



struct OnboardingView: View {
    @State private var onboardinDone = false
    @State var moveLoginPage : Bool = false
    @ObservedObject var viewModel = LoginViewModel()
    
   @State var data = [OnboardingDataModel]()
    var body: some View {
        Group {
                SlidingView(data: data, doneFunction: {
                    /// Update your state here
                    self.onboardinDone = true
                    moveLoginPage = true
                })
          
        }.navigationBarBackButtonHidden(true).navigationBarHidden(true)
            .background(
                NavigationLink(destination: LoginView(), isActive: $moveLoginPage){
                    
                }
                    .hidden()
            )
            .onAppear(){
                viewModel.splashImageGetApi(type: "1") { result, response, error in
                    if result{
                        data = [
                            OnboardingDataModel(image: (imageUrl + (response?.image1 ?? "") ), heading: response?.title1 ?? "", text: response?.des1 ?? ""),
                            OnboardingDataModel(image: (imageUrl + (response?.image2 ?? "") ), heading: response?.title2 ?? "", text: response?.des2 ?? ""),
                            OnboardingDataModel(image: (imageUrl + (response?.image3 ?? "") ), heading: response?.title2 ?? "", text: response?.des3 ?? "")
                               ]
                    }else{
                        
                    }
                }
            }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
