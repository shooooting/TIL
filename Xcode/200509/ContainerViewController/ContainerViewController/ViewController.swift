//
//  ViewController.swift
//  ContainerViewController
//
//  Created by ㅇ오ㅇ on 2020/05/09.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .never
        
        
        title = "FirstVC"
        navigationItem.title = "FirstVC2"
        
        let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))
        
        let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushViewController(_:)))
        
        navigationItem.leftBarButtonItems = [ barButtonItem, barButtonItem2, barButtonItem3 ]
        
    }
    
    @objc private func pushViewController(_ sender: Any){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
    }


}

