//
//  ThirdViewController.swift
//  ViewControllerChange
//
//  Created by ㅇ오ㅇ on 2020/04/27.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let button = UIButton(type: .system)
        button.setTitle("go first", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let backToSecond = UIButton(type: .system)
        backToSecond.setTitle("go Second", for: .normal)
        backToSecond.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        backToSecond.sizeToFit()
        backToSecond.center = CGPoint(x: 190, y: 450)
        backToSecond.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
        view.addSubview(backToSecond)
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    @objc private func didTapButton2 (_ sender: UIButton) {
        _ = SecondViewController()
        dismiss(animated: true)
    }

}
