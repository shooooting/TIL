//
//  SecondViewController.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/02.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  private let upV: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBackground
    return view
  }()
  
  private let upViewTitle = UILabel()
  private let searchBar = UISearchBar()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
  
  func setUI() {
    [upV, upViewTitle, searchBar].forEach { view.addSubview($0) }
    
    upViewTitle.text = "SearchL:)st"
    upViewTitle.font = UIFont.boldSystemFont(ofSize: 35)
  }
  
  func setConstraint() {
    upV.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height / 6))
    
    let space: CGFloat = 16
    
    [upViewTitle, searchBar].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }

    NSLayoutConstraint.activate([
      upViewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
      upViewTitle.bottomAnchor.constraint(equalTo: upV.bottomAnchor, constant: -space),
      
      searchBar.topAnchor.constraint(equalTo: upV.bottomAnchor),
      searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      searchBar.widthAnchor.constraint(equalToConstant: view.frame.width),
      searchBar.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
//  func requestAPI(queryValue: String) {
//    let clientID: String = "uiqxm1pLgFZShlkQAKbU"
//    let clientKey: String = "b3wG6Jny41"
//
//    let query: String = "https://openapi.naver.com/v1/search/movie.json?query=\(queryValue)"
//    let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
//    let queryURL: URL = URL(string: encodedQuery)!
//
//    var requestURL = URLRequest(url: queryURL)
//    requestURL.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
//    requestURL.addValue(clientID, forHTTPHeaderField: "X-naver-client-Id")
//    requestURL.addValue(clientKey, forHTTPHeaderField: "X-naver-Client-Secret")
//
//    let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
//      guard error == nil else { return }
//      guard let data = data else { return }
//
//      do {
//        let searchInfo: SearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//        dataManager.shared.searchResult = searchInfo
//      } catch {
//        print(error)
//      }
//    }
//    task.resume()
//  }
//
//  func urlTaskDone() {
//    let item = dataManager.shared.searchResult?.items[0]
//
//    do {
//      let imageURL = URL(string: item!.image)
//      let imageData = try Data(contentsOf: imageURL!)
//      let posterImage = UIImage(data: imageData)
//
//      OperationQueue.main.addOperation {
//      }
//    } catch {
//
//    }
//  }
}
