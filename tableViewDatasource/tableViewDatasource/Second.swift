//
//  Second.swift
//  tableViewDatasource
//
//  Created by ㅇ오ㅇ on 2020/12/16.
//

import UIKit

//protocol sendEmailPasswordData {
//    func sendData(data: String)
//}

class Second: UIViewController {
    
    var text: String?
    
//    var delegate: sendEmailPasswordData?
    var handler: ((String) -> Void)?
    
    private let label = UITextField().then {
        $0.backgroundColor = .purple
        $0.textAlignment = .center
    }
    
    private lazy var button = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("BACK", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(handleTapBackButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        view.backgroundColor = .white
//
        
    }
    
    private func configureUI() {
        [label, button].forEach {
            view.addSubview($0)
        }
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-200)
            $0.width.height.equalTo(200)
        }
        
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.width.height.equalTo(200)
        }
        
        label.text = text
    }
}

extension Second {
    @objc func handleTapBackButton() {
        guard let data = label.text else { return }
//        delegate?.sendData(data: data)
        handler?("안준영")
    }
}
