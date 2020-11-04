//
//  DetailViewController.swift
//  Memo
//
//  Created by ㅇ오ㅇ on 2020/11/03.
//

import UIKit

class DetailViewController: UIViewController {

    private let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "ko_kr")
        return f
    }()
    
    private let tableV = UITableView()
    private let toolBar = UIToolbar()
    
    var memo: Memo? // 이전 화면에서 전달한 메모가 저장
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setConstraint()
    }
    
    fileprivate func setUI() {
        [tableV, toolBar].forEach {
            view.addSubview($0)
        }
        
        navigationItem.title = ""
        navigationItem.largeTitleDisplayMode = .never
        
        let toolBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(tappedToolBarBtn))
        
        toolBar.setItems([toolBtn], animated: true)
        
        tableV.delegate = self
        tableV.dataSource = self
        tableV.separatorStyle = .none
        
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "memoCell")
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "dateCell")
        
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChange, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.tableV.reloadData()
        })
    }
    
    @objc
    func tappedToolBarBtn() {
//        let compose = UINavigationController(rootViewController: ComposeViewController())
        let compose = ComposeViewController()
        compose.editTarget = memo
        present(UINavigationController(rootViewController:compose), animated: true)
    }
    
    fileprivate func setConstraint() {
        tableV.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        toolBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "memoCell")
            cell.textLabel?.text = memo?.content
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.lineBreakMode = .byWordWrapping // 한글에서 제대로 동작하지 않을 때가 있다.
            cell.selectionStyle = .none
            
            return cell
        case 1:
            var cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "dateCell")

            cell.textLabel?.textColor = .gray
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError()
        }
        
        
    }
}
