//
//  LTKApp.swift
//  LTK
//
//  Created by Nathan Lambson on 4/17/22.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let networkData = LTKNetworkData.shared()
        networkData.fetchLTKs()
        return true
    }
}

@main
struct LTKApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            LTKFeedView()
        }
    }
}
