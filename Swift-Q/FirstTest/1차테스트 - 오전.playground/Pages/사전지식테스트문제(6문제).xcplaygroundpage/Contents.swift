//: [Previous](@previous)

/*
 "Hello, World!" 문자열을 출력하기 위한 코드 작성
 */
print("Hello, World!")


/*
 2개의 정수를 입력 받아서 그 숫자들을 더한 뒤 결과를 정수로 반환하는 함수 작성
 */

func sum(a: Int, b: Int) {
    _ = a + b
}

sum(a: 3, b: 4)


/*
 2개의 정수를 입력 받아 그 숫자들을 곱한 뒤 결과값을 문자열로 반환하는 함수 작성
 */

func numberForText(a: Int, b: Int) -> String {
    let multi = a * b
    return "두 수를 곱한 값은 \(multi) 야"
}

numberForText(a: 4, b: 6)

/*
 주어진 숫자가 짝수인지 홀수인지 판단하는 함수 작성 (switch 문으로 해결)
 */

func numberIsAlone(a : Int) {
    switch a % 2 {
    case 0:
        "짝수"
    default:
        "홀수"
    }
}
numberIsAlone(a : 4)

/*
 Swift 3가지 다른 반복문 방식별로 각각 1부터 10까지 값을 더한 결과를 출력하는 코드 작성
 */

var sum = 0
for i in 1...10 {
    sum += i
}
sum

var a = 1
sum = 0
while a <= 10 {
    sum += a
    a += 1
}
sum

a = 1
sum = 0
repeat {
    sum += a
    a += 1
} while a <= 10
sum

/*
 Swift 에서 사용하는 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지,
 그리고 그 특징에 대해 설명
 */

/*
 Pascal Case :
 처음 시작을 대문자로 시작하고 이후 각 단어의 첫 글자마다 대문자로 작성한다.
 예를 들어서 ViewController, Int, String 등
 
 Camel Case :
 처음 시작을 소문자로 시작하고 그 이후에 나오는 각 단어의 첫 글자는 대문자로 작성한다.
 예를 들어서 viewWillAppear(), viewDidLoad() 등
 
 */



/*
 사전 지식 테스트 때 위 내용들을 제대로 푸신 분이 거의 없었는데
 지금은 대부분 많이 쉽죠?
 그만큼 많이 발전하셨습니다. :)
 */

//: [Next](@next)
