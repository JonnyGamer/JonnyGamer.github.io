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


# **Part 0-2 - Cashing and Preseting Scenes**

- Cashing Objects in a Dictionary
- Presenting the Scene

---
## **Cashing Objects in a Dictionary**

```swift
class Scene: SKScene {
    var host: Hostable = Host()
    var previouslyHosted: [String:Hostable] = [:]
    override init() {
        /* etc. */
        previouslyHosted["\(type(of: host))"] = host
    }
}
```

I created a dictionary to save my views. The dictionary is of type `[String:Hostable]`. 


At first, I tried to create a scene name attribute, but I realized I didn't need it. All I needed was a string that would uniquely define the struct used. I found that `"\(type(of: host))"` did the trick:
- Example: `"\(type(of: Host()))" == "Host"` which is what I needed.

Why did I cash each scene?
- So I didn't need to recreate it everytime someone goes to that scene. Another upside is that all the states of the scene are also saved. For example, if you have scrolled around on a page, and you exit the view and return to it, it will save the position you were on the page. Whereas if I recreated that scene, it would reset all the states.
- Recreating scenes would probably use up plenty of memory, and waste computational power. Cashing is superior.


---
## **Presenting the Scene**

```swift
extension Hostable {
    func present(_ new: Hostable.Type) {}
}
```

When I want to present a scene, all I have to do is give the type of the scene. For example, I could do something like this: `present(Host.self)` and this would present the `Host` view.

The presentation transition is just a fade out / fade in. Nothing complex. The following code shows exactly what the presentation method does:

```swift
extension Hostable {
    func present(_ new: Hostable.Type) {
        
        that.run(.fadeOut(withDuration: 0.2)) {
            self.that.removeFromParent()
        }
        this.run(.fadeOut(withDuration: 0.2)) {
            self.that.removeFromParent()
            self.this.removeFromParent()
            
            if let loaded = scene.previouslyHosted["\(new)"] {
                scene.host = loaded
                scene.host.this.alpha = 0
                scene.host.that.alpha = 0
                if scene.host.this.parent == nil {
                    scene.addChild(scene.host.this)
                }
                if scene.host.that.parent == nil {
                    scene.addChild(scene.host.that)
                }
                scene.host.this.name = "THIS"
                scene.host.that.name = "THAT"
                scene.host.this.run(.fadeIn(withDuration: 0.2))
                scene.host.that.run(.fadeIn(withDuration: 0.2))
                scene.host.reset()
            } else {
                scene.host = new.init()
                scene.host.this.alpha = 0
                scene.host.that.alpha = 0
                scene.host.this.name = "THIS"
                scene.host.that.name = "THAT"
                if scene.host.this.parent == nil {
                    scene.addChild(scene.host.this)
                }
                if scene.host.that.parent == nil {
                    scene.addChild(scene.host.that)
                }
                scene.host.this.run(.fadeIn(withDuration: 0.2))
                scene.host.that.run(.fadeIn(withDuration: 0.2))
                scene.host.begin()
                scene.previouslyHosted["\(new)"] = scene.host
            }
        }
    }
}
```

- Note that I check if the view has been cashed using an `if let` control flow.


---
# **Part 0-3 - Simple Scene Manipulation**

- Panning a Scene
- Zooming a Scene

---
## **Panning a Scene**

```swift
mutating func touchMoved(_ moved: CGVector) {
    this.position.x += moved.dx
    this.position.y += moved.dy
}
```
Using this very simple code, a view can be panned just by moving your finger.


Cool things that came out of this:
- If you use 2 fingers to scroll, it will move twice as fast! (etc.)
- All children nodes move with the `this` node.
- All children of `that` stay static and won't pan.
- Large views will take advantage of built in clipping.

Later, I'll show how I was able to get selection of boxes, and panning of boxes working.


---
## **Zooming a Scene**
I added little plus and minus buttons for zooming in and out.
I created a little `pinch` method. Calling `pinch(0.9)` zooms out, and calling `pinch(1.1)` zooms in.

```swift
func pinch(_ factor: CGFloat) {
    let trueSize = this.calculateAccumulatedFrame()
    let xRatio = (this.position.x - (w/2)) / trueSize.width
    let yRatio = (this.position.y - (h/2)) / trueSize.height
    this.position = CGPoint(x: w/2, y: h/2)
    this.setScale(this.xScale * factor)
    let newTrueSize = this.calculateAccumulatedFrame()
    this.position.x = xRatio * newTrueSize.width + w / 2
    this.position.y = yRatio * newTrueSize.height + h / 2
}
```

I did a little fancy math so that if you zoom in or out after panning, wherever you were stays in the center of the screen.

I decided not to do pinch genstures, as it would have taken a little while longer. If done pinch gesutres before, but this was quicker. Maybe I'll add pinch gestures if I decide to publish this to the App Store, because it's nicer.

Here's a simple application of this feature:

```swift
mutating func touchBegan(_ pos: CGPoint,_ nodes: [SKNode]) {
    if nodes.contains("minus") {
        pinch(1.1)
    } else if nodes.contains("plus") {
        pinch(0.9)
    }
}
```

---
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