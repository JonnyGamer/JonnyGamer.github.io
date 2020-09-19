# **More Dictionaries**

I mentioned that you can have things inside Dictionaries other than Strings.

How many types do we know now..
 - Bool, Int, Double, String, Array, Ranges, Date, Optional, Set, Dictionary
 - Tuples, Void, Any

Wow, that's a lot of combinations. I'll just give some examples:

---
### Doubles, and Infinities.

```swift
let numbers: [Double:String] = [
    1.0: "1.0",
    2.0: "Two",
    .pi: "A good number",
    .infinity: "A rather large number"
    .nan: "Not a number?"
]
```

---
### Arrays??

```swift
let arrays: [[Int]: [String]] = [
    [1, 2, 3]: ["A great pattern", "Hello", "Thirsty", "Welcome"],
    []: ["This one is the empty array", "How clever!"],
    [1000, 6, 7, 7]: ["Interesting...."]
]
```

You can even replace the type `[[Int] : [String]]` with `[Set<Int> : Set<String>]` if you wanted.

Also, in accordance with our Optional Lesson about Optional Chaining:

```swift
arrays[[1, 2, 3]]?[0] == "A great pattern"
```

---
### Range Types
```swift
let ranges: [ClosedRange<Int>: Range<Int>] = [
    1...4 : 1..<5,
    10...11 : -100..<7707,
    (.min)...(.max) : 0..<0,
    1...1 : -1..<1
]
```

---
### Optionals
Wierd things happen with optionals and dictionaries..

```swift
var optionals: [Int? : Int?] = [
    100:100,
    200:949494,
    nil:100,
    0: nil
]

print(optionals[100]) // Optional(Optional(100))
print(optionals[nil]) // Optional(Optional(100))

print(optionals[0]) // Optional(nil)
optionals[0] = nil
print(optionals[0]) // nil (No! I can't even.)
```

We're just gonna skip this. heh.

No we can't! What about this:

```swift
print(optionals[0]) // Optional(nil)
optionals[0] = Optional(nil)
print(optionals[0]) // nil (No!!!!)
```

Ok this is cool. I'll have to look at this again sometime.

---
### Dictionaries!!!!!!!

We'll do this next lesson. I promise.

---
# **Empty Dictionaries**

Hey, Arrays can be emtpy. Why not dictionaries?

```swift
let foo: [Int:Int] = [:]
```

The `[:]` is the empty dictionary. Odd.

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```