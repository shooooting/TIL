//
//  ViewController.swift
//  MapDori
//
//  Created by ㅇ오ㅇ on 2020/06/27.
//  Copyright © 2020 shooooting. All rights reserved.
//

import MapKit
import UIKit
import Lottie

class ViewController: UIViewController {

  private let map = MKMapView()
  
  let aniView: AnimationView = {
    let ani = AnimationView(name: "18123-developer")
    ani.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    ani.contentMode = .scaleAspectFill
    return ani
  }()
  
  private let upView: UIView = {
    let view = UIView()
    return view
  }()
  
  private let button1: UIButton = {
    let button = UIButton()
    button.backgroundColor = .black
    button.tintColor = .white
    button.setTitle("핀 추가", for: .normal)
    button.addTarget(self, action: #selector(addPin), for: .touchUpInside)
    button.layer.cornerRadius = 10
    return button
  }()
  private let button2: UIButton = {
    let button = UIButton()
    button.backgroundColor = .black
    button.tintColor = .white
    button.setTitle("핀 제거", for: .normal)
    button.layer.cornerRadius = 10
    return button
  }()
  private let button3: UIButton = {
    let button = UIButton()
    button.backgroundColor = .black
    button.tintColor = .white
    button.setTitle("주소 찾기", for: .normal)
    button.layer.cornerRadius = 10
    return button
  }()

  
  override func viewDidLoad() {
    super.viewDidLoad()

    let vc = LaunchViewController()
    vc.modalPresentationStyle = .fullScreen
    present(vc, animated: false)
    
    navigationController?.setNavigationBarHidden(true, animated: true)

    setUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)

      
    }
  
  

  func setUI() {
    view.addSubview(map)
    view.addSubview(upView)
    upView.addSubview(button1)
    upView.addSubview(button2)
    upView.addSubview(button3)


    

    let height = view.frame.height / 14
    
    [map, upView, button1, button2, button3].forEach { $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate([
      
      upView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      upView.bottomAnchor.constraint(equalTo: map.topAnchor),
      upView.heightAnchor.constraint(equalToConstant: height),
      upView.widthAnchor.constraint(equalTo: view.widthAnchor),
      upView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      
      map.topAnchor.constraint(equalTo: upView.bottomAnchor),
      map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      button1.topAnchor.constraint(equalTo: upView.topAnchor, constant: 10),
      button1.leadingAnchor.constraint(equalTo: upView.leadingAnchor, constant: 10),
      button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
      button1.heightAnchor.constraint(equalTo: upView.heightAnchor, multiplier: 0.7),

      button2.topAnchor.constraint(equalTo: upView.topAnchor, constant: 10),
      button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 10),
      button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
      button2.heightAnchor.constraint(equalTo: upView.heightAnchor, multiplier: 0.7),

      button3.topAnchor.constraint(equalTo: upView.topAnchor, constant: 10),
      button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 10),
      button3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
      button3.heightAnchor.constraint(equalTo: upView.heightAnchor, multiplier: 0.7),
    ])
  }
  
  @objc func addPin(_ sender: UIButton) {
    let alert = UIAlertController(title: "내용을 입력하세요.", message: .none, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
      
    }
    alert.addTextField { (_) in
      
    }
    alert.addAction(okAction)
    self.present(alert, animated: true)
  }

}

