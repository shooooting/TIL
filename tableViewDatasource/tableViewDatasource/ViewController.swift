//
//  ViewController.swift
//  tableViewDatasource
//
//  Created by ㅇ오ㅇ on 2020/12/14.
//

import UIKit
import SnapKit
import Then

struct MyViewModel {
    var nameArray: String//["a", "b", "c", "d", "e"]
    var numberArray: Int//["1", "2", "3", "4", "5"]
}

struct ViewModelList {
    var vms: [MyViewModel] = [
        MyViewModel.init(nameArray: "a", numberArray: 1),
        MyViewModel.init(nameArray: "b", numberArray: 2),
        MyViewModel.init(nameArray: "c", numberArray: 3),
        MyViewModel.init(nameArray: "d", numberArray: 4),
        MyViewModel.init(nameArray: "e", numberArray: 5)
    ]
}

protocol MyTableViewCellDelegate {
    func buttonNameAndNumber(cell: MyTableViewCell)
}

class ViewController: UIViewController {
    
    let tableView = UITableView()
//    let customDS = CustomDS() //인스턴스화 해서

    private var dataSource: CustomDS<MyTableViewCell, MyViewModel>!
    private var myViewModelList = ViewModelList()
    private let vc = Second()
    
    private var emailTextField = UITextField().then {
        $0.placeholder = "email"
    }
    
    private var passwordTextFiled = UITextField().then {
        $0.placeholder = "password"
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .black
        $0.addTarget(self, action: #selector(handleLoginButtonTap), for: .touchUpInside)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.dataSource.updateItems([
                MyViewModel.init(nameArray: "a", numberArray: 7),
                MyViewModel.init(nameArray: "b", numberArray: 8),
                MyViewModel.init(nameArray: "c", numberArray: 9),
                MyViewModel.init(nameArray: "d", numberArray: 10),
                MyViewModel.init(nameArray: "e", numberArray: 11)
            ])
            self.tableView.reloadData()
        }
        
        configureTableView()
        textField()
        
        vc.handler = { text in
            self.emailTextField.text = text
        }
    }
    
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        self.dataSource = CustomDS(cellIdentifier: MyTableViewCell.identifier, items: myViewModelList.vms, configureCell: { (cell, vm) in // cell과 vm은 인스턴스를 생성할때 제네릭으로 어떤 것인지 알려주고 있다.
            
            cell.namelabel1.text = vm.nameArray
            cell.numberlabel2.text = "\(vm.numberArray)"
            
        })
        tableView.dataSource = dataSource
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.snp.centerY).offset(-100)
        }
    }
    
    private func textField() {
        [emailTextField, passwordTextFiled, loginButton].forEach {
            view.addSubview($0)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        passwordTextFiled.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextFiled.snp.bottom).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(200)
            $0.height.equalTo(80)
        }
    }
}

extension ViewController {
    @objc func handleLoginButtonTap() {
        
        let email = emailTextField.text
        let password = passwordTextFiled.text
        
        if email?.isEmpty == false && password?.isEmpty == false {
            vc.text = emailTextField.text
            present(vc, animated: true, completion: nil)
        }
        
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
//
//        cell.label1.text = "\(indexPath.row)"
//        cell.label2.text = "\(indexPath.row + 1)"
//
//        return cell
//    }
//
//
//}

extension ViewController: UITableViewDelegate {
  
}

//extension ViewController: sendEmailPasswordData {
//    func sendData(data: String) {
//        print(data)
//    }
//}
