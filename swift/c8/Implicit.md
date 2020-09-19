# **Implicitly Unwrapped Types! So safe.**

Even safer than `Force Unwrapping` is `Implicitely Unwrapped Types`. These are really bad (Well, they're not bad, they just shouldn't be used professionally). However, if you see someone using these, you should be able to know what they do.

---
Ok ok what are these..<br>
Very similar to Optionals.

```swift
var foo: Int! = 5
```

Well.. this seems sorta friendly, right?

---
## *No it is not!*
Because of this instacrash.

```swift
var foo: [Int]! = nil
foo.append(4) // CRASH!
```

whereas

```swift
var foo: [Int]? = nil
foo?.append(4) // Nothing happens, foo doesn't chang 
```

Woah.
---

---

Implicitely Unwrapped Types are like Optionals, but always forcefully unwrapped. (For those people who don't want to always use optional-safety or `!` bangs.)

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```