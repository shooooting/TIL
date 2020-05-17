# AutoLayout

 
 ```swift
 let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInsets = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.frame.width - padding - horizontalInsets) / 2 - margin
        
        let box1Frame = CGRect(x: safeLayoutInsets.left + margin, y: yOffset, width: viewWidth, height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin))
        inToView(for: box1, frame: box1Frame)
        
        let box2Frame = CGRect(x: box1.frame.maxX + padding, y: yOffset, width: viewWidth, height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin))
        inTheView(for: box2, frame: box2Frame)
 ```
![image](https://user-images.githubusercontent.com/62827163/82026363-9d50c600-96cd-11ea-8e07-915620c802d7.png)

![image](https://user-images.githubusercontent.com/62827163/82026245-75f9f900-96cd-11ea-8361-23574d7ff6a3.png)

---

## AutoLayoutPractice

오토레이아웃 연습 (별도 이미지 참고)
1.
View와 SafeArea를 구분해 오토레이아웃 설정하기

2.  
- 5개의 뷰를 생성하고 높이는 150으로 통일
- Safe Area Top 과 60 의 거리
- 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
- 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님

예시)
2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정

![image](https://user-images.githubusercontent.com/62827163/82144848-74bdfd00-9882-11ea-992b-4e88828015ca.png)

![image](https://user-images.githubusercontent.com/62827163/82144865-78ea1a80-9882-11ea-863b-4c7a56f2ae3f.png)