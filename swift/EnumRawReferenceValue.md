# **Enum Raw Reference Value**

A continuation of our Enum Marathon. I was thinking about raw values again, and I thought to myself:
`Hey, what if the rawValue was a reference to an object (class)?`

Why on earth would I want this? I'm going to see if I can mutate the rawValue of an enum case, which Apple declares should not be so.

---
**Making our class**<br>

So first I'm going to make a very basic class.

```swift
class This {
    var now: Int
    init(_ n: Int) { now = n } 
}
```

Super basic. It stores 1 value.

---
**Can Classes be ExpressibleByIntegerLiteral?**<br>
Now, I'm going to add our neat protocol:

```swift
class This: ExpressibleByIntegerLiteral {
    var now: Int
    init(_ n: Int) { now = n } 
    required init(integerLiteral value: Int) { now = value }
}
```
I also added the required initialization method.

---
**Conform it to an Enum**<br>
```swift
enum Hey: This {
    case that = 7
}
```

See that! We've done it!<br>
Hold on, we are getting 2 errors:
- `'Hey' declares raw type 'This', but does not conform to RawRepresentable and conformance could not be synthesized`
- `RawRepresentable conformance cannot be synthesized because raw type 'This' is not Equatable`

Classes are odd when it comes to `Equatable` so I'll first add this and see what happens:

```swift
extension This: Equatable {
    static func == (lhs: This, rhs: This) -> Bool {
        lhs.now == rhs.now
    }
}
```

Turns out this fixes everything. So let's see what we can do with this!

---
**Check it out!**<br>

I tried out the following code:
```swift
    print(Hey.that.rawValue.now) // 7
    Hey.that.rawValue.now = 5
    print(Hey.that.rawValue.now) // 7
```
I expected to see the `.now` attribute to change to `5`, however, it stays at `7`. What!? Why?

---
**Enum raw values don't hang around very long**<br>
I decided to run this:

```swift
print(Hey.that.rawValue) // <This: 0x100439550>
print(Hey.that.rawValue) // <This: 0x10043a250>
print(Hey.that.rawValue) // <This: 0x103026bb0>
```

Look how they are all different objects!?<br>
I'm getting suspicious.. I think I know what's going on

---
**Deinited**<br>
I pasted this into my `This` Object:
```swift
deinit { print("Destroyed") }
```

And how if I run this code, check out what happends:
```swift
print(Hey.that.rawValue.now)
// "Destroyed"
// 7
```

The object gets destoryed and reset! NOOO!<br>
Hmm. This is much trickier now.

This means that this equation will always return `false` because they are 2 different objects, not the same:
```swift
Hey.that.rawValue === Hey.that.rawValue // Incredibly always false
```

---

Looks like maybe we're stuck here. Oh well. Glad I was able to figure this out somewhat, thought.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```