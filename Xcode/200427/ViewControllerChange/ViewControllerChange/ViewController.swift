//
//  ViewController.swift
//  ViewControllerChange
//
//  Created by ㅇ오ㅇ on 2020/04/27.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        button.setTitle("go Second", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func didTapButton(_ sender: UIButton) {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }

}

