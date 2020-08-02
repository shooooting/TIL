//
//  SceneDelegate.swift
//  MyTextField
//
//  Created by ㅇ오ㅇ on 2020/08/03.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    window = UIWindow(windowScene: windowScene)
    
    window?.rootViewController = ViewController()
    window?.makeKeyAndVisible()
  }
}

