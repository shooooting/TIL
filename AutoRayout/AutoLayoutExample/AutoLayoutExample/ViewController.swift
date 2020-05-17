//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by ㅇ오ㅇ on 2020/05/15.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func inToView(for view1: UIView, frame: CGRect) {
        view1.frame = frame
        view1.backgroundColor = .red
        view.addSubview(view1)
    }
    
    func inTheView(for view2: UIView, frame: CGRect) {
        view2.frame = frame
        view2.backgroundColor = .yellow
        view.addSubview(view2)
    }
    
    let box1 = UIView()
    let box2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.frame.width)
        print(view.frame.height)
        print(view.frame.maxX)
        print(view.frame.maxY)
        print(view.frame.minX)
        print(view.frame.minY)
        
    }
    
    override func viewWillLayoutSubviews() { // 레이아웃을 사용할때
        super.viewWillLayoutSubviews()
//        print(view.)
        
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInsets = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.frame.width - padding - horizontalInsets) / 2 - margin
        
        let box1Frame = CGRect(x: safeLayoutInsets.left + margin, y: yOffset, width: viewWidth, height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin))
        inToView(for: box1, frame: box1Frame)
        
        let box2Frame = CGRect(x: box1.frame.maxX + padding, y: yOffset, width: viewWidth, height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin))
        inTheView(for: box2, frame: box2Frame)
        
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        print(view.safeAreaInsets.top)
        print(view.safeAreaInsets.bottom)
        print(view.frame.height - view.frame.width)
        print(view.safeAreaInsets.left)
        print(view.safeAreaInsets.right)

    }

}

