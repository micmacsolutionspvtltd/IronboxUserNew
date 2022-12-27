//
//  Ironbox_UserApp.swift
//  Ironbox User
//
//  Created by MAC on 05/11/22.
//

import SwiftUI
import GoogleMaps
import GooglePlaces
import UIKit

@main
struct Ironbox_UserApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LaunchScreenView().environmentObject(LocationManager()).environmentObject(HomeViewModel())
        }
    }
}

class AppDelegate : NSObject , UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // Override point for customization after application launch.
      GMSServices.provideAPIKey("AIzaSyDwHUKGXjsCNn-Oepw6L5t6Mn2HS7ucV3M")
        GMSPlacesClient.provideAPIKey("AIzaSyDwHUKGXjsCNn-Oepw6L5t6Mn2HS7ucV3M")
       // GMSServices.setMetalRendererEnabled(true)
      return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
      // Called when a new scene session is being created.
      // Use this method to select a configuration to create the new scene with.
      return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      // Called when the user discards a scene session.
      // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
      // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}


