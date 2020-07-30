//
//  Ex03_ViewLayout.swift
//  SwiftUIExample
//
//  Created by ㅇ오ㅇ on 2020/07/30.
//  Copyright © 2020 shooooting. All rights reserved.
//

import SwiftUI

struct Ex03_ViewLayout: View {
  var body: some View {
    example04
  }
  
  //fill해서 원하는 색으로 frame해서 크기 지정
  var example01: some View {
    ZStack {
      Rectangle()
        .fill(Color.green)
        .frame(width: 150, height: 150)
      Rectangle()
        .fill(Color.yellow)
        .frame(width: 150, height: 150)
        .offset(x: 40, y: 40)
    }
  }
  
  var example02: some View {
    VStack(spacing: 50) {
      HStack(spacing: 10) {
        Rectangle()
          .fill(Color.green)
          .frame(width: 150, height: 150)
        Rectangle()
          .fill(Color.yellow)
          .frame(width: 150, height: 150)
      }
      
      HStack(spacing: 50) {
        Rectangle()
          .fill(Color.green)
          .frame(width: 150, height: 150)
        Rectangle()
          .fill(Color.yellow)
          .frame(width: 150, height: 150)
      }
    }
  }
  
  var example03: some View {
    HStack {
      Spacer()
        .frame(width: 100)
      Text("Spacer")
        .font(.title)
        .padding()
        .background(Color.yellow)
    }
    .background(Color.blue)
  }
  // Spacer 최대한의 크기로 벌려줌
  var example04: some View {
    VStack {
      Text("제목").font(.largeTitle)
      Text("부제목").foregroundColor(Color.gray)
      Spacer() // 1/3
      Text("본문 내용")
      Spacer() // 2/3
      Spacer()
      Text("각주").font(.body)
    }
    .font(.title)
    .frame(width: 200, height: 350)
    .padding()
    .border(Color.red, width: 2)
    // 안에서 적용한 것들이 우선순위가 더 높다 .
    // 폰트를 지정하지 않은것만 적용 된다.
  }
}

struct Ex03_ViewLayout_Previews: PreviewProvider {
  static var previews: some View {
    Ex03_ViewLayout()
  }
}
