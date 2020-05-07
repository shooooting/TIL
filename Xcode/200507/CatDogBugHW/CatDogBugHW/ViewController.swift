//
//  ViewController.swift
//  CatDogBugHW
//
//  Created by ㅇ오ㅇ on 2020/05/07.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dogCount = 0 {
        didSet {
            numberLabel.text = String(dogCount)
        }
    }
    var catCount = 0 {
        didSet {
            numberLabel.text = String(catCount)
        }
    }
    var bugCount = 0 {
        didSet {
            numberLabel.text = String(bugCount)
        }
    }
    
    @IBOutlet weak var numberLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination as? SecondViewController else { return }
        
        switch segue.identifier {
        case "Dog":
            secondVC.image = UIImage(named: "Dog.jpg")!
            dogCount += 1
//            numberLabel.text = "\(dogCount)"
        case "Cat":
            secondVC.image = UIImage(named: "Cat.jpg")!
            catCount += 1
//            numberLabel.text = "\(catCount)"
        case "Bug":
            secondVC.image = UIImage(named: "Bug.jpg")!
            bugCount += 1
//            numberLabel.text = "\(bugCount)"
        default:
            print("")
        }
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        switch identifier {
        case "Dog":
            if dogCount > 7 {
                return false
            }
        case "Cat":
            if catCount > 9 {
                return false
            }
        case "Bug":
            if bugCount > 14 {
                return false
            }
        default:
            return true
        }
        return true
    }
    
    @IBAction func unwindViewController(_ unwindSegue: UIStoryboardSegue) {
        
    }


}

