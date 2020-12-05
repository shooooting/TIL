//
//  ViewController.swift
//  FirebaseChat
//
//  Created by ㅇ오ㅇ on 2020/12/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .purple
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavi()
        setUI()
        setConstraint()
        
        
    }
    
    private func setUI() {
        [tableView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setConstraint() {
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setTableView() {
        
    }
    
    private func setNavi() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.pencil"),
            style: .plain,
            target: self,
            action: #selector(didTapNavigationRightButton))
        
    }
    
    // MARK: - Button Action
    @objc
    private func didTapNavigationRightButton() {
        
    }
    
    
}

