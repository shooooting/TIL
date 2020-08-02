//
//  ViewController.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/02.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let upV: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBackground
    return view
  }()
  
  let upViewTitle = UILabel()
  
  lazy var scrollView = UIScrollView()
  let controller: [UIViewController] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setUI()
    setConstraint()
  }
  
  func setUI() {
    [upV, upViewTitle, scrollView].forEach { view.addSubview($0) }
    
    upViewTitle.text = "PlayL:)st"
    upViewTitle.font = UIFont.boldSystemFont(ofSize: 35)
    
  }
  
  func setConstraint() {
    upV.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height / 6))
    
    let space: CGFloat = 16
    
    [upViewTitle, scrollView].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      upViewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
      upViewTitle.bottomAnchor.constraint(equalTo: upV.bottomAnchor, constant: -(space)),
      
      scrollView.topAnchor.constraint(equalTo: upV.bottomAnchor, constant: space),
      scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
      scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
      scrollView.heightAnchor.constraint(equalToConstant: view.frame.height / 4)
      
    ])
  }
  
  
}

