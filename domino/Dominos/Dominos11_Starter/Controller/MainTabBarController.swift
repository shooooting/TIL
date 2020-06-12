//
//  MainTabBarController.swift
//  Dominos11_Starter
//
//  Created by ㅇ오ㅇ on 2020/06/11.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let categoryVC = UINavigationController(rootViewController: CategoryViewController())
        categoryVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(named: "domino's"), tag: 0)
        
        let wishlistVC = UINavigationController(rootViewController: WishListViewController())
        wishlistVC.tabBarItem = UITabBarItem(title: "WishList", image: UIImage(named: "wishlist"), tag: 0)
        
        viewControllers = [categoryVC, wishlistVC]
    }
}
