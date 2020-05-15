# AutoRayout

 
 ```swift
 let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInsets = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.frame.width - padding - horizontalInsets) / 2 - margin
        
        let box1Frame = CGRect(x: safeLayoutInsets.left + margin, y: yOffset, width: viewWidth, height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin))
        inToView(for: box1, frame: box1Frame)
        
        let box2Frame = CGRect(x: box1.frame.maxX + padding, y: yOffset, width: viewWidth, height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin))
        inTheView(for: box2, frame: box2Frame)
 ```
![image](https://user-images.githubusercontent.com/62827163/82026363-9d50c600-96cd-11ea-8e07-915620c802d7.png)

![image](https://user-images.githubusercontent.com/62827163/82026245-75f9f900-96cd-11ea-8361-23574d7ff6a3.png)