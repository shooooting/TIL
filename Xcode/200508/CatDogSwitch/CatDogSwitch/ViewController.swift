//
//  ViewController.swift
//  CatDogSwitch
//
//  Created by ㅇ오ㅇ on 2020/05/08.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var onOffSwitch: UISwitch!
    var image: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "Dog.jpg")
        
    }
    
    @IBAction func changeSwitch(_ sender: UISwitch){
        
        if onOffSwitch.isOn {
            imageView.image = UIImage(named: "Dog.jpg")
        } else {
            imageView.image = UIImage(named: "Cat.jpg")
        }
    }
    
    
    @IBAction func SaveButton(_ sender: Any) {
        UserDefaults.standard.set(onOffSwitch.isOn, forKey: "dog")
        
        
    }
    @IBAction func ResetButton(_ sender: Any) {
        let dog = UserDefaults.standard.bool(forKey: "dog")
        onOffSwitch.isOn = dog
        
        if onOffSwitch.isOn {
            imageView.image = UIImage(named: "Dog.jpg")
        } else {
            imageView.image = UIImage(named: "Cat.jpg")
        }
        
    }
    

}

