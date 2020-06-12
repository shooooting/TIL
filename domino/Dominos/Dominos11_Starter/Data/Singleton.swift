//
//  File.swift
//  Dominos11_Starter
//
//  Created by ㅇ오ㅇ on 2020/06/11.
//  Copyright © 2020 Kira. All rights reserved.
//

import Foundation

final class Singleton {
  static let shared = Singleton()
  private init() {}
  
  var wishListDict: [String: Int] = [:]
}
