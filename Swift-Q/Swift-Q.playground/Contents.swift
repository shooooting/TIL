
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
