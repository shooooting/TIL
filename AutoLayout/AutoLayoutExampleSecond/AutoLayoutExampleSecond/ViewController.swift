//
//  ViewController.swift
//  AutoLayoutExampleSecond
//
//  Created by ㅇ오ㅇ on 2020/05/18.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testView: UIView!
    
    @IBOutlet var testViewCenterYConstraint: NSLayoutConstraint!
    
//    let someView = UIView()
//    var topConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonDidTab(_ sender: Any) {
        UIView.animate(withDuration: 2) {
            print(self.testViewCenterYConstraint.isActive)
            self.testViewCenterYConstraint.isActive.toggle()
            self.view.layoutIfNeeded()
        }
//        UIView.animate(withDuration: 2) {
//            self.testViewCenterYConstraint.
//        }
    }
    


}

