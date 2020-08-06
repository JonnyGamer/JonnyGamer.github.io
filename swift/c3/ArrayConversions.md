# **Array Conversions**

Rmemeber the Chapter 1 Honors Lessons about Conversions? Here's some more with Arrays!

---
## **Array to String**

Instead of turning a `String` into `[String]`, let's turn `[String]` into `String`.

Easy!

```swift
var array = ["1", "2", "3"]
array.joined()
// "123"
```

Can we join them together with Spaces or Something else?

Sure!

```swift
var array = ["1", "2", "3"]
print(array.joined(separator: " "))
// "1 2 3"

print(array.joined(separator: "-"))
// "1-2-3"
```

Notes from <a href="https://stackoverflow.com/questions/25827033/" title="Convert [String] to String">SO-25827033</a>

---
## **Array to Int**
Let's take an `[Int]` and get the sum of all these numbers!

```swift
let nums = [1, 2, 3]
let sum = nums.reduce(0, +)
print(sum)
// 6 is the sum!
```

Wowowow!

Notes from <a href="https://stackoverflow.com/questions/24795130/" title="Convert [Int] to Int">SO-24795130</a>

---
## **Array to Double**
This should be similar to the `[Int] to Int` Technique

```swift
let nums = [1.0, 2, 3]
let sum = nums.reduce(0, +)
print(sum)
// 6.0 is the sum!
```

Note the use of Swift Inference.

---
## **Array to Bool**
Let's collapse `[Bool]` into `Bool`. How will this work?
- If it contains true, it's true.
- If not, it's false.

**Basic Version:**
```swift
[true, false, false].contains(true)
```

**Advanced Version:**
```swift
func or(lhs: Bool, rhs: Bool) -> Bool { return lhs || rhs }

let bools = [false, false, true]
let sum = bools.reduce(false, or)
print(sum)
```

Note the similarities of these answers. Ooh!

---

Wow! Awesome! Greatness!


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```