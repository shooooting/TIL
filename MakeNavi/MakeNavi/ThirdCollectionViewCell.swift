//
//  ThirdCollectionViewCell.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/03.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
  
  static let identifier = "ThirdCollectionViewCell"
  
  let button = UIButton()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setConstraint()
  }
  
  private func setUI() {
    contentView.addSubview(button)
    button.setTitleColor(UIColor.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    button.setTitleColor(.black, for: .normal)
  }
  
  private func setConstraint() {
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      button.widthAnchor.constraint(equalToConstant: 60)
    ])
  }
  
  func configure(title: String) {
    button.setTitle(title, for: .normal)
  }
}
