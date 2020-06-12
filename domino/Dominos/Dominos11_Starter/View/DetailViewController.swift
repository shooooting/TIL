//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var productName = ""
    
    private let shared = Singleton.shared
    private var selectCount: Int = 0 {
        didSet {
            displayLabel.text = "\(selectCount) 개"
        }
    }
    
    private let imageView = UIImageView()
    private let tempView = UIView()
    private let minusButton = UIButton()
    private let displayLabel = UILabel()
    private let plusButton = UIButton()
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    title = productName
    
    imageView.image = UIImage(named: productName)
  }

    
}
