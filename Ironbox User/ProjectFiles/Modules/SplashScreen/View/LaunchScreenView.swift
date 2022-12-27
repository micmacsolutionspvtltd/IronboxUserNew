//
//  LaunchScreenView.swift
//  Ironbox User
//
//  Created by MAC on 08/11/22.
//

import SwiftUI

struct LaunchScreenView : View{
    @State var moveMainPage : Bool = false
    @State var redirectHomePage : Bool = false
    var body : some View{
        NavigationView{
        ZStack{
           GifImage("SplashScreen")
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
                if !StorageSettings().userId.isEmpty{
                    redirectHomePage = true
                }else{
                    moveMainPage = true
                }
               
            }
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        .background(
            NavigationLink(destination: OnboardingView(), isActive: $moveMainPage){
                
            }
                .hidden()
        )
        .background(
            NavigationLink(destination: AppTabbarView(), isActive: $redirectHomePage){
                
            }
                .hidden()
        )
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}


struct RedView: View {
    var body: some View {
        Color.red
    }
}
struct BlueView: View {
    var body: some View {
        Color.blue
    }
}



