# **(Optionals in Optionals?)?**

What if an Optional is Optional??

I think I remember seeing this before.. this example:

```swift
var presents: [String?] = ["Boat", "House", "Car", nil, "Gift"]

while let optPresent = presents.first, let present = optPresent {
    print(present)
    presents.remove(at: 0)
}
```

Why is this recursively optional??

Because..

```swift
var presents: [String?] = ["Boat", "House", "Car", nil, "Gift"]
print(type(of: presents.first)) // Optional<Optional<String>>
```

---
Ok, so we know that Optionals of Optionals exist. It takes 2 `if-lets` to safely unwrap them. Ok that's cool.


---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```
<sup><sup>Also, the most recursive you can get is `10273` Optionals. That's a lot.