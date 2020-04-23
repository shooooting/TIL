# 200423
## 문제

```swift
import UIKit

class ViewController: UIViewController {
    
    //label 하나 button 하나 만들고 UI
    // count를 하나 만들어서 버튼을 누를때마다 숫자가 올라가도록 구현
    
    var label = UILabel() // Label 구현
    var sumButton = UIButton(type: .system) // Button 구현
    var a: Int = 0 // Label 안의 변화하는 변수 선언
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //x가로 위치 y세로 위치 width대상넓이 height대상높이
        label.text = "0" // label 안에 들어가는 문자
        label.center = view.center // 화면에서 센터 맞추기
        label.textAlignment = .center // text가운데 정렬
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        //font
        view.addSubview(label)//화면에 보여주기
        
        sumButton.frame = CGRect(x: 0, y: 550, width: 400, height: 100)
        sumButton.backgroundColor = .yellow // 배경색 지정
        sumButton.setTitle("더하자", for: .normal) // 버튼안에 글자넣기
        sumButton.addTarget(self, action: #selector(sumButton1), for: . touchUpInside)
        //액션을 할 대상, 어떤 액션인지, 마지막으로 어떤 동작인지.
        view.addSubview(sumButton)
        }
    
    @objc func sumButton1(sender: UIButton) {
        // @objc는 함수를 사용시 무조건 붙여주는 거 같다. 
        a += 1
        
        label.text = "\(a)"
        label.backgroundColor = .yellow
    }

```
## 과제
```swift
import UIKit

class ViewController: UIViewController {
    
    var label = UILabel()
    var sumButton =  UIButton()
    var subButton = UIButton()
    var index: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.text = "0"
        label.center = view.center
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        view.addSubview(label)
        
        sumButton.frame = CGRect(x: 0, y: 355, width: 100, height: 100)
        sumButton.backgroundColor = .blue
        sumButton.setTitle("더하기", for: .normal)
        sumButton.addTarget(self, action: #selector(sumButton1), for: .touchUpInside)
        view.addSubview(sumButton)
        
        subButton.frame = CGRect(x: 280, y: 355, width: 100, height: 100)
        subButton.backgroundColor = .red
        subButton.setTitle("빼기", for: .normal)
        subButton.addTarget(self, action: #selector(subButton1), for: .touchUpInside)
        view.addSubview(subButton)
    }
    
    @objc func sumButton1(sender: UIButton) {
        index += 1
        label.text = "\(index)"
        label.backgroundColor = .blue
    }
    
    @objc func subButton1(sender: UIButton) {
        index -= 1
        label.text = "\(index)"
        label.backgroundColor = .red
    }
}
```