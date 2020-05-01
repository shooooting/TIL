//
//  ViewController.swift
//  FirstText
//
//  Created by ㅇ오ㅇ on 2020/05/01.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label1 = UILabel()
    let label2 = UILabel()
    
    let labelmoney1 = UILabel()
    let labelmoney2 = UILabel()
    
    var inMoney: Int = 70000
    var money = 0
    
    let resetButton = UIButton()
    let creditButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.frame = CGRect(x: 20, y: 350, width: 80, height: 40)
        label1.backgroundColor = .green
        label1.textColor = .black
        label1.text = "소지금"
        label1.textAlignment = .center
        view.addSubview(label1)
        
        label2.frame = CGRect(x: 20, y: 410, width: 80, height: 40)
        label2.backgroundColor = .orange
        label2.textColor = .black
        label2.text = "결제금액"
        label2.textAlignment = .center
        view.addSubview(label2)
        
        labelmoney1.frame = CGRect(x: 110, y: 350, width: 140, height: 40)
        labelmoney1.backgroundColor = .green
        labelmoney1.textColor = .black
        labelmoney1.text = "\(String(inMoney))원"
        labelmoney1.textAlignment = .right
        view.addSubview(labelmoney1)
        
        labelmoney2.frame = CGRect(x: 110, y: 410, width: 140, height: 40)
        labelmoney2.backgroundColor = .orange
        labelmoney2.textColor = .black
        labelmoney2.text = "\(String(money))원"
        labelmoney2.textAlignment = .right
        view.addSubview(labelmoney2)
        
        resetButton.frame = CGRect(x: 270, y: 350, width: 80, height: 40)
        resetButton.backgroundColor = .black
        resetButton.setTitle("초기화", for: .normal)
        resetButton.addTarget(self, action: #selector(resetInMoney(_:)), for: .touchUpInside)
        view.addSubview(resetButton)
        
        creditButton.frame = CGRect(x: 270, y: 410, width: 80, height: 40)
        creditButton.backgroundColor = .black
        creditButton.setTitle("결제", for: .normal)
        creditButton.addTarget(self, action: #selector(cardSlash(_:)), for: .touchUpInside)
        view.addSubview(creditButton)
    }
    @IBOutlet weak var blackNoodle: UILabel!
    @IBOutlet weak var mixNoodle: UILabel!
    @IBOutlet weak var meetAndSauce: UILabel!
    
    var blackNoodleCount: Int = 0
    var mixNoodleCount: Int = 0
    var meetAndSauceCount: Int = 0

    @IBAction func order1(_ sender: Any) {
        self.money += 5000
        self.labelmoney2.text = "\(String(money))원"
        blackNoodleCount += 1
        blackNoodle.text = "\(blackNoodleCount)"
    }
    @IBAction func order2(_ sender: Any) {
        self.money += 6000
        self.labelmoney2.text = "\(String(money))원"
        mixNoodleCount += 1
        mixNoodle.text = "\(mixNoodleCount)"
    }
    @IBAction func order3(_ sender: Any) {
        self.money += 12000
        self.labelmoney2.text = "\(String(money))원"
        meetAndSauceCount += 1
        meetAndSauce.text = "\(meetAndSauceCount)"
        
    }
    
    @objc func resetInMoney(_ sender: UIButton) {
        self.inMoney = 70000
        self.money = 0
        self.labelmoney1.text = "\(String(inMoney))원"
        self.labelmoney2.text = "\(String(money))원"
        blackNoodleCount = 0
        mixNoodleCount = 0
        meetAndSauceCount = 0
        self.blackNoodle.text = String(blackNoodleCount)
        self.mixNoodle.text = String(mixNoodleCount)
        self.meetAndSauce.text = String(meetAndSauceCount)
    }
    
    @objc func cardSlash(_ sender: UIButton) {
        let alertController = UIAlertController(title: "결제하기", message: "총 결제 금액은 \(String(money))원 입니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default){_ in
            if self.money < self.inMoney {
            self.inMoney = self.inMoney - self.money
                self.money = 0
            self.labelmoney1.text = "\(String(self.inMoney))원"
                self.labelmoney2.text = "\(String(self.money))원"
                self.blackNoodleCount = 0
                self.mixNoodleCount = 0
                self.meetAndSauceCount = 0
                self.blackNoodle.text = String(self.blackNoodleCount)
                self.mixNoodle.text = String(self.mixNoodleCount)
                self.meetAndSauce.text = String(self.meetAndSauceCount)
            } else {
                
            }
            
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel){_ in
//
        }
        
        for action in [okAction, cancelAction] {
            alertController.addAction(action)
        }
        
        present(alertController, animated: true)
    }
    
}

