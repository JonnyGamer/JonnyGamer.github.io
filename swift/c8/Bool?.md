# **Bool?**

You know how Bool can be `true` or `false`? It can only be 2 things.

I wonder if there's a Type that can only be 3 things??

There is!! `Bool?`

---
Bool? can only be one of these 3 options:
- `true`
- `false`
- `nil`

This is cool because you can make a `switch` with only 3 cases:

```swift
let foo: Bool? = nil
switch foo {
    case .some(true): print("TRUE!")
    case .some(false): print("FALSE!")
    case .none: print("NIL!")
}
```

---
### **Special Rule with If-Statements**

`Optional<Bool>` is different than `Bool`

For example, you cannot do this:

```swift
let foo: Bool? = true

if foo {
    print("foo is true")
}
```

Awwww.. Why??
<br>
Because it is still Wrapped in a present. We must *unwrap* it to work.<br>But here is an easy to remember solution:

```swift
let foo: Bool? = true

if foo == true {
    print("foo is true")
}
```

---
# **Bool? ==**

You can do this as well:

```swift
let bar: Bool? = true

if bar == true {}
if bar == false {}
if bar == nil {}
```

However, this will not work:

```swift
let bar: Bool? = true

if bar && bar || bar {}
```

Because `bar` is still wrapped. But what now??

We want to filter out the nil. But how?

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```