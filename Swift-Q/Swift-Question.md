
# + 1에서 5까지 reversed 같은 메서드를 쓰지 않고 역순으로 출력되게 하는 함수

```swift
func Number() {
    let range = 1...5
    range.lowerBound
    range.upperBound

    for i in range {

        let sum = range.upperBound - i + range.lowerBound
        print("\(sum) times 5 is \(sum * 5)")
    }
}

Number()
```
```
* 이해
1에서 5까지 수 중에서
range.lowerBound는 가장 낮은 수인 1을
range.upperBound는 가장 큰 수인 5를 나타낸다.
이것을 for문에 대입하여 돌리게 된다.
처음으로 i는 1을 가지게 될 것이고 in 뒤에 들어가는 것은 횟수가 된다.
range가 1부터5까지라서 5회 동안 돌아간다.
안의 내용은 
첫번째 들어가서 돌때는 sum은 
5 = 5 - 1 + 1 
4 = 5 - 2 + 1
이렇게 점점 숫자가 줄어들게 된다. 
i 의 값이 계속 늘어나게 된다.
결국엔 i의 값은 1 2 3 4 5 가 되고 sum은 5 4 3 2 1 이 된다. 
```

# + 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
```swift
func print(name: String) {
    print(name)
}

print(name:"안준영")
```

# + 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
```swift
func years(_ age: Int) {
    print(age)
}

years(32)
```

# + 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
```swift
func hello(to name: String) {
    print(name)
}

hello(to:"준영")
```
# + 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
```swift
//if temperatureInFahrenheit <= 32 {
//  print("It's very cold. Consider wearing a scarf.")
//} else if temperatureInFahrenheit >= 86 {
//  print("It's really warm. Don't forget to wear sunscreen.")
//} else {
//  print("It's not that cold. Wear a t-shirt.")
//}

var temperaturInFahrenheit = 30

switch temperaturInFahrenheit {
case ...32 :
    print("It's very cold. Consider wearing a scarf.")
case 86... :
    print("It's really warm. Don't forget to wear sunscreen.")
default :
    print("It's not that cold. Wear a t-shirt.")
}
```

# + 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
```swift
let math = 4
switch math {
case let x where x%2 == 0 :
    print("짝수")
default:
    print("홀수")
}
```
# + for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
```swift
let down = 3
var answer = 1

for _ in 1...10 {
    answer *= down
}

print(answer)
```
```
* 이해
우선 3의 10승을 만들려면 3이 기본적으로 있고 계속 3이 10번 곱해져야 하는 구조니깐
in 뒤에 들어오는게 횟수 이고 앞에 들어가는 부분은 크게 상관이 없으니깐 _ 표시 해주고 
answer = answer * down 이니깐 
처음엔
3 = 1 * 3 이렇게 시작하고
9 = 3 * 3 
27 = 9 * 3
71 = 27 * 3 
이런 식으로 10번이 되는 거다.
```
# + 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
```swift
func soso(number: Int) {
    var i = 1
    while i <= 9 {
        print("\(number) * \(i) = \(number * i)")
        i += 1
    }
}
soso(number: 2)
```
```
* 이해
while 은 참이면 무한으로 반복하는 특징을 가지고 있어서 멈출 수 있는 한계선을 만들어줘야 한다. 그래서 i는 9까지 라는 한계를 두었다. 그래서 i는 1에서 9를 가져가고 그 밑으로
number에 2를 주었기때문에 print 부분에 처음으로 들어가는 식은 2 * 1 = 2가 되고 그 밑으로 i가 1인게 내려가서 1 + 1 = 2 가 되고 또 print로 2가 i로 올라가게 된다.
이런식으로 
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
이렇게 쭉 
2 * 9 = 18 까지 내려가게 된다.
```
# + 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
```swift
func Num(number: Int) {
    var i = 1
    var e = 0
    repeat {
        e += i
        i += 1
    } while i <= number
    print(e)
}

Num(number:10)
```
# + 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되 2번째 파라미터와 결과값의 타입은 옵셔널로 정의. 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
```swift
func optional(op1: Int, op2: Int?) -> Int? {
    guard let op2 = op2, op2 != 0 else { return nil }
    return op1 % op2
}

optional(op1: 3, op2: 4)
```
```
* 이해
Optional 타입의 op2을 Binding과 Unwraping을 
guard let op = op 이 부분에서 해주고 이 부분에서 nil이면 nil 출력
값이 있으면 op2 != 0 이 부분에서 0이 아니니깐
그 밑의 op1 % op2 로 내려간다. 
```
# + 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

