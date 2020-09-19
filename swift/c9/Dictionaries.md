# **Dictionaries**
Dictionaries are my favorite. They are exactly what you think they are!

Imagine you have a list of words in your dictionary. And each word has a definition.

```swift
let myDictionary = [
    "apple" : "a red fruit",
    "bovine" : "also known as a cow",
    "cow" : "usually not a vegetable",
]
```

Dictionaries are super great!!! And closely tied with optionals.

---
# **Searching**

How do I search for a dictionary term?

```swift
print(myDictionary["apple"]) // prints Optional("a red fruit")
```

There's a couple rules when it comes to dictionaries:
 - Your key search term must be the same type. In this case `String`.
 - If a word does not exist, your dictionary says `nil`
 - Dictionaries cannot have 2 of the same key words, they are similar to Sets.
 - (But they *can* have 2 of the same definitions)


 ---
 # **Type of Dictionary**

```swift
print(type(of: myDictionary)) // [String : String]
```

Check it out! This is a very interesting type that we haven't seen before. Here is an explicit definition:

```swift
var myNumbers: [Int : String] = [
    0: "Zero is nothing",
    1: "One is the first number",
    2: "Two is a prime number",
    3: "Three is a prime number",
    4: "Four is a square number",
    1234546677: "10001101 is a big number"
]
```

It doesn't have to be Strings. In fact, you can use any type anywhere in the dictionary! (Except for Tuples..)

---
# **Adding / Removing New Entrees**

```swift
var dict: [String : String] = [
    "a" : "a is for apple",
    "b" : "b is for bonus",
    "c" : "c is for country"
]

dict["d"] = "d is for developer" // adds new element

dict["c"] = nil // removed "c"

dict["a"] = "a is for aardvark" // changes "a"
```

- To add an element, all you need to do is define it.
- To remove an element, just set it to `nil`
- to mutate an element, just redefine it.


---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```

Remember to add colons separating keys and definitions, as well as commas separating each entree.