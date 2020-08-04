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
  private let searchBar = UITextField()
  private let posterImg = UIImageView()
  private let movieTitleLabel = UILabel()
  
  let button = UIButton(type: .system)
  
  private let border = CALayer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setConstraint()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    //    searchBar.becomeFirstResponder()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    searchBar.resignFirstResponder()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewWillLayoutSubviews()
    searchBar.borderStyle = .none
    border.frame = CGRect(x: 0, y: searchBar.frame.size.height-1, width: searchBar.frame.width, height: 2)
    border.backgroundColor = UIColor.black.cgColor
    searchBar.textColor = UIColor.black
    searchBar.placeholder = "검색어를 입력해주세요."
  }
  
  func setUI() {
    [upV, upViewTitle, searchBar, posterImg, movieTitleLabel].forEach { view.addSubview($0) }
    
    searchBar.layer.addSublayer(border)
    searchBar.delegate = self
    
    upViewTitle.text = "SearchL:)st"
    upViewTitle.font = UIFont.boldSystemFont(ofSize: 35)
    
    posterImg.backgroundColor = .red
    movieTitleLabel.backgroundColor = .green
  }
  
  func setConstraint() {
    upV.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height / 6))
    
    let space: CGFloat = 16
    
    [upViewTitle, searchBar, posterImg, movieTitleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      upViewTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
      upViewTitle.bottomAnchor.constraint(equalTo: upV.bottomAnchor, constant: -space),
      
      searchBar.topAnchor.constraint(equalTo: upV.bottomAnchor),
      searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
      searchBar.widthAnchor.constraint(equalToConstant: view.frame.width - (space * 2)),
      searchBar.heightAnchor.constraint(equalToConstant: 50),
      
      posterImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      posterImg.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: space),
      posterImg.widthAnchor.constraint(equalToConstant: view.frame.width - (space * 2)),
      posterImg.heightAnchor.constraint(equalToConstant: view.frame.height / 2),
      
      movieTitleLabel.topAnchor.constraint(equalTo: posterImg.bottomAnchor, constant: space),
      movieTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
    ])
  }
  
  func requestAPI(queryValue: String) {
    let clientID: String = "uiqxm1pLgFZShlkQAKbU"
    let clientKey: String = "b3wG6Jny41"
    
    let query: String = "https://openapi.naver.com/v1/search/movie.json?query=\(queryValue)"
    let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    let queryURL: URL = URL(string: encodedQuery)!
    
    var requestURL = URLRequest(url: queryURL)
    //    requestURL.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    requestURL.addValue(clientID, forHTTPHeaderField: "X-naver-Client-Id")
    requestURL.addValue(clientKey, forHTTPHeaderField: "X-naver-Client-Secret")
    
    let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
      guard error == nil else { return }
      guard let data = data else { return }
      
      do {
        let searchInfo: SearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
        dataManager.shared.searchResult = searchInfo
        self.urlTaskDone()
      } catch {
        print(error)
      }
    }
    task.resume()
  }
  
  func urlTaskDone() {
    let item = dataManager.shared.searchResult?.items[0]
    
    do{
      let imageURL = URL(string: item!.image)
      let imageData = try Data(contentsOf: imageURL!)
      let img = UIImage(data: imageData)
      
      DispatchQueue.main.async {
//        self.posterImg.image = posterImage
        self.movieTitleLabel.text = item?.title
        self.posterImg.image = img!
      }
    } catch {
      
    }
  }
}

extension SecondViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    let queryValue: String = searchBar.text ?? ""
    requestAPI(queryValue: queryValue)
    searchBar.resignFirstResponder()
    return true
  }
  
//  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//
//    view.addSubview(button)
//    button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
//    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    button.imageView?.contentMode = .scaleAspectFill
//    button.clipsToBounds = true
//    button.tintColor = .black
//
//    button.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//
//      button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//      button.topAnchor.constraint(equalTo: searchBar.topAnchor),
//      button.widthAnchor.constraint(equalToConstant: 50),
//      button.heightAnchor.constraint(equalToConstant: 50),
//
//      //      searchBar.leadingAnchor.constraint(equalTo: button.trailingAnchor, constant: -40),
//    ])
//    return true
//  }
}
