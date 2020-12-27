//
//  CustomDS.swift
//  tableViewDatasource
//
//  Created by ㅇ오ㅇ on 2020/12/14.
//

import Foundation
import UIKit

// 상속 -> 상위 클래스에 있는 기능들을 다 사용할 수 있게 해준다. 메소드를 쓸 수 있게 해준다.
// UITalbeViewDataSource는 protocol 이다.
class CustomDS<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell { // T타입이 UITablewViewCell만 받는다.
    
    let cellIdentifier: String // identifier을 담는다.
    var items: [ViewModel] // cell에 들어갈 data를 넣는다.
//    let customCell: T
    let configureCell: (CellType, ViewModel) -> () // UITableViewCell타입의 클래스와 데이터를 제네릭으로 가져온 것을 넣어준다.
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> () ) {
        
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else { fatalError("My cell Error") }
        
//        cell.label1.text = "\(indexPath.row)"
//        cell.label2.text = "\(indexPath.row + 1)"
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        
        return cell
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
}
