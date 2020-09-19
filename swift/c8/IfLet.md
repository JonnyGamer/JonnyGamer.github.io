# **if let (Optional Binding)**

Let's say we don't want a default value for `nil`. Instead we just want to skip whenever we see nil.

Right now, we would do this:

```swift
let present: String? = nil
if present != nil {
    print(present!)
}
```

But remember, we never want to use `!`. So.. I wonder if this works:

```swift
let present: String? = nil

print(present ?? "")
```

Nope. It stil prints `""` when it sees `nil`.

---
**If Let!**

Look at this:

```swift
let present: String? = "foo"

if let safePresent = present {
    print(safePresent) // "foo"
}
```

WOah.. What's this!? `if let` I think we've seen this before!

If you remember `if case let` you know what is happening. `safePresent` is a value that is being created. However, something *grand* is taking place behind the scenes.

`safePresent` is a `String` and not a `String?`.

Huh?

This means that, Swift is checking if `present` is `nil`. If it is nil, Swift skips the `if-statement` and would enter the `else` portion if I included it. Since `present` has a value, Swift safely unwraps it, and created a new value called `safePresent` for us to use.

Woah.. Interesting..

---
**If Let Let**<br>You can even stack these like so:


```swift
let presents: [String?] = ["Gift Card", "LEGO", nil]

for present in presents {
    if let safePresent = present,
    let startingLetter = safePresent.first {
        print(safePresent)
        print(startingLetter)
    }
}
```

If I run this code, see what gets printed:
```
Gift Card
G
LEGO
L
```

This code ensures that a present that is `""` (doesn't have a starting letter) also gets filtered out. Of course, I could have replaced it with `safePresent.count > 0`, however, I wouldn't have been able to use a safe-unwrapped version of the first letter.

---

Unfortunately, after the `}` of our `if-let`, any value we safely unwrapped gets deleted. Is there a workaruond for this??

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```