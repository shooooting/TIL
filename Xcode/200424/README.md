# 200424
## 문제
```
문제: UISwitch, UISegmentedControl 을 이용한 문제
- UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
- UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함
```
```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setSwitch()
        setSegmentedControl()
        
    }
    
    func setupBox(for label: UILabel, title: String, frame: CGRect) {
        label.text = title
        label.frame = frame
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = .black
        view.addSubview(label)
    }
    
    let switchLabel = UILabel()
    
    func setSwitch() {
        let onOffSwitch = UISwitch()
        onOffSwitch.frame.origin = CGPoint(x: 165, y: 180)
        onOffSwitch.addTarget(self, action: #selector(toggleOnOffText), for: .valueChanged)
        view.addSubview(onOffSwitch)
        
        let frame = CGRect(x: 140, y: 220, width: 100, height: 30)
        setupBox(for: switchLabel, title: "Off", frame: frame)
    }
    
    @objc func toggleOnOffText(_ sender: UISwitch) {
        switchLabel.text = sender.isOn ? "On" : "Off"
    }
    
    
    let selectSegmentedLabel = UILabel()
    
    func setSegmentedControl() {
        let segmentedControl = UISegmentedControl(items: ["Dog", "Cat", "Bird"])
        segmentedControl.frame = CGRect(x: 115, y: 300, width: 150, height: 30)
        segmentedControl.addTarget(self, action: #selector(showSelectTitle(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)
        
        let frame = CGRect(x: 140, y: 350, width: 100, height: 30)
        setupBox(for: selectSegmentedLabel, title: "None", frame: frame)
    }
    
    @objc func showSelectTitle(_ sender: UISegmentedControl) {
        let num = sender.selectedSegmentIndex
        let title = sender.titleForSegment(at: num)
        selectSegmentedLabel.text = title
    }


}
```