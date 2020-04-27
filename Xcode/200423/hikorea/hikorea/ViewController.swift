//
//  ViewController.swift
//  hikorea
//
//  Created by ㅇ오ㅇ on 2020/04/23.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    var sumButton =  UIButton()
    var subButton = UIButton()
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        label.backgroundColor = .red
        label.text = "0"
        label.center = view.center
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        view.addSubview(label)
        
        sumButton.frame = CGRect(x: 0, y: 355, width: 100, height: 100)
        sumButton.backgroundColor = .blue
        sumButton.setTitle("더하기", for: .normal)
        sumButton.addTarget(self, action: #selector(sumButton1), for: .touchUpInside)
        view.addSubview(sumButton)
        
        subButton.frame = CGRect(x: 280, y: 355, width: 100, height: 100)
        subButton.backgroundColor = .red
        subButton.setTitle("빼기", for: .normal)
        subButton.addTarget(self, action: #selector(subButton1), for: .touchUpInside)
        view.addSubview(subButton)
    }
    
    @objc func sumButton1(sender: UIButton) {
        index += 1
        label.text = "\(index)"
        label.backgroundColor = .blue
    }
    
    @objc func subButton1(sender: UIButton) {
        index -= 1
        label.text = "\(index)"
        label.backgroundColor = .red
    }
    

    
    
    
    
    
    


}

