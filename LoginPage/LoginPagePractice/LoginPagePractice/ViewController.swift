//
//  ViewController.swift
//  LoginPageExample
//
//  Created by ㅇ오ㅇ on 2020/05/14.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

protocol nextPageDelivery: class {
    func goData(data: String)
}
class ViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: nextPageDelivery!
    //
    func textField(for text: UITextField, frame: CGRect, placeholder: String, secure: Bool) {
        text.frame = frame
        text.placeholder = placeholder
        text.isSecureTextEntry = secure
        text.borderStyle = .none
        let line = CALayer()
        line.frame = CGRect(x: 0, y: text.frame.height - 1, width: text.frame.width, height: 1)
        line.backgroundColor = UIColor.black.cgColor
        text.layer.addSublayer(line)
        text.addTarget(self, action: #selector(endOnExit(_:)), for: .editingDidEndOnExit)
        text.addTarget(self, action: #selector(begin(_:)), for: .editingDidBegin)
        view.addSubview(text)
    }
    
    func buttonNextGo(for button: UIButton, title: String, frame: CGRect) {
        button.frame = frame
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        //        button.center = view.center
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(goNextPage(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    func inToLabel(for label: UILabel, title: String, frame: CGRect) {
        label.frame = frame
        label.backgroundColor = .red
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        view.addSubview(label)
    }
    
    let imageView = UIImageView()
    
    let number1 = UILabel()
    let number2 = UILabel()
    let number3 = UILabel()
    
    let text1 = UITextField()
    let text2 = UITextField()
    
    let button = UIButton()
    
    var imageView1 = UIImageView()
    var imageView2 = UIImageView()
    
    let id = "1"
    let pw = "1"

    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        text1.delegate = self
        text2.delegate = self
        
        imageView1 = UIImageView(frame: CGRect(x: 30, y: 552, width: 20, height: 20))
        let image1 = UIImage(named: "user.png")
        imageView1.image = image1
        view.addSubview(imageView1)
        
        imageView2 = UIImageView(frame: CGRect(x: 30, y: 602, width: 20, height: 20))
        let image2 = UIImage(named: "password.png")
        imageView2.image = image2
        view.addSubview(imageView2)
        
        UI()
        
        let inTheBool = UserDefaults.standard.bool(forKey: "a")
        if inTheBool {
            
        }
    }
    
    func UI() {
        let text1Frame = CGRect(x: 60, y: 550, width: 300, height: 30)
        let placeholder1 = "이메일을 입력하세요."
        textField(for: text1, frame: text1Frame, placeholder: placeholder1, secure: false)
        
        let text2Frame = CGRect(x: 60, y: 600, width: 300, height: 30)
        let placeholder2 = "비밀번호를 입력하세요."
        textField(for: text2, frame: text2Frame, placeholder: placeholder2, secure: true)
        
        let buttonFrame = CGRect(x: 30, y: 650, width: 330, height: 40)
        buttonNextGo(for: button, title: "Sign In", frame: buttonFrame)
        
        let number1Frame = CGRect(x: 122, y: 192, width: 30, height: 30)
        inToLabel(for: number1, title: "", frame: number1Frame)
        
        let number2Frame = CGRect(x: 172, y: 192, width: 30, height: 30)
        inToLabel(for: number2, title: "", frame: number2Frame)
        
        let number3Frame = CGRect(x: 222, y: 192, width: 30, height: 30)
        inToLabel(for: number3, title: "", frame: number3Frame)
        
        imageView.image = UIImage(named: "fastcampus_logo.png")
        imageView.frame = CGRect(x: 50, y: 100, width: view.frame.maxX - 100, height: 50)
        view.addSubview(imageView)
        
    }
    
    @objc func goNextPage(_ sender: UIButton) {
        let secondvc = SecondViewController()
        secondvc.modalPresentationStyle = .automatic
        if let email = text1.text {
            if email == id {
                if let password = text2.text {
                    if password == pw {
                        if let data = text1.text {
                            UserDefaults.standard.set(true, forKey: "a")
                            
                            print(UserDefaults.standard.bool(forKey: "a"))
                            present(secondvc, animated: true, completion: {self.delegate.goData(data: data)}) }
                    }
                }
            } else {
                UITextField.animate(withDuration: 0.8) {
                    self.text1.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                    self.text2.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                }
                UITextField.animate(withDuration: 0.8) {
                    self.text1.backgroundColor = UIColor.clear.withAlphaComponent(0)
                    self.text2.backgroundColor = UIColor.red.withAlphaComponent(0)
                }
            }
        }
    }
    
    @objc func endOnExit(_ sender: NSNotification) {
        UIView .animate(withDuration: 0.2, animations: { () -> Void in
            self.text1.frame.origin.y += 220
            self.text2.frame.origin.y += 220
            self.imageView1.frame.origin.y += 220
            self.imageView2.frame.origin.y += 220
            self.button.frame.origin.y += 220
        })
    }
    @objc func begin(_ notification: NSNotification){
        //        text1.isHidden = true
        //        text2.isHidden = true
        UIView .animate(withDuration: 0.2, animations: { () -> Void in
            if self.text1.frame.origin.y == 550 {
                self.text1.frame.origin.y -= 220
                self.text2.frame.origin.y -= 220
                self.imageView1.frame.origin.y -= 220
                self.imageView2.frame.origin.y -= 220
                self.button.frame.origin.y -= 220
            } else { return }
        })
    }

    
    
}






