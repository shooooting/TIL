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