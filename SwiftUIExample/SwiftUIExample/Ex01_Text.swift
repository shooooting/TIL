//
//  Ex01_Text.swift
//  SwiftUIExample
//
//  Created by ㅇ오ㅇ on 2020/07/30.
//  Copyright © 2020 shooooting. All rights reserved.
//

import SwiftUI

struct Ex01_Text: View {
  var body: some View {
    example05
  }
  
  // modifier = method
  // 수식어 - 뷰에서 사용가능한 메서드 , 어떤 변화를 가미한 새로운 뷰를 반환하는 메서드
  
  var example01: some View {
    Text("AN JUN YOUNG")
//            .font(.largeTitle)
//            .fontWeight(.bold)
//            .font(.system(size: 40, weight: .medium))
      .font(.custom("AppleGothic", size: 48))
  }
  
  var example02: some View {
    Text("Hello Junyoung").font(.title)
      .foregroundColor(.green)
      .italic()
      +
      Text("Nice").font(.largeTitle)
        .foregroundColor(.pink)
        .baselineOffset(10)
  }
  
  var example03: some View {
    Text("Super Junyoung")
      .font(.title)
      .kerning(5)
      .underline(true, color: .green)
      .strikethrough(true, color: .yellow)
  }
  
  
  // 수식어 적용 시 순서 주의
  var example04: some View {
    Text("Hello Junyoung")
      .font(.largeTitle)        // Text
      .bold()                   // Text
      .background(Color.yellow) // View
    
    
    //      Text("Hello Junyoung")
    //        .background(Color.yellow) // View
    //        .font(.largeTitle)        // View
    //        .bold()                   // Text
    //    한정적인 수식어들 먼저 작성하고 !!
    //    공통적인 수식어들은 뒤쪽에 작성해야 한다.
    
  }
  
  // 순서에 따라서 어떻게 적용하느냐에 따라서 출력되는 모습이 달라진다.
  var example05: some View {
    VStack(spacing: 20) {
      Text("🌺🌸🌼🌻").font(.largeTitle)
        .padding()
        .background(Color.yellow)
      // 패딩이 먼저 적용되고 백그라운드 색이 들어간다.
      Text("🌺🌸🌼🌻").font(.largeTitle)
        .background(Color.yellow)
        .padding()
      //백그라운드 색이 들어가고 패딩이 들어간다.
    }
  }
}

// 오늘쪽에 previews는 이 아이때문에 나올 수 있다.
// Group으로 묶어서 preview에 여러가지를 띄울 수 있다.
struct Ex01_Text_Previews: PreviewProvider {
  static var previews: some View {
//    Group {
      Ex01_Text()
//        .previewLayout(.sizeThatFits)
////        .previewLayout(.fixed(width: 300, height: 200))
////        .previewLayout(.device)
//
//      Ex01_Text()
//        .preferredColorScheme(.dark)
//        .previewDisplayName("Sweet Junyoung")
//        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//
//
//      Ex01_Text()
//        .preferredColorScheme(.light)
//        .previewDisplayName("Sexy Junyoung")
//        .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//
//    }
    //  .previewDisplayName("Sweet Junyoung")
  }
}


