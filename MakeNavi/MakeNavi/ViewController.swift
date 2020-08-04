//
//  ViewController.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/02.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let upV: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBackground
    return view
  }()
  private let upViewTitle = UILabel()
  
  private let inCollectionView = UIView()
  private let collectionV: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  var isOneStepPaging = true
  var currentIndex: CGFloat = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
  
  private struct Standard {
    static let space: CGFloat = 8
    static let inset: UIEdgeInsets = .init(top: 16, left: 16, bottom: 16, right: 16)
  }
  
  private func setUI() {
    [upV, upViewTitle, inCollectionView].forEach { view.addSubview($0) }
    
    upViewTitle.text = "PlayL:)st"
    upViewTitle.font = UIFont.boldSystemFont(ofSize: 35)
    
    inCollectionView.backgroundColor = .purple
    
    inCollectionView.addSubview(collectionV)
    
    collectionV.backgroundColor = .white
//    collectionV.isPagingEnabled = true
    collectionV.dataSource = self
    collectionV.delegate = self
    collectionV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    collectionV.decelerationRate = UIScrollView.DecelerationRate.fast
  }
  
  private func setConstraint() {
    upV.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height / 6))
    
    let space: CGFloat = 16
    let guide = view.safeAreaLayoutGuide
    
    [upViewTitle, inCollectionView, collectionV].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      upViewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
      upViewTitle.bottomAnchor.constraint(equalTo: upV.bottomAnchor, constant: -(space)),
      
      inCollectionView.topAnchor.constraint(equalTo: upV.bottomAnchor),
      inCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      inCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      inCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      
      collectionV.topAnchor.constraint(equalTo: inCollectionView.topAnchor),
      collectionV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionV.bottomAnchor.constraint(equalTo: inCollectionView.bottomAnchor)
    ])
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    5
  }
  
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//      return 4
//    }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .purple
    
    return cell
  }
}


extension ViewController: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
//    let layout = self.collectionV.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthIncludingSpacing = view.frame.width - Standard.inset.left - Standard.inset.right + Standard.space
    // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
    // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
    var offset = targetContentOffset.pointee
    let index = offset.x / cellWidthIncludingSpacing
    var roundedIndex = round(index)
    
    // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
    // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
    // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
    if scrollView.contentOffset.x > targetContentOffset.pointee.x {
        roundedIndex = floor(index)
    } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
        roundedIndex = ceil(index)
    } else {
        roundedIndex = round(index)
    }
    
    if isOneStepPaging {
        if currentIndex > roundedIndex {
            currentIndex -= 1
            roundedIndex = currentIndex
        } else if currentIndex < roundedIndex {
            currentIndex += 1
            roundedIndex = currentIndex
        }
    }
    
    // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing, y: -scrollView.contentInset.top)
    print(offset)
    targetContentOffset.pointee = offset
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.space
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right
    let height = collectionView.frame.height - Standard.inset.top - Standard.inset.bottom
    //    let size = collectionView.frame.size
    //    let inset = Standard.inset
    //    let width = size.width - inset.left - inset.right - Standard.space
    //    let height = size.height - inset.top - inset.bottom
    return CGSize(width: width, height: height)
  }
}

