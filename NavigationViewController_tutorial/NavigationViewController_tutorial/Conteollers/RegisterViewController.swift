//
//  RegisterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by ㅇ오ㅇ on 2020/10/30.
//

import UIKit

class ResisterViewController: UIViewController {
    
    @IBOutlet weak var buttonForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func LoginViewController(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
