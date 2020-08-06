# **Merging Arrays**

I have 2 arrays for us
- `[1, 2, 3, 4]`<br>
and
- `[5, 6, 7, 8]`

Is it possible to merge them into *One Giant Array*?<br>
<sup>Like so:</sup>

- `[1, 2, 3, 4, 5, 6, 7, 8]`

---
**Adding**<br>
I didn't know this before, you can actually *Add* arrays together! Seriously!

```swift
let foo = [1, 2, 3, 4] + [5, 6, 7, 8]

print(foo) // [1, 2, 3, 4, 5, 6, 7, 8]
```
Woah! This changes everything!


---
**+= and append**<br>
But wait! There's more!

What a good fit, to also add using `+=`

```swift
var foo = [1 2, 3, 4]
foo += [5, 6, 7, 8]
```

or even append!

```swift
var foo = [1 2, 3, 4]
foo.append(contentsOf: [5, 6, 7, 8])
```

---
**Append Ranges of Numbers!**<br>
Ok, this is *way* cool!

```swift
var foo: [Int] = [8, 8, 8, 8, 8] + [9, 9, 9]
foo.append(contentsOf: 1...3)
foo += 1...5
print(foo)
```

You can *even* append Ranges of Numbers to `[Int]`!. Ooh! (Same with Strigns too!)

---
**Reduction**<br>
Here's an advanced technique

```swift
var a = ["a", "b", "c"]
var b = ["d", "e", "f"]

let res = [a, b].reduce([], +)
print(res)

// ["a", "b", "c", "d", "e", "f"]
```

What even!

---

Notes from <a href="https://stackoverflow.com/questions/25146382" title="How to Merge Arrays in Swift">SO-25146382</a>


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```