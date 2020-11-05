//
//  PlusMemoViewController.swift
//  Memo
//
//  Created by ㅇ오ㅇ on 2020/11/02.
//

import UIKit

class ComposeViewController: UIViewController {
    
    private let txtV = UITextView()
    var editTarget: Memo?
    var originalMemoContent: String? // 편집 이전의 메모 내용 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) { // 편집화면이 표시되기 직전에
        super.viewWillAppear(animated)
        
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) { // 편집화면이 사라지기 직전에
        super.viewWillDisappear(animated)
        
        navigationController?.presentationController?.delegate = nil
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
            originalMemoContent = memo.content
        } else {
            navigationItem.title = "새 메모"
            txtV.text = ""
        }
        
        txtV.delegate = self
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

extension ComposeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) { // 텍스트뷰에서 텍스트를 편집할때마다 반복적으로 호출된다.
        if let original = originalMemoContent, let edited = txtV.text {
            if #available(iOS 13.0, *) {
                isModalInPresentation = original != edited // original이랑 edited의 내용이 다를때 true를 보냄
                // 텍스트뷰에서 메모를 편집하면 원복과 다른가를 판단해서 원본과 다르면 메모가 편집되었다고 생각한다.
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

extension ComposeViewController: UIAdaptivePresentationControllerDelegate {
    // 오리지날 메모랑 편집된 메모의 내용이 다르면 isModalInPresentation에 true가 들어가서 이 상태에서 페이지를 풀다운하면
    // 시트가 사라지지 않고 아래의 메소드가 호출이 된다.
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "알림", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] (action) in
            // 확인 선택하면 이 클로저가 선택된다.
            self?.tappedRightSaveButton()
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (action) in
            self?.tappedLeftCancelButton()
        }
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}
