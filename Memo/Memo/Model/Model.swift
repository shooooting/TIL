//
//  Model.swift
//  Memo
//
//  Created by ㅇ오ㅇ on 2020/11/02.
//

import Foundation

class Memo {
    var content: String  // 메모 내용 저장 속성
    var insertData: Date  // 메모를 추가한 날자 속성
    
    init(content: String) { // 클래스 이기때문에 속성을 초기화하는 생성자를 만들어야 한다.
        self.content = content
        insertData = Date() // 현재 날짜를 바로 저장하면 되기때문에
    }
    
    static var dummyMemoList = [ // 더미 데이터
        Memo(content: "Lorem Ipsum"),
        Memo(content: "Subscribe + 👍 = 🌻")
    ]
}
