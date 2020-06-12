//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let tableView = UITableView()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Domino's"
        setUI()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.tableView.reloadData()
//    }
    
    private func setUI() {
        tableView.frame = view.frame
        tableView.rowHeight = 100

        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        tableView.tableHeaderView = imageView

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(tableView)

    
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CategoryTableViewCell else { fatalError() }
        cell.inCategoryImage(category: menuData[indexPath.row].category)
        return cell
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productVC = ProductViewController()
        productVC.navigationItem.title = menuData[indexPath.row].category
        productVC.products = menuData[indexPath.row].products
        navigationController?.pushViewController(productVC, animated: true)
    }
}
