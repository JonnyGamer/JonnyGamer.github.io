# **Invisible Names**

Check out this *very* indestructible feature.

Copy any paste this code:
```swift
let ​ = 100
```

Do you see anything wrong with this code? Yes? No?

I *see* something wrong with this code. But Swift doesn't. Swift sees all. Swift even sees invisible things.

I've inserted a Zero Width Character in a very strategic place. The name of the value we created ***is*** a Zero Width Character!

WOW!

---

Zero Width Character making things like this OK:

```swift
var ​ = 100
​ = 200
```

---

# Please never do this
(unless you want to)

---

You're value name can even be **TWO** Zero Width Characters, like so:

```swift
var ​ = 100
var ​​ = "Foooo"
```

Atrocious! (But somehow it works?)

---
**Is there a limit?**

I created a value with the name of nearly 2 million Zero Width Spaces. It still worked!! (Also when I tried to delete it my apps went strange)

---
**Override Characters**

You can even use the dreaded RIGHT-TO-LEFT OVERRIDE Character as a name.. (U+202E)

```swift
let ‮ = "Is this not cool!!" // Wooah..
```

I even placed a comment in there. It just messes things up. But it still works ;)

---
**Why not spacebars**<br>
Some have even gone so far as to want to include `Regular Old Spacebars` as names. (U+0020)

Currently it does not work. Even with backticks. You can't even use Non-Breaking Spaces (U+00A0).

However, [someone got it to work](https://github.com/apple/swift-evolution/blob/master/proposals/0275-allow-more-characters-like-whitespaces-and-punctuations-for-escaped-identifiers.md), and *almost* had it added into Official Swift. (It was sadly rejected in the last stage of review) (You can actually download their source code and build it. I'll have to do this some time)

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```