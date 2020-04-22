
/*: 1에서 5까지 reversed 같은 메서드를 쓰지 않고 역순으로 출력되게 하는 함수
 */

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

/*: 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
*/

func print(name: String) {
    print(name)
}

print(name:"안준영")

/*: 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
 */

func years(_ age: Int) {
    print(age)
}

years(32)

/*: 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
 */

func hello(to name: String) {
    print(name)
}

hello(to:"준영")

/*: 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
 */

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

/*: 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
 */

let math = 4
switch math {
case let x where x%2 == 0 :
    print("짝수")
default:
    print("홀수")
}

/*: for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
 */
let down = 3
var answer = 1

for _ in 1...10 {
    answer *= down
}

print(answer)

/*: 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수
 */
func soso(number: Int) {
    var i = 1
    while i <= 9 {
        print("\(number) * \(i) = \(number * i)")
        i += 1
    }
}
soso(number: 2)

/*: 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
 */

func solidNumber(num: Int) {
    var i = 1
    var o = 0
    repeat {
        o += i
        i += 1
    } while i <= num
}

solidNumber(num: 5)

/*: 2개의 정수를 입력받아 Modulo 연산(%)의 결과를 반환하는 함수를 만들되 2번째 파라미터와 결과값의 타입은 옵셔널로 정의. 두 번째 파라미터 입력값으로 nil 이나 0이 들어오면 결과로 nil을 반환하고, 그 외에는 계산 결과 반환
 */

func optional(op1: Int, op2: Int?) -> Int? {
    guard let op2 = op2, op2 != 0 else { return nil }
    return op1 % op2
}

optional(op1: 10, op2: 5)


func Number(num: String) {
    print(num)
}

var myNum: String? = nil
if let name = myNum {
        print(name)
}

var height: Int? = 170
if let landing = height {
    if landing >= 160 {
        print("그래도 160은 넘지")
    }
}

var weight: Int? = nil
if let pig = weight {
    if pig == pig, pig >= 70 {
        print("살 좀 빼자")
    }
}

/*: 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수
*/

func soNumber(num: Int) {
    var i = 1
    var e = 0
    
    repeat {
        e += i
        i += 1
    } while i <= num
    print(e)

}

soNumber(num: 10)

/* 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

func combineString(str1: String?, str2: String?, str3: String?) -> String {
  // code
}

// 입력 예시 및 결과
combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"
*/

func combineString(str1: String?, str2: String?, str3: String?) -> String {
    let show1 = str1 ?? ""
    let show2 = str2 ?? ""
    let show3 = str3 ?? ""
    
    let sumShow: String = show1 + show2 + show3
    return sumShow
    
}

//combineString(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
combineString(str1: "AB", str2: nil, str3: "EF")    // "ABEF"

    /*: 2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
    enum Arithmetic {
      case addition, subtraction, multiplication, division
    }*/

//enum Arithmetic {
//    case addition, subtraction, multiplication, division
//
//    func soNumber(num1: Int, num2: Int) -> Double {
//        var answer: Double = 0.0
//        switch self {
//        case .addition:
//            answer = Double(num1 + num2)
//        case .subtraction:
//            answer = Double(num1 - num2)
//        case .multiplication:
//            answer = Double(num1 * num2)
//        case .division:
//            answer = Double(num1 / num2)
//        }
//        return answer
//    }
//}
//
//let a = Arithmetic.addition
//a.soNumber(num1: 2, num2: 4)

/*[ 도전 과제 ]
//1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
//각 케이스에는 Double 타입의 Associated Value 를 받도록 함
//
//추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
//섭씨 = (화씨 - 32) * 5 / 9
//섭씨 = 켈빈 + 273
//
//enum Temperature {
//  // 코드
}*/

enum Temperature {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double {
        switch self {
        case let .celcius(a):
            return a
        case let .fahrenheit(a):
            return (a - 32) * 5 / 9
        case let .kelvin(a):
            return (a + 273)
        }
    }
}

let temper = Temperature.fahrenheit(100.2)
temper.toCelcius()

func combineString1(str1: String?, str2: String?, str3: String?) -> String {
    let numbering1 = str1 ?? ""
    let numbering2 = str2 ?? ""
    let numbering3 = str3 ?? ""
    
    let sumSummary = numbering1 + numbering2 + numbering3
    return sumSummary
    
}

// 입력 예시 및 결과
combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
//combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"


/*: 2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
  case addition, subtraction, multiplication, division
}*/

enum Rithmetic {
    case addition, subtraction, multiplication, division
    
    func Number(no1: Int, no2: Int) -> Double {
        var sumthing: Double = 0.0
        switch self {
        case .addition:
            sumthing = Double(no1 + no2)
        case .subtraction:
            sumthing = Double(no1 - no2)
        case .multiplication:
            sumthing = Double(no1 * no2)
        case .division:
            sumthing = Double(no1 / no2)
        }
        return sumthing
    }
}

let sum = Rithmetic.addition
sum.Number(no1: 5, no2: 2)

/*[ 도전 과제 ]
//1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
//각 케이스에는 Double 타입의 Associated Value 를 받도록 함
//
//추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
//섭씨 = (화씨 - 32) * 5 / 9
//섭씨 = 켈빈 + 273
//
//enum Temperature {
//  // 코드
}*/

