//
//  AppDelegate.swift
//  ForeksTrader
//
//  Created by Berkay on 14.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        window?.makeKeyAndVisible()
        app.router.window = window
        app.router.startApplication()
        return true
    }
}
