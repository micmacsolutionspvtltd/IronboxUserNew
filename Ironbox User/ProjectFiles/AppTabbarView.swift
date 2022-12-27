//
//  AppTabbarView.swift
//  Ironbox User
//
//  Created by MAC on 21/11/22.
//

import SwiftUI

struct AppTabbarView: View {
    @State private var selection : String = ""
    var body: some View {
        TabView(selection : $selection){
            HomeView().navigationBarHidden(true).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea([.top])
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            GetAddressView().navigationBarHidden(true).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea([.top])
                .tabItem{
                    Image(systemName: "globe").resizable()
                    Text("Tracking")
                }
            SubscriptionView().navigationBarHidden(true).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea([.top])
                .tabItem{
                    Image(systemName: "crown.fill").foregroundColor(.yellow)
                    Text("Subscription")
                }
            MyAccountView().navigationBarHidden(true).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea([.top])
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Account")
                }
            MoreView().navigationBarHidden(true).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea([.top])
                .tabItem{
                    Image(systemName: "square.grid.2x2.fill")
                    Text("More")
                }
        }
    }
}

struct AppTabbarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabbarView()
    }
}


enum Screen{
    case one
    case two
}

final class TabBarRouter : ObservableObject{
    @Published var screen : Screen = .one
    func change (to screen : Screen){
        self.screen = screen
    }
}
