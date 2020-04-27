# 200427
## 문제
```
문제: 3개의 뷰 컨트롤러 사이에 화면 전환하기
     A는 B로 가는 버튼
     B는 A로 돌아가는 dismiss 버튼과 C로 가는 버튼
     C는 A 또는 B로 돌아가는 dismiss 버튼

(참고)
A -> B   
  <- B -> C
     B <- C
A   <-    C
```

```swift
// 우선 뷰컨트롤러를 2개 더 만들어 준다.
// 오른쪽 Navigator 창의 제목폴더의 오른쪽 버튼을 눌러 New File > CoCoa Touch Class > subclass of: 를 UIViewController 로 지정하고 원하는 이름으로 ViewController 파일을 2개 더 만들어 준다. 

import UIKit
//첫번째 ViewController 파일이다.
class ViewController: UIViewController {
    
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        button.setTitle("go Second", for: .normal) // 2번째로 가는 버튼
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc private func didTapButton(_ sender: UIButton) {
        let secondVC = SecondViewController()
        present(secondVC, animated: true)
    }

}

import UIKit
// 두번째 ViewController 파일이다.
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        let button = UIButton(type: .system)//세번째로 가는 버튼
        button.setTitle("go Third", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let buttonBack1 = UIButton(type: .system)//첫번째로 돌아가는 버튼
        buttonBack1.setTitle("go first", for: .normal)
        buttonBack1.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        buttonBack1.sizeToFit()
        buttonBack1.center = CGPoint(x: 190, y: 450)
        buttonBack1.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
        view.addSubview(buttonBack1)
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let thirdVC = ThirdViewController()
        present(thirdVC, animated: true)
    }
    
    @objc private func didTapButton2(_ sender: UIButton) {
        _ = ViewController()
        dismiss(animated: true) //dismiss로 열었던 것을 닫는 버튼
    }

}

import UIKit
//세번째 ViewController 파일이다. 
class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let button = UIButton(type: .system)// 첫번째로 가는 버튼
        button.setTitle("go first", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        let backToSecond = UIButton(type: .system)//두번째로 가는 버튼
        backToSecond.setTitle("go Second", for: .normal)
        backToSecond.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        backToSecond.sizeToFit()
        backToSecond.center = CGPoint(x: 190, y: 450)
        backToSecond.addTarget(self, action: #selector(didTapButton2(_:)), for: .touchUpInside)
        view.addSubview(backToSecond)
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        presentingViewController?.presentingViewController?.dismiss(animated: true)
    }//presentingViewController를 2번 Optional타입으로 선언해서 없애줌.
    //진행중인뷰컨트롤을 2개를 없앤다 이런 의미 !
    
    @objc private func didTapButton2 (_ sender: UIButton) {
        _ = SecondViewController()
        dismiss(animated: true)// 2번째로 가는 버튼
    }

}


```