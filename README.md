# TIL
Today I learned..

## 정리 중
- [URLSession](https://www.notion.so/shooooting/URLSession-df6cc10c381946aa865a260a330c4d72)
- [Codable](https://www.notion.so/shooooting/Codable-0c272fe62d9f4ec9be2fa1f067c36392)
- [Snapkit](https://www.notion.so/shooooting/SnapKit-b1a6f74fa9f6422ba9d246b1f02edff3)

## Git
- [Github 이용하기!](https://www.notion.so/shooooting/Git-hub-8e5884f1f4b242369c89fa4bddbf0a7e)

## Test
- [iOS fastcampus test](https://www.notion.so/shooooting/iOS-FastCampus-test-2b04e19e24eb4daf8cda9ed23d8c3330)

## mini project
- [Domino's](https://www.notion.so/shooooting/App-Make-Domino-s-e855e789fef843119ec603a9a87605fe)

## Novelty
- [Data 이동](https://www.notion.so/shooooting/Delegate-Data-991aaa14d8fb43b0b25cc482acd8ab75)
    
    1. 함수를 선언해주고 타입을 확실히 정해준다. 
    2. 함수에 데이터를 담아준다.
    3. 데이터를 사용할 곳에서 데이터를 담았을때와 같이 동일한 함수를 만들어 준다.

- [UIView로 view를 구성하고 Controller에 가져다 쓰기](https://www.notion.so/shooooting/view-03d5a2b65729460882371acf81f94143)

    1. AutoLayout에 self 사용
    2. BottomAnchor에 centerYAnchor로 잡기
    3. extension에 함수 쓰고 viewdidload에 함수 가져다 쓰기

## Study
- [JSON](https://www.notion.so/shooooting/JSON-JavaScript-Object-Notation-ad7652661f39464cb342f1f028ef8995)
- [Firebase](https://www.notion.so/shooooting/Firebase-9980e1aaf3ae44e591e9cb82e36af752)
    
    1.  자주 사용해봐야 할 것 같다. 적용하는 방법은 간단한데 데이터를 주고 받고 하는 부분을 더 연습해 봐야 할 것 같다. 

- [SPM<Swift Package Manager>](https://www.notion.so/shooooting/SPM-Swift-Package-Manager-768366a8e3ec43c6863e9ea17a528866)

    1. cocoapod과 비슷한 기능을 한다.
    2. 매우 깔끔하고 Apple이 직접 만들어서 서비스 해줘서 매우 유용하게 쓸 수 있을 것 같다.
    3. 대표적으로 Kingfisher가 있다.

## tidying up CafeSpot
- [CafeSpot](https://www.notion.so/shooooting/6e249ba2f8924397afd2cbb6d2ed0b42)
    
    1. 첫번째 뷰를 만드는데 데이터를 가져오는 방법에 대한 문제, 코너라디우스, 하트 버튼이 클릭이 되지 않았던 문제 여러가지가 발생했다.
        - cornerRadius 해결
        - Heartbutton 해결
        - data문제 많이 해결
    2. SearchBar 를 활용하여 원하는 데이터 검색해야 하는데 검색하는 부분을 구현하기 힘들었다.
        - 첫 글자부터 치면 검색이 원활하게 되는데 ...
        - 뒷 글자를 치면 안된다...ㅜㅜ
    3. 
    * Storyboard 구현
        - 선생님의 코드 보고 연구 및! 코드로 적용시켜 보기

## AngelHack 2020 참여
- [쓸애기](https://www.notion.so/shooooting/2020-ANGELHACK-a2aa126e52804694aca483c9cbbd8aeb)

    1. 디자이너와의 협업
        - 여러가지 장점과 단점이 있었지만 크게 나누어 보자면 장점은 확실하게 이쁜 디자인을 받아 볼 수 있었고, 단점으로 꼽자고 하면 디자인이 너무 늦게 나오고 잦은 수정으로 스트레스가 컸다.
    2. 3명의 개발자와의 협업
        - 개발자의 능력보다는 커뮤니캐이션이 가장 중요하다고 느꼈고 3명이상의 협업은 처음이라 깃헙 활용에도 어려움이 꽤 있었다. 이렇게 협업을 하면서 깃헙에 많이 익숙해 지는 계기가 되었고 어떻게 하면 원활한 개발이 이루어 지려면 어떤 것이 선행되어야 하는지 깨닿는 계기가 되었다. 

## Tidying up Weather
- [Weather](https://www.notion.so/shooooting/82755005132040c981f03879a98c45a5)
    
    1. data parsing
        - URLSession을 활용하여 HTTP에서 JSON parsing
    2. stackView
        - 따로 View를 만들어 주고 이 View에 stackView를 넣어 주려고 하는데 어떻게 넣어 줄지 고민...