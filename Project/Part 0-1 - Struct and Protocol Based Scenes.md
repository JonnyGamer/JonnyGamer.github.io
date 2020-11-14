# **Part 0-1 - Struct and Protocol Based Scenes**


The following contains a detailed desciption on how I got this app started and running.

- Why Protocols and Structs? - An Explanation
- Custom SKScene Subclass - Custom SKScene type
- Hostable Protocol - Using struct and protocol instead of class
- View Controller - Presenting my app
- Scene init method - Creating my scene
- Hosting a Scene - Hosting the struct (A SKNode wrapper)
- Using the SKScene methods - How I attach Apple methods to my methods.

---
## **Why Protocols and Structs?**

SpriteKit is a popular framework to easily create games. It uses `class` and Object Oriented Programming (OOP) taking advantage of references. One the one hand, OOP has many uses (especially in SpriteKit), however there is one part that annoys me quite a bit. When it comes to scenes, I would like to make them values (aka `structs`). Why? It is much easier for me. Keeping track of references is hard, and if I can reduce scene references, it would greatly reduce the complexity of my project. It also reminds me of SwiftUI, which basically has struct based scenes, or views. One goal for this project was to create a SwiftUI, somewhat declarative, value based, SpriteKit app. I have attempted this before a while ago, without success, but I am older and wiser now. So this is my 2nd attempt.

Protocols act like the struct/value version of subclassing, which is why protocols are required for use in a struct based app. All my view structs will conform to my `Hostable` protocol.


---
## **Custom SKScene Subclass**

```swift
class Scene: SKScene {
    var host: Hostable = Host()
}
```
- I created a SKScene subclass. This will be my main root scene from which everything is hosted on. I will only be instantiating it once, and I will not be initializing more and presenting them using Apple's presentation methods, as you will see very soon.
- The `host` attribute is of generic type `Hostable`. This is my protocol that certain structs will be conforming to. As you can see, my `Host()` object is a struct that conforms to `Hostable`.


---
## **Hostable protocol**

```swift
protocol Hostable {
    var that: SKNode { get set }
    var this: SKNode { get set }
    init()
    func begin()
    func update()
    mutating func touchBegan(_ pos: CGPoint,_ nodes: [SKNode])
    mutating func touchMoved(_ moved: CGVector)
    mutating func touchEnded(_ pos: CGPoint,_ nodes: [SKNode])
    mutating func reset()
}
```

- `this` and `that` - These are the 2 `SKNode` objects that act like a `SKScene`. Why do I have 2 and not 1? I started out with only `this`, but then I added `that` later. I will explain why later.
- Note that I'm copying many methods from `SKScene`

- `func begin()` - This is the method that gets called when `this` and `that` get added (or presented) to the root scene.
- `func update()` - This is the method that gets called every frame. The root scene calls this method in its own update method.
- `touchBegan` and `touchEnded` are self explanatory.
   - The `pos` parameter is the location of the touch.
   - The `nodes` parameter contains all the touched nodes.
- `touchMoved` is also self explanatory.
   - The `moved` parameter is the change in position of your finger. I use this method to scroll.
- `func reset()` - This method gets called when a scene is re-presented.
- Why mutating methods? This is because I might be changing certain attributes of the struct.

---

## **View Controller**

The following descirbes how I setup my app. I have reduce frivolous code to increase readability.

```swift
var w: CGFloat = 1000
let h: CGFloat = 1000
let scene = Scene()

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as? SKView {
            w = (UIScreen.main.bounds.size.width / UIScreen.main.bounds.size.height) * 1000
            scene.scaleMode = .aspectFit
            view.presentScene(scene)
        }
    }
}

```

- I took advantage of what I normally do. I create 2 global values called `w` and `h`. These are the width and height of my project.
- Note that `h` is an immutable constant of `1000`.
- Note how I calculate `w` as the scene is begin presented.
- Note how I created `scene`, a global value that points to my `Scene` object.
- Note how I easily present the scene in 1 line of code, whereas other projects it is more difficult.
- You might wonder why I have created 3 states: `w`, `h`, `scene`. You are right in thinking this is an antipattern, however my goal is to create this project in the simplest and quickest way possible. Note that 2 of the states are constants, and the other acts like a constant.
- Note that I could have chosen to create `w` like this, but I decided against it. I would rather cash `w`'s value than recompute it every time I use it:
```swift
var w: CGFloat { (UIScreen.main.bounds.size.width / UIScreen.main.bounds.size.height) * 1000 }
```


