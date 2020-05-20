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
    var isEqual = false
    var isEqualxEqual = false
    
    var sum = Int()
    var num = Int()
    var first: Int = 0
    var equalNumber: Int = 0
    
//    MARK:-Button Click
    
    @IBAction func click(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        let inValue = numberLabel.text
        
        if isEqual == true {
            numberLabel.text = digit
        }
        if(userIsInTheMiddleOfTyping){
            let textCurrentlyInDisplay = numberLabel.text!
            numberLabel.text = textCurrentlyInDisplay + digit
//            print(userIsInTheMiddleOfTyping)
        }else{
            
            if inValue != "0" {
//                print(userIsInTheMiddleOfTyping)
                num = Int(numberLabel.text!)!
                if isPlus == true {
                    if first != 0 {
//                        print(digit)
                        first = first + Int(digit)!
                        numberLabel.text = digit
//                        print(first)
                    } else {
//                        print(digit)
//                        print(num)
                        first = num + Int(digit)!
                        numberLabel.text = digit
                        print("여기")
                    }
//                    isPlus = false
                    print("+")
                    print("sum",sum)
                    print("num",num)
                }
                if isMinus == true {
                    if first != 0 {
                        first = first - Int(digit)!
                        numberLabel.text = digit
//                        print(first)
                    } else {
                        first = num - Int(digit)!
                        numberLabel.text = digit
//                        print(first)
                    }
//                    isMinus = false
                    print("-")
                }
                if isMulti == true {
//                    print(first)
                    if first != 0 {
                        print("__________")
                        print(first)
                        print(digit)
                        first = first * Int(digit)!
                        numberLabel.text = digit
                        print("__________")
                        print(first)
                        print(digit)
//                        print(first)
                    } else {
                        first = num * Int(digit)!
                        numberLabel.text = digit
                        print("__________")
                        print(first)
                    }
//                    isMulti = false
                    print("곱")
                }
                if isDivi == true {
                    if first != 0 {
                        first = first / Int(digit)!
                        numberLabel.text = digit
//                        print(first)
                    } else {
                        first = num / Int(digit)!
                        numberLabel.text = digit
//                        print(first)
                    }
//                    isDivi = false
                    print("sum",sum)
                    print("num",num)
                    print("나누")
                }
                
            } else {
                numberLabel.text = digit
//                print(userIsInTheMiddleOfTyping)
            }
        }
        userIsInTheMiddleOfTyping = true
        isEqual = false
    }
//    MARK:-AC
    @IBAction func AC(_ sender: UIButton) {
        
        userIsInTheMiddleOfTyping = false
        
        isEqualxEqual = false
        isEqual = false
        
        isMulti = false
        isDivi = false
        isMinus = false
        isPlus = false
        
        numberLabel.text = "0"
        num = Int()
        sum = Int()
        first = 0
        equalNumber = 0
    }
