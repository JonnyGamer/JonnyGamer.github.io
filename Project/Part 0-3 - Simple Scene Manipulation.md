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