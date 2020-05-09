# Navigation Controller

Code로 NavigationController를 사용하려면 우선 SceneDelegate 에서 설정을 해줘야 한다. 

### SceneDelegate

```swift

func scene(_ scene: UIScene, willConnectTo session: UISceneSession, 
options connectionOptions: UIScene.ConnectionOptions) {
guard let windowScene = (scene as? UIWindowScene) else {return}

	window = UIWindow(windowScene: windowScene)
	let vc = ViewController()
	let navigationController = UINavigationController(rootViewController: vc)

	navigationController.navigationBar.prefersLargeTitles = true

	window?.rootViewController = navigationController
	window?.backgroundColor = .systembackgorund
	window?.makeKeyAndVisible()
}
```

위와 같은 구문을 적어야 한다. 

```swift
navigationController.navigationBar.prefersLargeTitles = true
```

이 부분은 Prefers Large Title 이라는 기능을 활성화시킨다.

Prefers Large Title 기능을 활성화 시키면 Title의 위치가 변화하면서 화면을 전환 하였을때 효과도 변화가 생긴다. 

### ViewController

```swift
//ViewController.swift

lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .never
        
        title = "FirstVC"
//        navigationItem.title = "FirstVC2"
        
        let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))
        
        let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushViewController(_:)))
        
        navigationItem.rightBarButtonItems = [ barButtonItem, barButtonItem2, barButtonItem3 ]
        
    }
    
    @objc private func pushViewController(_ sender: Any){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
```

### viewController / prefersLargeTitle

```swift
navigationController?.navigationBar.prefersLargeTitles = true  //viewController 안에 사용하면 해당 viewController만 Title이 적용된다.
navigationItem.largeTitleDisplayMode = .never // viewController에서의 prefers Large Title의 기능을 조절하게 된다. .never는 사용하지 않겠다는 것이다.
																							// .never / .automatic / .always 3가지 종류가 있다.
```

### viewController / title

```swift
title = "FirstVC" // title의 이름을 지정해 준다. 
navigationItem.title = "FirstVC2" // title을 좀 더 명확하게 지정해주는 효과이다.
```