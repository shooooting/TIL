//
//  ViewController.swift
//  tableViewDatasource
//
//  Created by ㅇ오ㅇ on 2020/12/14.
//

import UIKit

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

class ViewController: UIViewController {
    
    let tableView = UITableView()
//    let customDS = CustomDS() //인스턴스화 해서

    private var dataSource: CustomDS<MyTableViewCell, MyViewModel>!
    private var myViewModelList = ViewModelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.delegate = self
        self.dataSource = CustomDS(cellIdentifier: MyTableViewCell.identifier, items: myViewModelList.vms, configureCell: { (cell, vm) in // cell과 vm은 인스턴스를 생성할때 제네릭으로 어떤 것인지 알려주고 있다.
            
            cell.label1.text = vm.nameArray
            cell.label2.text = "\(vm.numberArray)"
            
        })
        tableView.dataSource = dataSource
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        
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

