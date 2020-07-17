# **Enums really *MUST* Have Unique Raw Value cases?**

We've all tried it:

```swift
enum Foo: String {
    case bar = "Hello"
    case bas = "Hello"
}
```

We've all tried to have 2 enum elements be the same. Unfortunately, we get this error:

`Raw value for enum case is not unique`

But _wouldn't_ it be great if you **could** make them the same! Just imagine the repercussions:

```swift
assert(Foo.bar == Foo.bas)
// This assertion would pass
```

I think this could potentially seriously break switch statements:
```swift
var magic: Foo = .bas
switch magic {
   case .bar: print("Is it this one?")
   case .bas: print("Or is it *this* one?")
}
```

I *really* wonder what would happen to Set and Dictionary
```swift
let set: Set<Foo> = [.bar, .bas] // Would this collapse? Which one would it choose? Only the first one?
print(set)

var array: Array<Foo> = [.bar, .bas]
array.remove { $0 == .bar }
print(array.isEmpty) // Would it be true?

let _: [Foo:Bool] = [.bar:1, .bas:2] // Would this throw an error??

let dict: [Foo:Int] = [.bar:1]
print(dict[.bas]) // Would it print 1??
```

I'm also wondering about case interable:
```swift
for i in Foo.allCases {
    print(i) // Prints "Hello", "Hello"
}
```

---
**Huh**<br>
I bet your so very curious as to how I'm so sure about all this, when it is so blatantly *speculation*.

[Well..](https://stackoverflow.com/questions/28037772/swift-enum-multiple-cases-with-the-same-value/62884952#62884952)
---

---
**So.. now what**<br>
I initially created this bug on 7.13.2020, but it will remain to be possible forever on all versions of Swift <= 5.3

Go enjoy youselves (As I did above). This is quite uncommon to find.

---
**Here's the code**<br>
```swift
enum Foo: Bool {
    case bar = true
    case bas = 1
    case bat = 2
}

extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) { self = true }
}

func bug() {
    assert(Foo.bar == Foo.bas) // This assertion is legitimate!
    assert(Foo.bar.rawValue == Foo.bas.rawValue) // This assertion is legitimate!
}
```

I'll explain what's going on here. As we learned in [this lesson](https://jonp.io/swift-master-class), whenever Swift is looking for a Boolean Expression, and sees an Int, our special extension can automatically convert it to a Bool. Apparently, Swift does no further checking. It's just looking for 'unique' starting raw values. Not 'unique' resolved raw values. (I mean, they aren't even supposed to be resolved to begin with.. that's what makes them 'raw'....)

---
**An easy solution to a complex Stump Me**<br>
Look, the 2 values are equal, but interpolated, they are not equal. AMAZING.
- `Foo.bar == Foo.bas`
- `"\(Foo.bar)" != "\(Foo.bas)"`

---
**BUT WAIT**

```swift
extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) { self = .random() }
}
```
I've gone and changed it to `.random()`!!!! I'm quite surprised now..


---

This works:


```swift
enum Foo: ClosedRange<Int> {
    case foo = "1...3"
    case bar = "1...4"
    func overlaps(_ with: Foo) -> Bool { return self.rawValue.overlaps(with.rawValue) }
}
```
```swift
extension ClosedRange: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: String) {
        let v = value.split(separator: ".")

        switch Bound.self {
        case is Int.Type: self = (Int(v[0])! as! Bound)...(Int(v[1])! as! Bound)
        default: fatalError()
        }
    }
}
```
It allows you to do this:
```
print(Foo.foo.overlaps(Foo.bar))
```

- You can add more types like `Double` or `String` using [this technique](https://stackoverflow.com/a/46224492/13426627)
---

Side Note: My attempt allows for [non-unique rawValues (SR-13212)](https://bugs.swift.org/browse/SR-13212) which is a shame. But I'm not thinking that is fixable:

```swift
enum Foo: ClosedRange<Int> {
    case foo = "1...3"
    case bar = "1...4"
    case bar = "1...04" // Duplicate, but Swift allows it.
}
```

---


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```