//    MARK:-OPERATION
    @IBAction func operation(_ sender: UIButton) {
        if isEqual == false, isDivi == true || isMinus == true || isPlus == true || isMulti == true {
            print("얏호")
        }
        
        if isEqual == true {
            if let labelNumber = numberLabel.text {
                if sender.currentTitle == "+", isPlus == false {
                    num = Int(labelNumber)!
                    sum = num
                    isPlus = true; isDivi = false; isMulti = false; isMinus = false
                } else if sender.currentTitle == "-", isMinus == false {
                    num = Int(labelNumber)!
                    sum = num
                    isMinus = true; isDivi = false; isPlus = false; isMulti = false
                } else if sender.currentTitle == "×", isMulti == false {
                    num = Int(labelNumber)!
                    sum = num
                    isMulti = true; isDivi = false; isMinus = false; isPlus = false
                    print("_______________")
                } else if sender.currentTitle == "÷", isDivi == false {
                    if numberLabel.text == "0" {
                     return
                    } else {
                    num = Int(labelNumber)!
                    sum = num
                    isDivi = true
                    }
                    isPlus = false; isMulti = false; isMinus = false
                }
                isEqualxEqual = true
            }
        } else {
            if sender.currentTitle == "+", isPlus == false {
                num = Int(numberLabel.text!)!
                sum = num
                isPlus = true; isDivi = false; isMulti = false; isMinus = false
            } else if sender.currentTitle == "-", isMinus == false {
                num = Int(numberLabel.text!)!
                sum = num
                isMinus = true; isDivi = false; isPlus = false; isMulti = false
            } else if sender.currentTitle == "×", isMulti == false {
                num = Int(numberLabel.text!)!
                sum = num
                isMulti = true; isDivi = false; isMinus = false; isPlus = false
                print("_______________")
            } else if sender.currentTitle == "÷", isDivi == false {
                if numberLabel.text == "0" {
                 return
                } else {
                num = Int(numberLabel.text!)!
                sum = num
                isDivi = true
                }
                isPlus = false; isMulti = false; isMinus = false
            } else {
                
            }
        }
        numberLabel.text = String(sum)
        userIsInTheMiddleOfTyping = false
    }
//    MARK:-EQUAL
    @IBAction func equal(_ sender: Any) {
        if isPlus {
            if first != 0, isEqualxEqual != true {
                equalNumber = first
                numberLabel.text = String(equalNumber)
                isPlus = false
                print("이곳")
            } else if isEqualxEqual == true {
                equalNumber = sum + num
                numberLabel.text = String(equalNumber)
                isPlus = false
            } else {
//                print(sum)
                sum = Int(numberLabel.text!)!
//                print(sum)
                equalNumber = num + sum
                numberLabel.text = String(equalNumber)
//                print(equalNumber)
                isPlus = false
            }
        }
//        if isPlus == false {
//            numberLabel.text = String(first)
//            isPlus = false
//        }
        if isMinus {
            if first != 0, isEqualxEqual != true {
                equalNumber = first
                numberLabel.text = String(equalNumber)
                isMinus = false
            } else if isEqualxEqual == true {
                equalNumber = sum - num
                numberLabel.text = String(equalNumber)
                isMinus = false
            } else {
                print(sum)
                sum = Int(numberLabel.text!)!
                print(sum)
                equalNumber = num - sum
                numberLabel.text = String(equalNumber)
                print(equalNumber)
                isMinus = false
            }
        }
        if isMulti {
            if first != 0, isEqualxEqual != true {
                equalNumber = first
                numberLabel.text = String(equalNumber)
                isMulti = false
            } else if isEqualxEqual == true {
                equalNumber = sum * num
                numberLabel.text = String(equalNumber)
                isMulti = false
            } else {
                print(sum)
                sum = Int(numberLabel.text!)!
                print(sum)
                equalNumber = num * sum
                numberLabel.text = String(equalNumber)
                print(equalNumber)
                isMulti = false
            }
//            sum = sum * Int(numberLabel.text!)!
//            numberLabel.text = String(first)
//            isMulti = false
        }
        if isDivi {
            if first != 0, isEqualxEqual != true {
                equalNumber = first
                numberLabel.text = String(equalNumber)
                isDivi = false
            } else if isEqualxEqual == true {
                print("sum",sum)
                print("num",num)
                equalNumber = sum / num
                numberLabel.text = String(equalNumber)
                isDivi = false
            } else {
                print(sum)
                sum = Int(numberLabel.text!)!
                print(sum)
                equalNumber = num * sum
                numberLabel.text = String(equalNumber)
                print(equalNumber)
                isDivi = false
            }
        }
        equalNumber = Int(numberLabel.text!)!
        numberLabel.text = String(equalNumber)
        sum = 0
        first = 0
        num = 0
        equalNumber = 0
        userIsInTheMiddleOfTyping = false
        isEqual = true
    }
    
    
}
