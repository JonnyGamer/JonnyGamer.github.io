# **Undefined**

This is going to blow your mind, just like it blew mine. Craziness awaits!

Technically this is called **Pre-Initialized Values**

---
**Ok, what is this..**

Did you know, you don't have to actually give a value an assignment!?

```swift
let foo: Double
foo = 5.0
```

WAIT!

But, but, this is a `let`. What's even happening here!??

---

```swift
let foo: Double
```

Notice how there is no `=` equal sign. Hmm. Notice the Explicit Type Definition as `Double`.

Can we use `foo` in this state??

**No**

See here:

```swift
let foo: Double
foo = foo + 1.0
```

This throws an Important Error:

`error: constant 'foo' used before being initialized`

Fancy Termonology!

---
**What's the deal with let**<br>
We know that *lets* cannot be reassigned. So why in the world does this work:

```swift
let foo: Double
foo = 5.0
```

It works because..   `foo` has *not* been assigned yet!

Wow!

---
**Can we do this trick with var??**<br>
Yes indeed

```swift
var bar: String
bar = "Hahaha"
bar = "\(bar) Hahaha!!!!?"
```

Tricky tricky

---
**WHY would anyone use this!?**<br>
I hardly ever use this because.

There's a cool application in **Chapter 3** but I guess you'll have to get there first. <sub><sup>tricky tricky..</sup></sub>

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```