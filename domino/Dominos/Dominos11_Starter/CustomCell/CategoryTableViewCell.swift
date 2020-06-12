//
//  CategoryTableViewCell.swift
//  Dominos11_Starter
//
//  Created by ㅇ오ㅇ on 2020/06/11.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let categoryImageView = UIImageView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        categoryImageView.contentMode = .scaleToFill
        contentView.addSubview(categoryImageView)
        
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    func inCategoryImage(category: String) {
        categoryImageView.image = UIImage(named: category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
