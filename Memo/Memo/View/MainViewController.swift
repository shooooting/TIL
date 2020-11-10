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
        
        cell.textLabel?.textColor = UIColor(named: "myColor")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.memo = DataManager.shared.memoList[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true // 편집 기능 활성화
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete // 편집 기능 스타일 설정 삭제로 선택
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let target = DataManager.shared.memoList[indexPath.row] // 삭제할 메모를 저장
            DataManager.shared.deleteMemo(target) // 딜리트메모를 호출하고 전달
            DataManager.shared.memoList.remove(at: indexPath.row)
            
            tableV.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
}

