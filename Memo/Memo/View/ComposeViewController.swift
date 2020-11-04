//
//  PlusMemoViewController.swift
//  Memo
//
//  Created by ㅇ오ㅇ on 2020/11/02.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?
    
    private let txtV = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraint()
    }
    
    fileprivate func setUI() {
        [txtV].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor =  .white
        
        navigationItem.title = "새 메모"
        navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tappedRightSaveButton)), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tappedLeftCancelButton)), animated: true)
        
        txtV.font?.withSize(14)
        
        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            txtV.text = memo.content
        } else {
            navigationItem.title = "새 메모"
            txtV.text = ""
        }
    }
    
    fileprivate func setConstraint() {
        txtV.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - BarButton
    
    @objc
    fileprivate func tappedRightSaveButton() {
        guard let memo = txtV.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요.")
            return
        }
        
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    fileprivate func tappedLeftCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
