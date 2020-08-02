//
//  JSONData.swift
//  MakeNavi
//
//  Created by ㅇ오ㅇ on 2020/08/02.
//  Copyright © 2020 shooooting. All rights reserved.
//

import Foundation

class dataManager {
  
  static let shared: dataManager = dataManager()
  var searchResult: SearchResult?
  
  private init() {
    
  }
}

struct SearchResult: Codable {
  let lastBuildDate: String
  let total: Int
  let start: Int
  let display: Int
  let items: [MovieInfo]
  
  struct MovieInfo: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: String
  }
}

