//
//  Ex02_Image.swift
//  SwiftUIExample
//
//  Created by ㅇ오ㅇ on 2020/07/30.
//  Copyright © 2020 shooooting. All rights reserved.
//

import SwiftUI

struct Ex02_Image: View {
  var body: some View {
    example04
  }

  
  // SwiftUI에서는 이미지 크기랑 뷰의 크기는 별개의 내용이다.
  // SwiftUI에서는 .resizable()이라는 것을 적어줘야 한다.
  var example01: some View {
    HStack {
      Image("SwiftUI")
        // 꽉 차는게 기본값
      .resizable()
        .frame(width: 100, height: 150)
      Image("SwiftUI")
      .resizable()
      .scaledToFit()
        .frame(width: 100, height: 150)
      Image("SwiftUI")
      .resizable()
      .scaledToFill()
        .frame(width: 100, height: 150)
      .clipped()
    }
  }
  
  var example02: some View {
    HStack {
      Image("SwiftUI")
      Image("SwiftUI").renderingMode(.original)
      // 원래의 색상을 유지
      Image("SwiftUI").renderingMode(.template)
      // 원래 색상의 정보를 제거하고 특정 색으로 덮을 수 있다.
      // 버튼에서 이미지 넣을 때 랜더링 모드를 오리지날로 변경을 해줘야 한다.
//      Image(systemName: "person").font(.largeTitle)
    }
    .foregroundColor(.yellow)
  }
  
  var example03: some View {
    HStack(spacing: 70){
      Image(systemName: "book.fill")
        .imageScale(.small)
        .foregroundColor(.red)
      Image(systemName: "book.fill")
        .imageScale(.medium)
        .foregroundColor(.green)
      Image(systemName: "book.fill")
        .imageScale(.large)
        .foregroundColor(.blue)
    }
    .font(.largeTitle)
  }
  // some View는 퉁쳐서 만들어 놓음
//  HStack<TupleView<(Text, Image)>> 밑에껀 이거임
  // some View를 안쓰면 저렇게 다 써줘야 함.
  var example04: some View {
    let myView = HStack {
      Text("Hello Good Shit")
      Image("SwiftUI")
    }
    print(type(of: myView))
    return myView
  }
}

struct Ex02_Image_Previews: PreviewProvider {
  static var previews: some View {
    Ex02_Image()
  }
}
