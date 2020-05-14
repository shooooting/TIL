
//
//  SecondViewController.swift
//  LoginPageExample
//
//  Created by ㅇ오ㅇ on 2020/05/14.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, nextPageDelivery {
    func goData(data: String) {
        label.text = data
    }
    
    func inToLabel(for label: UILabel, title: String, frame: CGRect) {
        label.frame = frame
        label.backgroundColor = .red
        label.textAlignment = .center
        label.textColor = .white
        label.text = "label"
//        label.center = view.center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        view.addSubview(label)
    }
    
    func buttonNextGo(for button: UIButton, title: String, frame: CGRect) {
        button.frame = frame
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(firstPageGo(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    var label = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let viewController = presentingViewController as? ViewController
        viewController?.delegate = self
        
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
//          let sceneDelegate = windowScene.delegate as? SceneDelegate
//          sceneDelegate?.window?.rootViewController = SecondViewController()
//        }
        
        
        UI()
        
        
    }
    
    func UI() {
        let labelFrame = CGRect(x: 80, y: 30, width: view.frame.maxX - 160, height: 200)
        inToLabel(for: label, title: "", frame: labelFrame)
        
        let buttonFrame = CGRect(x: 20, y: 300, width: view.frame.maxX - 40, height: 50)
        buttonNextGo(for: button, title: "Log Out", frame: buttonFrame)
    }
    
    @objc func firstPageGo(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "a")
        
        print(UserDefaults.standard.bool(forKey: "a"))
        
        dismiss(animated: true)
    }
}
