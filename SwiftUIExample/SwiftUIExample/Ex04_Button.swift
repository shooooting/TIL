//
//  Ex04_Button.swift
//  SwiftUIExample
//
//  Created by ㅇ오ㅇ on 2020/07/30.
//  Copyright © 2020 shooooting. All rights reserved.
//

import SwiftUI

struct Ex04_Button: View {
  var body: some View {
    example02
  }
  
  var example01: some View {
    HStack(spacing: 20) {
      Button("Button") {
        print("Button 1")
      }
      Button(action: {
        print("Button 2")
      }) {
        Text("Button")
          .padding()
          .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
      }
      //background의 개념은 뒤에 추가하는 개념
      //overlay는 뷰의 앞에다가 추가하는 것
      
      Button(action: {
        print("Button 3")
      }) {
        Circle()
          .stroke(lineWidth: 2)
          .frame(width: 80, height: 80)
          .overlay(Text("Button"))
      }
      .accentColor(.green)
    }
  }
  
  var example02: some View {
    HStack(spacing: 20) {
      Button(action: {
        print("Button 1")
      }) {
        Image("SwiftUI")
          .resizable()
          .renderingMode(.original)
          .frame(width: 120, height: 120)
      }
      
      Button(action: {
          print("Button 2")
        }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
//            .renderingMode(.original)
            .font(.largeTitle)
        }
      .accentColor(.green)
    }
  }
}

struct Ex04_Button_Previews: PreviewProvider {
  static var previews: some View {
    Ex04_Button()
  }
}
