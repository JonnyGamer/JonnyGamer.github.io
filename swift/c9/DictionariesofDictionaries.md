# **Dictionaries of Dictionaries**

It's time for Dictionaries of Dictionaries! And maybe even more!!

---

Here's how to make an empty one, so we know it is most definetely possible:

```swift
let superDictionary: [[String : String] : [String : String]] = [:]
```

And here it is:

```swift
var superDictionary: [[String : String] : [String : String]] = [
    ["Foo" : "Bar", "Welcome" : "Swift!"] : ["Woahhh" : "hhhhh"],
    ["One" : "Two", "Three" : "Four", "Abc" : "def"] : [:],
    ["Foo" : "Bar"] : ["This is long" : "ok", "1000" : "times 100"],
    ["Goodbye" : "Swift!!!"] : ["Woahhh" : "hhhhh"],
    [:] : ["":""]
]

superDictionary[["Foo" : "Bar", "Welcome" : "Swift!"]]?["Woah"] == "hhhhh"
superDictionary[[:]]?[""] == ""
```

This is quite large. I do not do this often.

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```