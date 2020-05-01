//
//  AppDelegate.swift
//  FirstText
//
//  Created by ㅇ오ㅇ on 2020/05/01.
//  Copyright © 2020 shooooting. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // 코드로 만들었습니다.
    //UI 구현 : 스토리보드와 코드를 이용해 정확한 UI 구현 -> 성공
//    ✓ 주문하기 기능 : 특정 아이템의 수량이 1씩 증가하며, 결제금액에 반영 -> 성공
//    ✓ 결제하기 기능
//    -
//    소지금에서 결제금액이 정확히 차감. 소지금은 -가 될 수 없음 -> 성공
//    소지금이 결제금액보다 작을때, 같을 때, 클 때 각각의 상황 모두 체크 -> 실패
//    ✓ 초기화하기 기능 : 소지금, 결제금액, 주문수량의 정보가 모두 정확히 0으로 초기화 -> 성공
//    ✓ AlertController 동작 -> 성공
//    -
//    -
//    -
//    결제 성공 : "총 결제금액은 ****원입니다.". 버튼 종류는 확인, 취소 버튼 2개 -> 성공
//    결제 실패 : "소지금액이 부족합니다"메시지. 버튼 종류는 확인 버튼 하나 -> 실패
}

