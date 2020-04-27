//
//  ViewController.swift
//  HelloWorld
//
//  Created by ㅇ오ㅇ on 2020/04/23.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //label 하나 button 하나 만들고 UI
    // count를 하나 만들어서 버튼을 누를때마다 숫자가 올라가도록 구현
    
    var label = UILabel()
    var sumButton = UIButton(type: .system)
    var a: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.text = "0"
        label.center = view.center
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        view.addSubview(label)
        
        sumButton.frame = CGRect(x: 0, y: 550, width: 400, height: 100)
        sumButton.backgroundColor = .yellow
        sumButton.setTitle("더하자", for: .normal)
//        sumButton.center =
        sumButton.addTarget(self, action: #selector(sumButton1), for: .touchUpInside)
        view.addSubview(sumButton)
        }
    
    @objc func sumButton1(sender: UIButton) {
        a += 1
        
        label.text = "\(a)"
        label.backgroundColor = .yellow
    }
    
    @IBOutlet weak var number: UILabel!
    
    @IBAction func plus(_ sender: UILabel) {
        a += 1
        number.text = "\(a)"
        }
    
    @IBAction func reset(_ sender: UILabel) {
        a = 0
        number.text = "\(a)"
        number.backgroundColor = .white
    }

    @IBAction func sum(_ sender: UILabel) {
        a += 1
        number.backgroundColor = .blue
        number.text = "\(a)"
    }
    
    @IBAction func sub(_ sender: UILabel) {
        a -= 1
        number.backgroundColor = .red
        number.text = "\(a)"
    }
    
}

