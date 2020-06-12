//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var products = [Product]()
    let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    
    
    tableView.frame = view.frame
    tableView.rowHeight = 120
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    view.addSubview(tableView)

  }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusebleCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusebleCell
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        let product = products[indexPath.row]
        cell.imageView?.image = UIImage(named: product.name)
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = "간바야 ~~~~"
        
        return cell
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.productName = products[indexPath.row].name
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


