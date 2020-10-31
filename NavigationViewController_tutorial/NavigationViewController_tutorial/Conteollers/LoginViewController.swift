//
//  ViewController.swift
//  NavigationViewController_tutorial
//
//  Created by ㅇ오ㅇ on 2020/10/30.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
        
        login.addTarget(self, action: #selector(moveToMainViewController), for: .touchUpInside)
    }
    
    @objc
    fileprivate func moveToMainViewController() {
        let mainViewController = MainViewController()

        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
}