---
## **Scene init method**

```swift
class Scene: SKScene {
    override init() {

        super.init(size: .init(width: w, height: h))

        anchorPoint = .zero
        backgroundColor = .white
        
        addChild(host.this)
        addChild(host.that)
        host.this.name = "THIS"
        host.that.name = "THAT"
        host.begin()
        
        previouslyHosted["\(type(of: host))"] = host
    }
}
```
- Note how I've used the `super.init(size: CGSize)` method to create a SKScene of size `w` and `h`. Note that `h` will always be `1000`, which is nice.
- Note that I'm using the `addChild` method for `host.this` and `host.that`. I will explain this later.
- Note the line `host.begin()`. This is the presentation of the scene.
- Note the `previouslyHosted` value, this is my scene cashing value. I will explain this later too.


---
## **Hosting a Scene**


```swift
struct Host: Hostable {
    func touchBegan() {}
    
    var that: SKNode
    var this: SKNode
    init() { this = SKNode(); that = SKNode() }
    
    func begin() {}
    mutating func reset() {}

    func update() {}

    mutating func touchBegan(_ pos: CGPoint,_ nodes: [SKNode]) {}
    mutating func touchEnded(_ pos: CGPoint,_ nodes: [SKNode]) {}
    mutating func touchMoved(_ moved: CGVector) {}
}
```
These are my receptive methods. The `SKScene` calls these methods, they are connected. The next sections explains how these methods are called.

---
## **Using the SKScene methods**

```swift
class Scene: SKScene {

    override func update(_ currentTime: TimeInterval) {
        if checkIfPresenting() { return }
        host.update()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if checkIfPresenting() { return }
        let thisNodes = touches.reduce([SKNode]()) { (foo, bar) -> [SKNode] in
            if bar.phase == .began {
                return foo + nodes(at: bar.location(in: self))
            } else {
                return foo
            }
        }
        guard let pos = touches.first?.location(in: self) else {return}
        host.touchBegan(pos, thisNodes)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if checkIfPresenting() { return }
        let thisNodes = touches.reduce([SKNode]()) { (foo, bar) -> [SKNode] in
            if bar.phase == .ended || bar.phase == .cancelled {
                return foo + nodes(at: bar.location(in: self))
            } else {
                return foo
            }
        }
        guard let pos = touches.first?.location(in: self) else {return}
        host.touchEnded(pos, thisNodes)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if checkIfPresenting() { return }
        touchesEnded(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if checkIfPresenting() { return }
        for i in touches {
            if i.phase == .moved {
                let loc = i.location(in: self)
                let prevLoc = i.previousLocation(in: self)
                let d = CGVector(dx: (loc.x - prevLoc.x), dy: (loc.y - prevLoc.y))
                host.touchMoved(d)
            }
        }
    }

    func detectTouches(_ touches: Set<UITouch>) {
        if checkIfPresenting() { return }
        var nodesFound: Set<SKNode> = []
        for touch in touches {
            currentTouches.insert(touch)
            nodesFound = nodesFound.union(nodes(at: touch.location(in: self)))
        }
    }

    func checkIfPresenting() -> Bool { return host.this.hasActions() || host.that.hasActions() }

}
```

I don't think I'll be able to easily explain exactly what's going on here.

It is quite simple, though. The only methods used here are:
- `override func update` - This method is called every frame (typically 60 fps). It immediately calls `host.update()`. Note that it checks if the scene is presenting. If it is, my scene will pause. Then, when a new scene is presented, the `host.update()` will go to the new scene.
- `touchesBegan`, `touchesEnded`, `touchesCancelled`, `touchesMoved` - These are all Apple's touch methods in SpriteKit. What I do with them is find the position of the touch, see how many nodes were touched, and then call the respective methods from `Hostable`.
- The majority of the code is detecting which nodes are being touched. I think this code may be overly complex, and I could easily go back in and simplify it, but it would not be the best use of my time at this moment. (I'm also not going to recode something that isn't broken)


---

