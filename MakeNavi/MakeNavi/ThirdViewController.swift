//
//  ThirdViewController.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/03.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  private let layout = UICollectionViewFlowLayout()
  lazy var topButtoncollectionV = UICollectionView(
    frame: .zero, collectionViewLayout: layout
  )
  
  private let titles = ["전체", "영웅", "공포", "눈물", "하하"]
  private let ring = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
//    setButtonViewButton()
  }
  
  private func setUI() {
    setLayout()
    [topButtoncollectionV, ring].forEach { view.addSubview($0) }
//    buttonV.backgroundColor = .red
    topButtoncollectionV.backgroundColor = .systemBackground
    topButtoncollectionV.dataSource = self
    topButtoncollectionV.delegate = self
    topButtoncollectionV.register(ThirdCollectionViewCell.self, forCellWithReuseIdentifier: ThirdCollectionViewCell.identifier)
    
    
  }
  
  private func setLayout() {
    let width = view.frame.width / 5
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.itemSize = CGSize(width: width, height: width)
    layout.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 4)
  }
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    [topButtoncollectionV].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    NSLayoutConstraint.activate([
      topButtoncollectionV.topAnchor.constraint(equalTo: guide.topAnchor),
      topButtoncollectionV.heightAnchor.constraint(equalToConstant: 50)
    ])
    
//    setButtonViewButton()
  }
  
//  private func setButtonViewButton() {
//    let titles = ["전체", "영웅", "공포", "사랑", "눈물"]
//    var interval: CGFloat = 0
//    let top: CGFloat = 5
//    for i in titles.indices {
//      let button = UIButton()
//      button.tag = i
//      let name = titles[i]
//      button.setTitle(name, for: .normal)
//      button.contentMode = .scaleToFill
//      button.setTitleColor(UIColor.black, for: .normal)
//      button.clipsToBounds = true
//      view.addSubview(button)
//      print(button)
////      button.translatesAutoresizingMaskIntoConstraints = false
////      if i == 0 {
////        NSLayoutConstraint.activate([
////          button.topAnchor.constraint(equalTo: buttonV.topAnchor, constant: top),
////          button.leadingAnchor.constraint(equalTo: buttonV.leadingAnchor, constant: interval),
////          button.widthAnchor.constraint(equalToConstant: 75),
////          button.heightAnchor.constraint(equalToConstant: 42)
////        ])
////      }
////      else {
////        interval += 75
////        NSLayoutConstraint.activate([
////          button.topAnchor.constraint(equalTo: buttonV.topAnchor, constant: top),
////          button.leadingAnchor.constraint(equalTo: buttonV.leadingAnchor, constant: interval),
////          button.widthAnchor.constraint(equalToConstant: 75),
////          button.heightAnchor.constraint(equalToConstant: 42)
////        ])
////      }
//
//      if button.tag == 0 {
//        button.addTarget(self, action: #selector(click), for: .touchUpInside)
//      }
//
//    }
//
//  }
  
  @objc func click() {
    print("a")
  }
}

extension ThirdViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return titles.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.identifier, for: indexPath) as! ThirdCollectionViewCell
    cell.configure(title: titles[indexPath.item])
//    if indexPath.item == 0 {
//      cell.button.layer.borderWidth = 2
//    }
    return cell
  }
  
  
}

extension ThirdViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    <#code#>
  }
}
