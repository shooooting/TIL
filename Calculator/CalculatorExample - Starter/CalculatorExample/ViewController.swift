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

        numberLabel.adjustsFontSizeToFitWidth = true

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
    
    var sum: Double = 0
    var num: Double = 0
    var first: Double = 0
    var equalNumber: Double = 0        // 2 + = 4 이거 해결
    var operationNumber: Double = 0         // 12 + 3 - 이거 해결 위해서
    var arith = ""                  // 음수를 만들려고 만든 변수
    var numbering: Double = 0
    
    //    MARK:-Button Click
    
    @IBAction func click(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        let inValue = numberLabel.text
        operationNumber = num
        if inValue!.count > 12 {
            let textCurrentlyInDisplay = numberLabel.text!
            numberLabel.text = textCurrentlyInDisplay
        } else {
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
                    num = Double(numberLabel.text!)!
                    if isPlus == true {
                        if first != 0 {
                            //                        print(digit)
                            first = first + Double(digit)!
                            numberLabel.text = digit
                            //                        print(first)
                        } else {
                            //                        print(digit)
                            //                        print(num)
                            first = num + Double(digit)!
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
                            first = first - Double(digit)!
                            numberLabel.text = digit
                            //                        print(first)
                        } else {
                            first = num - Double(digit)!
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
                            first = first * Double(digit)!
                            numberLabel.text = digit
                            print("__________")
                            print(first)
                            print(digit)
                            //                        print(first)
                        } else {
                            first = num * Double(digit)!
                            numberLabel.text = digit
                            print("__________")
                            print(first)
                        }
                        //                    isMulti = false
                        print("곱")
                    }
                    if isDivi == true {
                        if first != 0 {
                            first = first / Double(digit)!
                            numberLabel.text = digit
                            //                        print(first)
                        } else {
                            first = num / Double(digit)!
                            numberLabel.text = digit
                            //                        print(first)
                        }
                        //                    isDivi = false
                        print("sum",sum)
                        print("num",num)
                        print("나누")
                    }
                    
                } else {
                    if arith == "-" {
                        numberLabel.text = arith + digit
                    } else {
                        numberLabel.text = digit
                    }
                }
            }
        }
        if inValue!.count == 13, userIsInTheMiddleOfTyping == false {
            numberLabel.text = digit
        }
        arith = ""
//        print("operationNumber", operationNumber)
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
        num = Double()
        sum = Double()
        first = 0
        equalNumber = 0
    }
    //    MARK:-OPERATION
    @IBAction func operation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping == false, sender.currentTitle == "-" {
            arith = String(sender.currentTitle!)
            numberLabel.text = arith
        }
        if userIsInTheMiddleOfTyping == true, isEqual == true, arith != "-" {
            if let labelNumber = numberLabel.text {
                if sender.currentTitle == "+", isPlus == false {
                    num = Double(labelNumber)!
                    sum = num
                    isPlus = true; isDivi = false; isMulti = false; isMinus = false
                } else if sender.currentTitle == "-", isMinus == false {
                    num = Double(labelNumber)!
                    sum = num
                    isMinus = true; isDivi = false; isPlus = false; isMulti = false
                    print("_")
                } else if sender.currentTitle == "×", isMulti == false {
                    num = Double(labelNumber)!
                    sum = num
                    isMulti = true; isDivi = false; isMinus = false; isPlus = false
                } else if sender.currentTitle == "÷", isDivi == false {
                    if numberLabel.text == "0" {
                        return
                    } else {
                        num = Double(labelNumber)!
                        sum = num
                        isDivi = true
                    }
                    isPlus = false; isMulti = false; isMinus = false
                }
                isEqualxEqual = true
            }
            numberLabel.text = String(sum)
        } else if userIsInTheMiddleOfTyping == true, isEqual == false, arith != "-" {
            print("여기얏")
            if sender.currentTitle == "+", isPlus == false {
                num = Double(numberLabel.text!)!
                sum = num
                isPlus = true; isDivi = false; isMulti = false; isMinus = false
            } else if sender.currentTitle == "-", isMinus == false {
                num = Double(numberLabel.text!)!
                sum = num
                isMinus = true; isDivi = false; isPlus = false; isMulti = false
                print("___")
            } else if sender.currentTitle == "×", isMulti == false {
                num = Double(numberLabel.text!)!
                sum = num
                isMulti = true; isDivi = false; isMinus = false; isPlus = false
            } else if sender.currentTitle == "÷", isDivi == false {
                if numberLabel.text == "0" {
                    return
                } else {
                    num = Double(numberLabel.text!)!
                    sum = num
                    isDivi = true
                }
                isPlus = false; isMulti = false; isMinus = false
            }
        }
        print("sum",sum)
        print("num",num)
        print("equalNumber", equalNumber)
        print("first", first)
        if operationNumber != 0 {
            equalNumber = first
            numberLabel.text = String(equalNumber)
            print("이곳")
        } else {
            numberLabel.text = String(sum)
        }
        print("equalNumber", equalNumber)
        print("arith", arith)
        print("sum",sum)
        userIsInTheMiddleOfTyping = false
    }
    //    MARK:-EQUAL
    @IBAction func equal(_ sender: Any) {
        if isPlus {
            if first != 0, isEqualxEqual != true {
                equalNumber = first
                numberLabel.text = String(equalNumber)
                isPlus = false
            } else if isEqualxEqual == true {
                equalNumber = sum + num
                numberLabel.text = String(equalNumber)
                isPlus = false
            } else {
                //                print(sum)
                sum = Double(numberLabel.text!)!
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
                sum = Double(numberLabel.text!)!
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
                sum = Double(numberLabel.text!)!
                print(sum)
                print(num)
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
                sum = Double(numberLabel.text!)!
                print(sum)
                equalNumber = num * sum
                numberLabel.text = String(equalNumber)
                print(equalNumber)
                isDivi = false
            }
        }
        equalNumber = Double(numberLabel.text!)!
        numberLabel.text = String(equalNumber)
        sum = 0
        first = 0
        num = 0
        equalNumber = 0
        userIsInTheMiddleOfTyping = false
        isEqual = true
    }
    
}

//extension String {
//    var inComma {
//
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal    // 천 단위로 콤마(,)
//        formatter.minimumFractionDigits = 0    // 최소 소수점 단위
//        formatter.maximumFractionDigits = 3    // 최대 소수점 단위
////        let numString = formatter.string(from:  as NSNumber)
////        print(numString)
//    }
//
//}
