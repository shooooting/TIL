# TIP

[Button, Textfield, Label](https://www.notion.so/shooooting/label-text-button-15a4c8b9e147453689e1b44725989fe5)
```swift
func textField(for text: UITextField, title: String, frame: CGRect) {
        text.frame = frame
        text.placeholder = "적어봐"
        text.borderStyle = .roundedRect
        text.center = view.center
        view.addSubview(text)
    }
    
func buttonNextGo(for button: UIButton, title: String, frame: CGRect) {
        button.frame = frame
        button.setTitle("GO Next Page", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(goNextPage(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

func inToLabel(for label: UILabel, title: String, frame: CGRect) {
        label.frame = frame
        label.backgroundColor = .red
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        view.addSubview(label)
    }
    
    let textInBox = UITextField()
    let goButton = UIButton()
		let labelInText = UILabel()

override func viewDidLoad() {
        super.viewDidLoad()
        
        UI()
    }
    
    func UI() {
        let textFrame = CGRect(x: 50, y: 50, width: 300, height: 40)
        textField(for: textInBox, title: "", frame: textFrame)
        
        let buttonFrame = CGRect(x: 40, y: 200, width: 300, height: 40)
        buttonNextGo(for: goButton, title: "GO Next Page", frame: buttonFrame)

				let labelFrame = CGRect(x: 30, y: 100, width: 300, height: 50)
        inToLabel(for: labelInText, title: "", frame: labelFrame)
    }
```