```
func combineString(str1: String?, str2: String?, str3: String?) -> String {
  // code
}

// 입력 예시 및 결과
combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"

```
```swift
func combinString(str1: String?, str2: String?, str3: String?) -> String {
    let show1 = str1 ?? ""
    let show2 = str2 ?? ""
    let show3 = str3 ?? ""

    let sum: String = show1 + show2 + show3
    return sum
}

combinString(str1:"AB", str2:"CD", str3:"EF")
```
```
* 이해
Optional<String>타입의 str1,2,3이 있고 이것을 unwrapped을 시켜주기 위해서 
let show1 = str1 ?? "" <- 이것을 사용했다.
ㄴ str1 이 nil 값이면 "" 이걸로 show1에 담기고 아니면 있는 그대로 담기는 방식이다.
그렇게 show1,2,3에 담기고 하나의 문자열로 반환하려면 
let sum: String = show1 + show2 + show3
이렇게 sum에 담아 주는데 String 타입으로 맞춰 주고 마지막으로 return! 해주면 된다.
```
# + 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
```
예시
enum Arithmetic {
  case addition, subtraction, multiplication, division
}
```
```swift
enum Arithmetic {
    case addition, subtraction, multiplication, division

    func math(num1: Int, num2: Int) -> Double {
        var a: Double = 0.0
        switch self {
        case .addition:
         a = (num1 + num2)
        case .subtraction:
         a = (num1 - num2)
        case .multiplication:
         a = (num1 * num2)
        case .division:
         a = (num1 / num2)
        }
        return a
    }
}
let sum = Arithmetic.addition
sum.math(num1: 2, num2: 3)
```
```
* 이해
enum 구문에 case를 선언한 4개의 연산 밑으로 함수를 만들어 준다. 
2개의 자연수를 Int값으로 받아오고 return으로 Double값이 나올 수 있도록 한다.
연산의 결과에 따라서 소수점이 나올 수 있기 때문에 Double로 return을 한다.
연산하는 값을 담을 변수를 Double 로 만들어 주고 
switch 문을 만들어서 각 연산자에 맞게 연산식을 넣어 준다. 
다 넣어준 후 switch 문을 닫고 그 밑으로 return하여 준다.
let sum = Arithmetic.addition
ㄴ sum에 enum Arithmetic에 addition을 넣어준것 그래서
sum.math(num1: 2, num2: 3) 이것을 풀어 보면
Arithmetic.addition.math(num1: 2, num2: 3) 이게 된다.
```
# + celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의 각 케이스에는 Double 타입의 Associated Value 를 받도록 함 추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
```
섭씨 = (화씨 - 32) * 5 / 9
섭씨 = 켈빈 + 273
enum Temperature {
  // 코드
}
```
```swift
enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double {
        var b: Double = 0.0
        switch self{
        case let .celcius(a):
            b = (a)
        case let .fahrenheit(a):
            b = (a - 32) * 5 / 9
        case let .kelvin(a):
            b = (a + 273)
        }
        return b
    }
}
let tem = Temperature.fahrenheit(100.2)
tem.toCelcius()
```
```
* 이해
화씨에서 섭씨로 변환하는 부분에 식을 보면 충분히 Double 타입이 예상되기에 
Double 타입으로 선언해서 진행 하였다. 
각 온도 부분에서도 Double타입을 명시해 주었고 
let tem = Temperature.fahrenheit(100.2) 상수 선언
위 처럼 상수가 선언이 되었기 때문에 
switch self 의 self는 .fahernheit 가 된다.
그래서 case let .fahrenheit(a) 부분이 실행되는 것이다.
```
# + 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현
```swift
let someThing = { (word: String) -> Int in
    return word.count
}
someThing("shoocream")
```
# + 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
```swift
let soloNumber = {(soling: Int) -> Int in
    let a: Int = 1
    return a + soling
    
}
soloNumber(3)

let Solo = { crystal in
    return crystal + 1
}
Solo(5)
```
# + 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
```swift
let alone = { (numbering: Int) -> Bool in
    return numbering % 2 == 0
}
alone(5)
```
# + 정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져
```swift
let twin = { (nop1: Int, nop2: Int) -> Int in
    return nop1 * nop2
}
twin(4,2)

let twobro: (Int, Int) -> Int = { $0 * $1 }
twobro(4,5)
```
# + 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기
```swift
// 오름차순 여부
let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}

( { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

saomeClosure("C","B")
```

```swift
// 배열 요소의 개수를 반환
let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}

({ (values: [Int]) -> Int in
    values.count
})

otherClosure([4,5,6])
```
<img width="483" alt="53207a479c06c092" src="https://user-images.githubusercontent.com/62827163/79853526-25abb600-8403-11ea-9c83-dffed39b48f8.png">

