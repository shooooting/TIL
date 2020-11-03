//
//  ViewController.swift
//  Memo
//
//  Created by ㅇ오ㅇ on 2020/11/01.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "ko_kr")
        return f
    }()
    private let tableV = UITableView()
    
    private var token: NSObjectProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // 뷰컨트롤러가 관리하는 뷰가 화면에 표시되기 직전에 호출이 된다.
        
        
        DataManager.shared.fetchMemo() // 배열이 데이터로 채워짐
        tableV.reloadData() // 배열 기반으로 테이블뷰 업데이트 
//        tableV.reloadData()
//        print(#function)
    }
    
    // MARK: - UI
    
    fileprivate func setUI() {
        [tableV].forEach {
            view.addSubview($0)
        }
        
        navigationItem.title = "Memo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setRightBarButton(
            UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(tappedBarRightButton)), animated: true)
        
        tableV.delegate = self
        tableV.dataSource = self
        
        tableV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableV.reloadData()
        }
        
    }
    
    fileprivate func setConstraints() {
        
        tableV.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc
    fileprivate func tappedBarRightButton() {
        let plus = UINavigationController(rootViewController: ComposeViewController())
//        plus.modalPresentationStyle = .fullScreen
        present(plus, animated: true)
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "cell")
        cell.accessoryType = .disclosureIndicator
        let target = DataManager.shared.memoList[indexPath.row]
        
        cell.focusStyle = .default
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(for: target.insertDate)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.memo = DataManager.shared.memoList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

