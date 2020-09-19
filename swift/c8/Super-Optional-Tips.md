# **Super Optional Tips**
Are you ready for these Super Optional Tips? They are very Optional!

---
### **Default Value for Looping over an `Optional<Array<_>>`**

```swift
let presents: [String]? = ["Hello"]
for present in presents ?? [] {
    print(present)
}
```

---
### **Nil needs a Type**
This does not work:
```swift
let foo = nil
```
nil cannot be inferred like this. nil must have an explicit definition:
```swift
let foo: Bool? = nil
```
---
### **Disregard the ` = nil`**
Turns out this is ok
```swift
var foo: String?
print(foo) // prints nil
var bar: String!
print(bar) // prints nil
```

---
### **Silence Printing Optional Warning**

```swift
let foo: String?
print(foo as Any)
```

See the coercion operator `as`. This is a mistake from the Swift engineers. They built the `print` function incorrectly. Later, I'll show you how to build a better one!

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```