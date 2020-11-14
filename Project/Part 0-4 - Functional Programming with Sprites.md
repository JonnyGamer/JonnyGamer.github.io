# **Part 0-4 - Functional Programming with Sprites**

- Super Touchable
- Zooming a Scene
- Sleek Nodes

---
## **Super Touchable**

```swift
protocol SuperTouchable {
    var touchBegan: () -> () { get set }
    var touchEnd: () -> () { get set }
}

class WhateverNode: SKNode, SuperTouchable {
    var touchBegan: () -> () = {}
    var touchEnd: () -> () = {}
}

extension Array where Element == SKNode {
    func touchBegan() {
        _ = map {
            ($0 as? SuperTouchable)?.touchBegan()
        }
    }
    func touchEnd() {
        _ = map {
            ($0 as? SuperTouchable)?.touchEnd()
        }
    }
}
```


---
## **Sprites in Action**

Here's an extremely simple example. (Later, I'll show an example using $0)

The following is how I could have created the zoom-in button:

```swift
func begin() {

    // Zoom-in code
    let plus = SKLabelNode(text: "+")
    this.addChild(plus)
    plus.touchBegan = {
        self.pinch(1.1)
    }
    // End of Zoom-in code

}

mutating func touchBegan(_ pos: CGPoint,_ nodes: [SKNode]) {
    nodes.touchBegan()
}
```

I love this application, because all the zoom-in related code is in one place, instead of in multiple places.

---
## **Sleek Nodes**

```swift
extension SKNode {
    @discardableResult
    func `do`(_ this: (Self) -> ()) -> Self {
         this(self); return self 
    }
}
```

Using this `do` method, I could have coded something like this:


```swift
let plus = FlowBox.Text(["+"])
plus.do {
    $0.position = .init(x: 20, y: selecto.frame.maxY + 20)
    $0.name = "plus"
    $0.zPosition = 10000
    $0.touchBegan = {
        $0.color = .gray
        $0.run(.wait(forDuration: 0.2)) { 
            $0.color = .black 
        }
        self.pinch(1.1)
    }
}
```

Unfortunately I didn't code it like this. Maybe I'll change it to this in the future.

---