```swift
class Animal {
    var brain = true
    var legs: Int
    
    final var life = "살아있다."
    
    init(legs: Int) {
        self.legs = legs
    }
    
    func bark() {
        print("목소리")
    }
}

let animal = Animal(legs: 4)
animal.bark()
animal.legs
animal.brain

class Human: Animal {
    var mad: String

    override var legs: Int {
        get { super.legs }
        set { super.legs = newValue }
    }
    
    override func bark() {
        print("저는 사람입니다.")
    }
    
    init(legs: Int, mad: String = "정상인") {
        self.mad = mad
        super.init(legs: legs)
    }
}

let human = Human(legs: 2)
human.legs
human.bark()
human.mad
human.life

class Pet: Animal {
    var cute: String
    
    override var legs: Int {
        get { super.legs }
        set { super.legs = newValue }
    }
    
    override func bark() {
        print("barkbark")
    }
    
    init(legs: Int, cute: String = "다귀여워"){
        self.cute = cute
        super.init(legs: legs)
    }
}

let pet = Pet(legs: 4)
pet.legs
pet.bark()
pet.cute
pet.life
pet.brain

class Cat: Pet {
    var color: String
    
    init(color: String = "하얀이", legs: Int, cute: String ){
        self.color = color
        super.init(legs: legs, cute: cute)
    }
    override func bark() {
        print("이아야야야야야오옹오~")
    }
}

let cat = Cat(legs: 4, cute: "귀요미")
cat.cute
cat.bark()
cat.life
cat.color
cat.brain

class Dogs: Pet {
    var color: String
    var origin: String
    
    init(color: String = "초코", origin: String = "Husky", legs: Int, cute: String) {
        self.color = color
        self.origin = origin
        super.init(legs: legs, cute: cute)
    }
    
    override func bark() {
        print("왈왈왈왈와로아롸왕롸왕왈왈")
    }
}

let dog = Dogs(legs: 4, cute: "핵귀여워")
dog.bark()
dog.cute
dog.legs
dog.origin
dog.color
```
![3_](https://user-images.githubusercontent.com/62827163/79967992-8651f600-84ca-11ea-9fd9-747c8d2c9564.png)
```swift
class figure {
    
    var s = 5.0
    var w = 5.0
    var l = 5.0
    var r = 2.5
    var b = 5.0
    var h = 3.0
    var a = 10.0
    
    
    lazy var square = "사각형의 넓이, 둘레"
    var squareAnswer: String {
        return "사각형의 넓이는\(s * s), 사각형의 둘레는 \(4 * (s))"
    }
    
    lazy var rectangle = "직사각형 둘레, 넓이"
    var rectangleAnswer: String {
        return "직사각형의 둘레는 \(2 * l + 2 * w), 직사각형의 넓이는\(l * w)"
    }
    
    lazy var circle = "원의 넓이, 원 둘레"
    var circleAnswer: String {
        return "원의 넓이는 \(3.14 * ( r * r )), 원둘레는 \(2 * 3.14 * r)"
    }
    
    lazy var triangle = "삼각형의 넓이"
    var triangleAnswer: String {
        return "삼각형의 넓이는 \( ( 1 / 2 ) * b * h )"
    }
    
    lazy var trapezoid = "사다리꼴의 넓이"
    var trapezoidAnswer: String {
        return "사다리꼴의 넓이는 \( ( 1 / 2 ) * h * ( a + b ) )"
    }
    
    lazy var cube = "큐브의 부피"
    var cubeAnswer: String {
        return "큐브의 부피는 \( s * s * s )"
    }
    
    lazy var rectangularSolid = "직사각형 큐브의 부피"
    var retangularSolidAnswer: String {
        return "직사각 큐브의 부피는 \( w * l * h )"
    }
    
    lazy var circularCylinder = "원기둥의 부피"
    var circularCylinderAnswer: String {
        return "원기둥의 부피는 \( 3.14 * ( r * r ) * h ) "
    }
    
    lazy var sphere = "구의 부피"
    var sphereAnswer: String {
        return "구의 부피는 \( ( 4 / 3 ) * 3.14 * ( r * r * r ) )"
    }
    
    lazy var cone = "원뿔의 부피"
    var coneAnswer: String {
        return "원뿔의 부피는 \( ( 1 / 3 ) * 3.14 * ( r * r ) * h )"
    }
}

let figurePrice = figure()

figurePrice.square
figurePrice.squareAnswer

figurePrice.rectangle
figurePrice.rectangleAnswer

figurePrice.circle
figurePrice.circleAnswer

figurePrice.triangle
figurePrice.triangleAnswer

figurePrice.trapezoid
figurePrice.trapezoidAnswer

figurePrice.cube
figurePrice.cubeAnswer

figurePrice.rectangularSolid
figurePrice.retangularSolidAnswer

figurePrice.circularCylinder
figurePrice.circularCylinderAnswer

figurePrice.sphere
figurePrice.sphereAnswer

figurePrice.cone
figurePrice.coneAnswer
```

# + 1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
* e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2

```swift
func inNumber(_ num: Int) -> Int {
    var sum = 0
    if num <= 0 {
        for i in 0...abs(num) {
            sum += i
        }
        sum *= -1
        sum += 1
    } else {
        for i in 0...num {
            sum += i
        }
    }
    return sum
}

inNumber(5)
inNumber(-2)
```
```
* 이해
양수의 값은 1부터 차례대로 들어가서 더하기한 값을 나타내주면 되겠죠?
for 구문을 활용하면 되겠죠?
음수의 값이 문제가 있는데 ... 이때 음수의 값을 양수값으로 바꿔주는 
abs라는 것을 활용해서 반복되는 횟수를 정해주는 것이 매우 좋습니다.
위의 식에서 보이죠!
그럼 양수처럼 똑같이 원하는 값까지 차례대로 들어가서 값을 더하는 반복을 하고 
나온 값을 다시 음수로 만들어 주고 !! 여기서 중요한게 기준이 되는 값이 
1이라는 양수가 있다는 것이죠 ! 그래서 +1을 해주면 됩니다!
```