# **Safe Unwrapping ??**

Let's try to simplify this code:

```swift
var present: String? = nil
if present != nil {
    print(present!)
} else {
    print("Aw.. No Present..")
}
```


`if-statement` are cool, but they are cumbersome. Is there a way to shorten this ??

---
**Yes!**

If you'd like to provide a *Default Value*, you can do this:

```swift
var present: String = nil
print(present ?? "Aw.. No Present..")
```

These 2 pieces of code do the same thing, however, this 2nd one will **never** crash since it does not include a force `!`.

---
**Stacking**

Default Values are very cool, becuase you can add them together. What does this code do?

```swift
let a: String? = nil
let b: String? = nil
let c: String? = "Pancakes"

print(a ?? b ?? c)
```

Let's break it down. Since `a` is `nil`, we move to the next value. Since `b` is `nil`, we move to the next value. Since `c` is not `nil`, we print c.

---
But what if we don't want a default value. What if, if something is `nil`, we just want to ignore it?

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```