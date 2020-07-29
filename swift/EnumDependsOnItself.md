# **Enum Depends on Itself**

I'm very excited for this post. I'm hoping to assign a rawValue of a enum case to be itself!.
I'm hoping to get something like this:

```swift
Foo.bar.rawValue.rawValue.rawValue
```

>This works, but it is *not* what I want
>```swift
>enum Ok {
>    case hello
>    var raw: Ok { return .hello }
>}
>```

---
**Attempt 1: Directly Depend**<br>
Let's begin here. I'm gonna try to see if the enum can conform to itself directly:

```swift
enum Wow: Wow {
    case dude
}
extension Wow: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self = .dude
    }
}
```
Unfortunately, we are unable to do this as there is an error:<br>
`'Wow' has a raw type that depends on itself`

Ok. I guess I'm going to have to be a little more creative then.

---
**Attempt 2: Protocol**<br>
My second thought was to have the enum depend on a protocol. Sadly, protocols cannot be extended to conform to other protocols. I don't think this will work, because our enum will be confused about if _it_ is conforming to a protocol, or it's _raw type_ is.

```swift
enum Wow: This1 {
    case dude = "wow"
    init?(rawValue: String) { self = .dude }
    var rawValue: String { return "" }
    init(stringLiteral value: String) { self = Wow.dude }
}

protocol This1: ExpressibleByStringLiteral, RawRepresentable {
    init(stringLiteral value: String)
}
```

Yep. We are getting an error:<br>
`Enum case cannot have a raw value if the enum does not have a raw type`<br>The enum got confused.

---
**Attempt 3: Depending Circularly**<br>
Next, I thought I could create 2 enums who circularly depended on one another:

```swift
enum O1: O2 { case dude = "dude" }
enum O2: O1 { case dude = "dude" }

extension O1: ExpressibleByStringLiteral { init(stringLiteral value: String) { self = .dude } }
extension O2: ExpressibleByStringLiteral { init(stringLiteral value: String) { self = .dude } }
```

Impressively, Swift was able to catch our ruse:<br>
`'O1' has a raw type that depends on itself`

I even tested up to 10 enums in one large circle and it still didn't work.

---
**Attempt 4: Wrapper Struct**<br>
Now I'm getting a little testy. I will now create a fancy Struct Wrapper tht will wrap our enum. And we'll make our enum's raw value type depend on it.

```swift
enum Foo2: This {
    case ma = 0
    // These 2 lines were included to conform it to RawRepresentable. idk.
    init?(rawValue: This) { self = .ma }
    var rawValue: This { return This(0) }
}

// This is the wrapper.
struct This { var hey: Foo2; init(_ ha: Foo2) { hey = ha } }
extension This: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) { self = .init(.ma) }
}
```
Yay! It worked! Now I can do func stuff like this:

```swift
print(Foo2.ma.rawValue.hey.rawValue.hey.rawValue.hey)
```

---
**Attempt 5: Generic Wrapper Struct**<br>
I'm a little upset that Swift told me I couldn't depend an enum on itself. I'm gonna get back at it and see if I can. I am going to expound on the Wrapper Struct, excpet make it Generic, and set the Generic Value to be our enum.

Hoping to get something like this:
```swift
enum Foo: Wrapper<Foo>
```

```swift
// Here is the struct
struct This<T> { var o: T; init(_ i: T) {o=i} }

// This part gets interesting
extension This: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        // I needed to make a switch statement here
        switch T.self {
            // So that I could capture the type
            case is Foo2.Type:
                // Which allows me to Force-Cast
                self = This(Foo2(rawValue: .init(.ma)) as! T)
            default: fatalError()
        }
    }
}
```

And for our final check:

```swift
enum Foo2: This<Foo2> {
    case ma = 0
    init?(rawValue: This<Foo2>) { self = .ma }
    var rawValue: This<Foo2> { return This(0) }
}
```
It works! I managed to depend it on itself _-somewhat-_

---
**Attempt 6: Optionals**<br>
I forgot! Optionals are wrappers themselves! Then I could do something like this: `enum Foo: Foo?` I really wonder if this is possible. It's much shorter, too.

Here's my first attempt to allow Optional raw value types.<br> Remember, _magic nil_ is not allowed as the raw value of an enum case.
```swift
enum Hi: Bool? {
    typealias RawValue = Bool?
    case boo = true
    case bot = false
    case too = 0 // This turns to `nil`
}
extension Optional: ExpressibleByIntegerLiteral where Wrapped == Bool {
    public init(integerLiteral value: Int) { self = nil }
}
```

---
**Attempt 7: Foo?**<br>

```swift
// This syntax is super neat!
public enum Hi: Hi? {
    // public typealias RawValue = Hi?
    case boo = "boo"
    case bot = "bot"
    case too = 0
}

// Switched some strings here. I bet I could shrink this down some more.
extension Hi: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        switch value {
            case "boo": self = .boo
            case "bot": self = .bot
            default: fatalError()
        }
    }
}

// I was able to add a `where` clause to extend only Hi?
extension Optional: ExpressibleByIntegerLiteral where Wrapped == Hi {
    public init(integerLiteral value: Int) { self = nil }
}
```

But I think I love being able to do this the most:

```swift
Hi.too.rawValue?.rawValue?.rawValue?.rawValue?.rawValue // etc.
```

---

Awesome! This was super great!

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```