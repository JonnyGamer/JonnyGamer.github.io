# **while let**

This is definetely a *secret* not told elsewhere.

```swift
var presents: [String?] = ["Boat", "House", "Car", nil, "Gift"]

while let optPresent = presents.first, let present = optPresent {
    print(present)
    presents.remove(at: 0)
}
```

<sup>This is a very interesting case because you can see the use of a `String??` type!

This does the same exact thing, but a lot more code:

```swift
var presents: [String?] = ["Boat", "House", "Car", nil, "Gift"]

for optPresent in presents {
    if let present = optPresent {
        print(present)
    } else {
        break
    }
}
```

Notice how once we get to a `nil` we stop opening presents?

How interesting! And very generous presents!

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```