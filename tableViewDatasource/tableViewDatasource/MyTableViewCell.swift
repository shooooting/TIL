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
    
    var namelabel1 = UILabel()
    var numberlabel2 = UILabel()
    var button = UIButton()
    
    var delegate: MyTableViewCellDelegate?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLayout()
        
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.frame.size = CGSize(width: 100, height: 50)
        button.addTarget(self, action: #selector(tapCenterButton), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        [numberlabel2, namelabel1, button].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            namelabel1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            numberlabel2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            namelabel1.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            numberlabel2.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc func tapCenterButton() {
        delegate?.buttonNameAndNumber(cell: self)
    }
}
