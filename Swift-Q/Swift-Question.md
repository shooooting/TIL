
## + 1에서 5까지 reversed 같은 메서드를 쓰지 않고 역순으로 출력되게 하는 함수

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

## + 이름을 입력 값으로 받아서 출력하는 함수 (기본 형태)
```swift
func print(name: String) {
    print(name)
}

print(name:"안준영")
```

## + 나이를 입력 값으로 받아서 출력하는 함수 (Argument Label 생략)
```swift
func years(_ age: Int) {
    print(age)
}

years(32)
```

## + 이름을 입력 값으로 받아 인사말을 출력하는 함수 (Argument Label 지정)
```swift
func hello(to name: String) {
    print(name)
}

hello(to:"준영")
```
## + 아래의 if - else if - else 문을 switch 문으로 바꿔보세요.
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

## + 어떤 숫자가 주어졌을 때 짝수인지 홀수인지 출력 (switch의 where 절 이용)
```swift
let math = 4
switch math {
case let x where x%2 == 0 :
    print("짝수")
default:
    print("홀수")
}
```
## + for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현
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
