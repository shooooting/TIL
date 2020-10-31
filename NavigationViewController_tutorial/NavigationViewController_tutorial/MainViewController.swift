//
//  MainViewController.swift
//  NavigationViewController_tutorial
//
//  Created by ㅇ오ㅇ on 2020/10/31.
//

import UIKit

class MainViewController: UIViewController {

    // 제목
    var titleLabel: UILabel = {
       
        let label = UILabel()
        label.text = "메인화면"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        
        return label
        
    }()
    
    let changeBgBtn: UIButton = {
        let btn = UIButton(type: .system)
         btn.setTitle(" 배경색 바꾸기 ", for: .normal)
         btn.setTitleColor(.black, for: .normal)
         btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor.white
         btn.layer.cornerRadius = 3
        btn.contentEdgeInsets = UIEdgeInsets(top: 15,left: 10,bottom: 15,right: 10)
         btn.addTarget(self, action: #selector(changeBg), for: .touchUpInside)
               
        return btn
    }()
    
    var isBgOrange: Bool?
    
    //MARK:- override methods
    
    // 뷰가 생성되었을때
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isBgOrange = true
        
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeBgBtn)
        changeBgBtn.translatesAutoresizingMaskIntoConstraints = false
        changeBgBtn.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        changeBgBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    
    //MARK:- fileprivate methods
    
    @objc fileprivate func changeBg(){
        
        if isBgOrange == true {
            view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            isBgOrange = false
        } else {
            view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            isBgOrange = true
        }

    }
    
    
    
}
