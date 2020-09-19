# **(Force Unwrapping)!**

Imagine you have a present, and you're not sure if it's a good present or a bad present. But you forefully open it anyway and there's nothing inside!!! Ah! Game Over.

Unfortunately, this is where *the most crahses* can happen to your code. What I'm about the share with you in this lesson is **not** the best way to code. Many people use this technique, but when you go professional, you will be asked not to do this. (In fact, some programs won't even let you run your project if you use this technique, because it's that dangerous.)

The reason I will teach this to you is that it is always good to know what not to do, why not to do it, and how to do it the better way.

---
**How does one force unwrap?**

Let's say I have a value like so, and I don't know what is inside.

```swift
var present: String? = /* something hidden */
```

And let's say I want to open that present. Here we go:

```swift
print(present!) // One Happy Walrus
```
<sup>Note the use of the `!` excalmation point!

You're present was `One Happy Walrus`! Cool! But let's say someone was mean and gave you a present with *nothing inside*...

```swift
var present: String? = nil
print(present!) // Crash!?

// Fatal error: Unexpectedly found nil while unwrapping an Optional value
```

Fatal Error! Oh no!

---

Obviously, Fatal Errors are bad, they will stop your code, and won't continue. Here is one way to bypass a fatal error:

```swift
var present: String? = nil
if present != nil {
    print(present!)
} else {
    print("Aw.. No Present..")
}
```

You can create an `if-statement` to check for `nil` values. However, this can be cumbersome and take up a lot of space. I wonder if there's a shorter way to do this??

This example is ok. However, to use the `!` bang symbol, most people say you need to be 1000000% percent sure that the value is not `nil`. You can never be too sure, so it's safest never to use `!`. (Because when we learn Multithreading, that it, 2 pieces of code running at the same time, our value might change to `nil` on accident!)

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```