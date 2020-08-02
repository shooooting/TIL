//
//  ViewController.swift
//  MyTextField
//
//  Created by ㅇ오ㅇ on 2020/08/03.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let searchField = UITextField()
  private let border = CALayer()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    setUI()
    setConstraint()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    searchField.borderStyle = .none
    border.frame = CGRect(x: 0, y: searchField.frame.size.height-1, width: searchField.frame.width, height: 2)
    border.backgroundColor = UIColor.black.cgColor
    searchField.textColor = UIColor.black
    searchField.placeholder = "밑줄"
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    searchField.resignFirstResponder()
  }
  
  func setUI() {
    view.addSubview(searchField)
    
    searchField.layer.addSublayer(border)
//    searchField.backgroundColor = .purple
    searchField.delegate = self
  }
  
  func setConstraint() {
    searchField.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      searchField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      searchField.heightAnchor.constraint(equalToConstant: 50),
      searchField.widthAnchor.constraint(equalToConstant: view.frame.width - 32)
    ])
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchField.resignFirstResponder()
    return true
  }
}

