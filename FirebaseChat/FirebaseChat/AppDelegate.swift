//
//  AppDelegate.swift
//  FirebaseChat
//
//  Created by ㅇ오ㅇ on 2020/12/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let main = UINavigationController(rootViewController: ViewController())
        main.navigationBar.barTintColor = .green
        window?.rootViewController = main
        window?.makeKeyAndVisible()
        return true
    }
    
}

