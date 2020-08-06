# **Index of an Element**

Other programming languages (I'll admit) are better in this one way. Here's why.

Let's say I have an array of numbers:
```swift
let myNumbers = [0, 1, 6, 8, 3, 9, 10]
```

And let's say I wanted to find the number `8`. Which index is it??
- `myNumbers[3] == 8` easy.

That's good. But.. Is *this* in Swift??
- `myNumbers.find(8) == 3`

Unfortunately it's not. Other languages *do* have this. But Swift is a little tricky this way.

---
**Hmm**

But is this bad? I think Swift may be a little smarter.

Look at this code:

```swfit
let myNumbers = [8, 8, 8, 8, 8, 8]
```
How would other languages solve this? Where is `8` now?

In this case, 8 appears mutliple times. Which means there's an `Array<Int>` of answers! With a minimum value *and* and maximum value. Unfortunately, there is no method that gives us *all* possible answers. But there is one for min and max answers!

---
**Show me this Swift**<br>
I found the Swift answer!

```swift
let foo = [8, 8, 8, 8, 8]
print(foo.firstIndex(of: 8)!) // 0
print(foo.lastIndex(of: 8)!)  // 4
```

Note the `firstIndex` and `lastIndex`!

Note the `!` excalmation point. What does ths do??

**In Short:** 8 may not exist in the array, therefore not having a first appearance. The `!` *forces* Swift to give us the answer. And if there isn't one, our code will just crash.

---

Notes from [SO-24028860](https://stackoverflow.com/questions/24028860/how-to-find-index-of-list-item-in-swift)


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```