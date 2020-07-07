//
//  LaunchViewController.swift
//  MapDori
//
//  Created by ㅇ오ㅇ on 2020/07/01.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {
  
  let aniView: AnimationView = {
    let ani = AnimationView(name: "18123-developer")
    ani.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    ani.contentMode = .scaleAspectFill
    return ani
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    aniView.center = view.center
    view.backgroundColor = .systemBackground
    view.addSubview(aniView)
    
    aniView.play { (finish) in
      self.dismiss(animated: true)
    }
  }

  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