enum Temperature1 {
    case celcius(Double), fahrenheit(Double), kelvin(Double)
    
    func toCelcius() -> Double {
        switch self {
        case let .celcius(x):
            return(x)
        case let .fahrenheit(x):
            return (x - 32) * 5 / 9
        case let .kelvin(x):
            return x + 273

        }
    }
    
}


let so = Temperature1.fahrenheit(99.2)
so.toCelcius()

enum Ithmetic {
    case addition, subtraction, multiplication, division

    func math(num1: Int, num2: Int) -> Double {
        var a: Double = 0.0
        switch self {
        case .addition:
             a = Double(num1 + num2)
        case .subtraction:
             a = Double(num1 - num2)
        case .multiplication:
             a = Double(num1 * num2)
        case .division:
             a = Double(num1 / num2)
        }
        return a
    }
}

let som = Ithmetic.subtraction
som.math(num1: 2, num2: 4)

/*: 문자열을 입력받으면 그 문자열의 개수를 반환하는 클로져 구현
 */

let someThing = { (word: String) -> Int in
    return word.count
}
someThing("shoocream")

/*: 숫자 하나를 입력받은 뒤 1을 더한 값을 반환하는 클로져 구현
 */

let soloNumber = {(soling: Int) -> Int in
    let a: Int = 1
    return a + soling
    
}
soloNumber(3)

let Solo = { crystal in
    return crystal + 1
}
Solo(5)

/*: 정수를 하나 입력받아 2의 배수 여부를 반환하는 클로져
 */

let alone = { (numbering: Int) -> Bool in
    return numbering % 2 == 0
}
alone(5)

/*: 정수를 두 개 입력 받아 곱한 결과를 반환하는 클로져
 */

let twin = { (nop1: Int, nop2: Int) -> Int in
    return nop1 * nop2
}
twin(4,2)

let twobro: (Int, Int) -> Int = { $0 * $1 }
twobro(4,5)

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//구현 내용은 자유롭게
//** 강아지 (Dog)
//- 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기

class Dog {
    var name = "진호"
    var age = 4
    var weight = 12
    var species = "치와와"
    
    func bark() {
        print("Bow?Wow!!!Wal!!Wal!!!")
    }
    
    func eat() {
        print("yamyamchabchab")
    }
}

let dog1 = Dog()
dog1.bark()

//** 학생 (Student)
//- 속성: 이름, 나이, 학교명, 학년
//- 행위: 공부하기, 먹기, 잠자기

class Student {
    var name = "안준영"
    var age = 32
    var school = "fastcampus"
    var grade = 1
    
    func study() {
        print("공부중")
    }
    
    func eat() {
        print("뭐먹을래?")
    }
    
    func sleep() {
        print("모르겠고 잘란다.")
    }
}

let student1 = Student()
student1.sleep()

//** 아이폰(IPhone)
//- 속성: 기기명, 가격, faceID 기능 여부(Bool)
//- 행위: 전화 걸기, 문자 전송

class Iphone {
    var model: String
    var price: Int
    var faceID: Bool
    
    init(_ model: String, _ price: Int, _ faceID: Bool) {
        self.model = model
        self.price = price
        self.faceID = faceID
    }
    
    func calling() {
        print("What up ~")
    }
    
    func msg() {
        print("ㅇㄷ")
    }
}

let phon = Iphone("iPhoneX", 1330000, true)
phon.msg()

//** 커피(Coffee)
//- 속성: 이름, 가격, 원두 원산지

class Coffee {
    var name: String
    var price: Int
    var beans: String
    
    init(_ name: String, _ price: Int, _ beans: String) {
        self.name = name
        self.price = price
        self.beans = beans
    }
    
    func hotAndIce() {
        print("차가운 걸로 드릴까요?")
    }
}

let cofee = Coffee("바리스타룰스", 2000, "에티오피아")
cofee.hotAndIce()

//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
//** 계산기 (Calculator)
//- 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
//ex)
//let calculator = Calculator() // 객체생성
//
//calculator.value  // 0
//
//calculator.add(10)    // 10
//calculator.add(5)     // 15
//
//calculator.subtract(9)  // 6
//calculator.subtract(10) // -4
//
//calculator.multiply(4)   // -16
//calculator.multiply(-10) // 160
//
//calculator.divide(10)   // 16
//calculator.reset()      // 0

class Calculator {
    var calcul = 0
    
    func add(_ input: Int) {
        calcul += input
        print(calcul)
    }
    
    func subtract(_ sub: Int) {
        calcul -= sub
        print(calcul)
    }
    
    func multiply(_ mul: Int) {
        calcul *= mul
        print(calcul)
    }
    
    func divide(_ div: Int) {
        calcul /= div
        print(calcul)
    }
    
    func reset() {
        calcul = 0
        print("최기화 되었습니다.")
    }
}

let calculator = Calculator()
calculator.add(10)
calculator.add(5)

calculator.subtract(9)
calculator.subtract(10)

calculator.multiply(4)
calculator.multiply(-10)

calculator.divide(10)
calculator.reset()

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
