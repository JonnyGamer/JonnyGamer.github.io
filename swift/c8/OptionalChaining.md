# **Optional?.Chaining**

Remember our example using `if-let`:

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

What if I told you, there's a shorter way to write this code..

```swift
let presents: [String?] = ["Gift Card", "LEGO", nil]

for present in presents {
    if let startingLetter = present?.first {
        print(present!)
        print(startingLetter)
    }
}
```

Huh? What's this!! And what's with the ? in: `present?.first`

This is called Optional Chaining! Ooh!

---
**What is it.. exactly?**


```swift
var presents: [String] = ["abc", "bcd", "cde"]

if let firstLetter = presents.first?.first {
    print(firstLetter)
}
```

This prints: `a` since `a` is the first letter of the first element of the array.

But what about the Optionals??

- `presents == ["abc", "bcd", "cde"]`
- `presents.first == Optional("abc")`
- `presents.first?.first == Optional("a")`
- `presents.first?.first?.isLetter == Optional(true)`
- `presents.first?.first?.isLetter.hashValue == Optional(-5313871374433)`

Can you catch the pattern?

---
**Oh! Oh! Me! Me!**<br>
See the pattern? (well I guess it's not really a pattern..)

See how sometimes there's a `?.` and sometimes there's only a `.`<br>
What's the difference?

When a method returns an Optional Value, you must use `?.`<br>
For example, the `.first` method will always return an optional value.

However, when a method does *not* return an Optional Value, you must use `.`<br>
For example, the `.isLetter` method always returns a `Bool`.

---

This is quite interesting, so thank you very much!

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```