//
//  SecondViewController.swift
//  CatDogBugHW
//
//  Created by ㅇ오ㅇ on 2020/05/07.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var image: UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
    
    @IBAction func plusOneController(_ sender: Any) {
        let firstViewController = presentingViewController as? ViewController
        
//        var count: Int = firstViewController!.bugCount
//        
//        count += 1
        
            firstViewController?.dogCount += 1
            firstViewController?.bugCount += 1
            firstViewController?.catCount += 1
        
//            firstViewController?.numberLabel.text = String(count)
    }
    
    


}
