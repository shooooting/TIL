//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var keyPad: UIView!
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var multi: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var same: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberLabel.text = "0"
       
        
        [number0, number1, number2, number3, number4, number5, number6, number7, number8, number9].forEach { $0.layer.cornerRadius = 41 }
        [plus, minus, multi, division, same, resetButton].forEach { $0?.layer.cornerRadius = 41 }
        
    }
    
    var userIsInTheMiddleOfTyping: Bool = false
    
    var isPlus = false
    var isMinus = false
    var isMulti = false
    var isDivi = false
    
    var sum = Int()
    var num = Int()
    
    @IBAction func click(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if(userIsInTheMiddleOfTyping){
            let textCurrentlyInDisplay = numberLabel.text!
            numberLabel.text = textCurrentlyInDisplay + digit
            print(userIsInTheMiddleOfTyping)
        }else{
            numberLabel.text = digit
            print(userIsInTheMiddleOfTyping)
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func AC(_ sender: UIButton) {
        
        userIsInTheMiddleOfTyping = false
        numberLabel.text = "0"
        sum = 0
        num = 0
    }
    
    @IBAction func operation(_ sender: UIButton) {
        
        if sender.currentTitle == "+", isPlus == false {
            num = Int(numberLabel.text!)!
            print(num)
            sum = num
            print(sum)
            isPlus = true
        } else if sender.currentTitle == "-", isMinus == false {
            num = Int(numberLabel.text!)!
            sum = num
            isMinus = true
        } else if sender.currentTitle == "×", isMulti == false {
            num = Int(numberLabel.text!)!
            sum = num
//            sum = sum * num
            isMulti = true
        } else if sender.currentTitle == "÷", isDivi == false {
            if numberLabel.text == "0" {
             return
            } else {
            num = Int(numberLabel.text!)!
            sum = num
            isDivi = true
            }
        }
        numberLabel.text = String(sum)
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func equal(_ sender: Any) {
        if isPlus {
            sum = sum + Int(numberLabel.text!)!
            isPlus = false
        }
        if isMinus {
            sum = sum - Int(numberLabel.text!)!
            isMinus = false
        }
        if isMulti {
            sum = sum * Int(numberLabel.text!)!
            isMulti = false
        }
        if isDivi {
            sum = sum / Int(numberLabel.text!)!
            isDivi = false
        }
        numberLabel.text = String(sum)
        sum = 0
        userIsInTheMiddleOfTyping = false
    }
    
    
}
