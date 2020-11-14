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