//
//  MyTableViewCell.swift
//  tableViewDatasource
//
//  Created by ㅇ오ㅇ on 2020/12/14.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    // MARK: - Properties
    static let identifier = "MyTableViewCell"
    
    var label1 = UILabel()
    var label2 = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        [label2, label1].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            label1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            label1.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label2.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
