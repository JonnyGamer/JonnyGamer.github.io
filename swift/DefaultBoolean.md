# **Default Boolean**

What is `Bool()` in Swift? I was tempted to say it is `true`
But it isn't.

It's `false`

Now, before you get all upset, it actually sort of makes sense:

- Bool() == false
- Int() == 0
- Double() == 0.0
- String() == ""

etc.

Later, we'll speak about what Initialization is.

---
**Changes?**<br>

Is it possible to change the Default value of the Bool? Let's say, can we change `Bool()` to be `false`?

Ok get ready.. 1, 2, 3..

Yes! We can! (oof)<br>
Let's see how it works:

```swift
extension Bool {
    init() { self = true }
}
```

This handy extension sets the default value of Bool to true. So now:

```swift
print(Bool()) // Swift prints true, instead of false
```

I feel like this will break stuff.. It will. I think it will only cause bugs for you. I don't think it will break any of Apple's behind the scenes code. But I may be wrong. This just feels so wrong.

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```