//
//  SecondViewController.swift
//  ViewControllerChange
//
//  Created by ㅇ오ㅇ on 2020/04/27.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        let button = UIButton(type: .system)
        button.setTitle("go Third", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let buttonBack1 = UIButton(type: .system)
        buttonBack1.setTitle("go first", for: .normal)
        buttonBack1.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        buttonBack1.sizeToFit()
        buttonBack1.center = CGPoint(x: 190, y: 450)
        buttonBack1.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
        view.addSubview(buttonBack1)
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let thirdVC = ThirdViewController()
        present(thirdVC, animated: true)
    }
    
    @objc private func didTapButton2(_ sender: UIButton) {
        _ = ViewController()
        dismiss(animated: true)
    }

}
