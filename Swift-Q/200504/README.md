# Type Casting
## 과제
```swift
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
```