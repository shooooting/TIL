//
//  Ex05_List.swift
//  SwiftUIExample
//
//  Created by ㅇ오ㅇ on 2020/07/30.
//  Copyright © 2020 shooooting. All rights reserved.
//

import SwiftUI

struct Ex05_List: View {
  var body: some View {
   example04
  }
  
  var example01: some View {
    List {
      Text("1")
      Text("2")
      Text("3")
      Text("4")
      Text("5")
      Text("6")
      Text("7")
      Text("8")
      Text("9")
      Text("10")
//      Text("11") // Error. 자식 뷰는 최대 10개까지만!!!
    }
  }
  
  var example02: some View {
    List {
      Text("List").font(.largeTitle)
      Image("SwiftUI")
      Circle().frame(width: 100, height: 100)
      Color(.red).frame(width: 100, height: 100)
    }
  }
  
  var example03: some View {
    List(0..<100) {
      Text("\($0)")
    }
  }
  
  var example04: some View {
    List {
      Section (
        header: Text("헤더 1"),
        footer: Text("푸터 1")
      ) {
        Text("1")
        Text("2")
        Text("3")
        Text("SwiftUI")
      }
      
      Section (
        header: Text("헤더 2"),
        footer: HStack{ Spacer(); Text("푸터2")}
      ) {
        Text("섹션2")
        Text("SwiftUI")
      }
    }
    .listStyle(GroupedListStyle())
  }
}

struct Ex05_List_Previews: PreviewProvider {
  static var previews: some View {
    Ex05_List()
  }
}
