//
//  SceneDelegate.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/02.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let first = ViewController()
    let second = SecondViewController()
    let third = ThirdViewController()
    let tabBar = UITabBarController()
    
    first.tabBarItem = UITabBarItem(title: "L:)st", image: UIImage(systemName: "film"), tag: 0)
    second.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), tag: 1)
    third.tabBarItem = UITabBarItem(title: "P:)ck", image: UIImage(systemName: "list.number"), tag: 2)
    
    UITabBar.appearance().backgroundColor = UIColor.white
    UITabBar.appearance().tintColor = .black
    tabBar.viewControllers = [first, second, third]
    
    window = UIWindow(windowScene: windowScene)
    window?.backgroundColor = .systemBackground
    window?.rootViewController = tabBar
    window?.makeKeyAndVisible()
  }

}

