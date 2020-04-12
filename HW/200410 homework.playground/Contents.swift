import UIKit

var str = "200410 homework"

/*:
 - 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
 */

func hello(name: String, age: Int){
    print("안녕!" + name + "입니다.")
    print("나이는", age, "살 입니다.")
}

hello(name:"안준영", age:32)

/*:
 - 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
*/

func num(n: Int) -> Bool{
   return n%2 == 0 ? true : false
}

num(n:4)

print("2의 배수를 찾자")

0...100

for index in 1...5 {
  print("\(index) 이면 \(index%2 == 0)")
}

/*:- 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
*/

func number(x: Int = 10, y: Int ){
    print(x * y)
}

number(y:2)

/*:- 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
*/


func aver(score1: Int, score2: Int, score3: Int, score4: Int){
    let average = (score1+score2+score3+score4)/4
    print(average)
}
aver(score1: 1, score2: 2, score3: 4, score4: 5)

/*:- 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
*/

func grade(_ g1: Int, _ g2: Int, _ g3: Int, _ g4: Int){
    
    let sum = (g1+g2+g3+g4)
    
    if sum >= 90 {
        print("A")
    }
    else if sum >= 80 {
        print("B")
    }
    else if sum >= 70 {
        print("C")
    }
    else {
        print("F")
    }
}

grade(10, 20, 10, 40)

/*:- 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
 */

func arithmeticAverage(_ numbers: Double...) -> String {
  var total = 0.0
  for number in numbers {
    total = total + number
  }
    let oops = total / Double(numbers.count)
    
    if oops >= 90 {
       return "A"
    } else if oops >= 80 {
        return "B"
    } else if oops >= 70 {
        return "C"
    } else {
        return "F"
    }
    
}

arithmeticAverage(44.4, 21.3, 22.5)
