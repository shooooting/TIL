//: [Previous](@previous)
/*:
 # Type Casting
 ---
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ---
 */

import UIKit

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  override var color: UIColor {
    get { return .white }
    set { }
  }
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/*
 Shape
  - Rectangle
  - Triangle
 모두 draw() 오버라이드
 */


/*:
 ---
 ## Upcasting
 ---
 */
print("\n---------- [ Upcasting ] ----------\n")

/*
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
 (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 */


// Shape - black, Rectangle - white

let rect = Rectangle()
rect.color
rect.cornerRadius

let t1 = rect as Shape
let t2 = rect as Rectangle

(rect as Shape).color
//(rect as Shape).cornerRadius shape 타입인데 cornerradius가 없어서 에러가 난다.

(rect as Rectangle).color
(rect as Rectangle).cornerRadius
rect.cornerRadius
rect.color



let upcastedRect: Shape = Rectangle()
type(of: upcastedRect)   //

upcastedRect.color
//upcastedRect.cornerRadius shape타입에 cornerRadius를 갖고 있지 않아서 에러가 뜸

(upcastedRect as Shape).color
//(upcastedRect as Rectangle).color as는 자기 자신이거나 부모클래스 일때만 사용!

//부모 클래스 타입으로는 항상 변경할 수 있는데, 자식 클래스로 변경할 수는 없는 이유?
//

//자식 클래스 타입 <= 부모 크래스 타입
//자식 클래스 타입 => 부모 크래스 타입
//

// Human > name
// Student > name, school
/*:
 ---
 ## Downcasting
 ---
 */
print("\n---------- [ Downcasting ] ----------\n")

/*
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 */


let shapeRect: Shape = Rectangle()
var downcastedRect = Rectangle()

//downcastedRect = shapeRect //
//downcastedRect = shapeRect as Rectangle
// 위의 두개다 안돼 !

//downcastedRect: Rectangle = shapeRect as? Rectangle  // as? 옵셔널 타입으로 변경되는데 옵셔널 타입이 아니라서 실패
downcastedRect = shapeRect as! Rectangle  // 강제로 변화를 시도 !

//as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
//as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생



//Q. 아래 value 에 대한 Casting 결과는?
let value = 1
//(value as Float) is Float   //err 자식이나 부모 클래스도 아니고 Int가 아닌데 바꾸려고 하니깐
//(value as? Float) is Float  //false nil 값을 가진다.
//(value as! Float) is Float  //err 난다.


/*:
 ---
 ## Type Check Operator
 ---
 */
let shape = Shape()
let rectangle = Rectangle()
let triangle = Triangle()

let list = [shape, rectangle, triangle]
type(of: list)  //Array Shape 타입


/*:
 ---
 ### Question
 - 아래 for 문에 대한 실행 결과는?
 ---
 */
//for elem in list {
//  if elem is Shape {
//    print("shape instance")
//  } else if elem is Rectangle {
//    print("rect instance")
//  } else if elem is Triangle {
//    print("triangle instance")
//  }
//}공통적으로 shape 타입에 속해 있어서 이렇게 하면 shape instance 만 3번 뜬다.



print("\n---------- [ ] ----------\n")

// let list: [Shape] = [shape, rectangle, triangle] 컴파일 단계에서는 shape로 인식을 하는데 실행(런타임)을 시켰을땐 실제 들어있는 것으로 동작을 함.!!
for element in list  {
  element.draw()
}

// 컴파일 단계는 shape로 타입을 인식 하는데 막상 실행단계인 런타임 시 실제 값을 준 대상들이 들어감.
// 위의 for문에서 element에는 shape, rectagle, triangle 순으로 들어간다.


//[ 과제 ]
//1.

//class Shape {
//  var color = UIColor.black
//
//  func draw() {
//    print("draw shape")
//  }
//}
//
//class Rectangle: Shape {
//  var cornerRadius = 0.0
//  override var color: UIColor {
//    get { return .white }
//    set { }
//  }
    
func addTwoValues(a: Int, b: Int) -> Int {
  return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)
type(of: task1)

if let task1 = task1 as? Int {
    var a = 0
    a = task1 + task1
    print(a)
}

//
//위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것



//
//
//[ 도전 과제 ]
//1.
//let task2: Any = addTwoValues
//과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
//두 변수의 더하기 연산이 제대로 동작하도록 할 것
//(addTwoValues의 각 파라미터에는 원하는 값 입력)
//
//task2 + task2

let task2: Any = addTwoValues(a: 4, b: 5)

if let task2 = task2 as? Int {
    var a = 0
    a = task2 + task2
    print(a)
}


//
//
//2.
class Car {}
let values: [Any] = [
  1,
  99.9,
  (2.0, Double.pi),
  Car(),
  { (str: String) -> Int in str.count }
]
//
//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
values[4]
type(of: values[4])

for value in values {
  switch value {
  case is Int:
    print("\(value)는 Int 타입입니다.")
  case is Double:
    print("\(value)는 Double 타입입니다.")
  case is (Double, Double):
    print("\(value)는 (Double, Double) 타입입니다.")
  case is Car:
    print("\(value)는 Car {} 타입입니다.")
  default:
    print("\(value)는 (String) -> Int 타입입니다.")
  }
}

//: [Next](@next)
