# **Division is Broken?**

Here's something incredulous about Swift:

Remember this statement:

```swift
1 / 2 == 0 // true statement
```

Remember how Int division is pretty interesting?<br>
Well prepare to get your mind blown with Doubles.

---

I've got this trick question for you. What do you think this is?

`Double(1 / 2)`

We are turning `1 / 2` into a Double. What will the result be?

`0.0`

It's zero.

---
**Tricky?**<br>
The reason why Double(1 / 2) is 0.0 is very interesting. Swift evaluates `1 / 2` first, (which is 0) and then turns that result into a Double (0 into 0.0)

---
Hmm..<br>
What do you think this is?

`(1 / 2) as Double`

or even this?

`let foo: Double = 1 / 2`

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```