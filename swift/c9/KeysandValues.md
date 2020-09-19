# **Keys and Values**

Dictionaries are *Double Generic*! What does this even mean..

Arrays are Generic. That means they can hold a speicific type. For example:
```swift
let myArray: Array<Int> = [1, 2, 3, 4]
```
Shows you how the Array is holding an Int.

---
**Dictionaries** have 2 values!

```swift
let myDictionary: Dictionary<Int, String> = [
    1: "T-Rex",
    2: "Pterodactyl",
    3: "Thesaurus"
]
// Try Dictionary<Int, String> Type can also be written as [Int : String]
```
They can be any value you want them to be!
(Almost)

---
# **Hashable**

Some types cannot be used as Dictionary Keys.. Like **Void**

```swift
let voidDictionary: [Void : String] = [
    () : "Foo"
]
// error: Type 'Void' does not conform to protocol 'Hashable'
```

Aw...

Basically all Non-Nominal Types we learned in Chapter 5.5 are a no go..

```swift
let foo0: [Void:Int] = [:] // Error: Void
let foo1: [Any:Int] = [:] // Error: Any
let foo2: [(Int, Int)):Int] = [:] // Error: Tuples
```

What is Hashable?<br>Good question. It's basically anything normal. We'll lean about Hashable in the protocols chapter.

However.. Tuples *will* become Hashable, and therefor allowed as Dictionary keys in Swift 5.3!!!

---
# **Hashable Tuples**

This means you'll be able to do this *VERY SOON*

```swift
let tupleDictionary: [(Int, Int) : String] = [
    (0,0) : "Ground",
    (1,0) : "Ground",
    (2,0) : "Ground",
    (3,0) : "Ground",
    (3,3) : "Hidden ? Block"
]
```

But you won't be able to store types like `[(Any, Int) : Int]` because the `Any` portion is not allowed.

---
## **Looping through Keys and Values**

Just like an `Array` or `Set`, you can loop through the values of a Dictionary.

```swift
let fooDictionary: [String : String] = [
    "Foo 1" : "Foo",
    "Foo 2" : "Foo",
    "Foo 3" : "Foo",
    "Foo 4" : "Foo",
    "Foo 5" : "Foo",
]

for (i, j) in fooDictionary {
    print(i + ": " + j)
}
```

If you'd like to specifically just loop over keys or values, do this:

```swift
let fooDictionary: [String : String] = [
    "Foo 1" : "Foo",
    "Foo 2" : "Foo",
    "Foo 3" : "Foo",
    "Foo 4" : "Foo",
    "Foo 5" : "Foo",
]

for (key, _) in fooDictionary {
    print(key)
}

for (_, value) in fooDictionary {
    print(value)
}
```

There's also these methods, which are quite interesting:

```swift
for key in fooDictionary.keys {}
for value in fooDictionary.values {}
```

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```