# **Bool vs Boolean**

```swift
// The following extension provides an expansion on the topic of Booleans just in case you wanted a little more. Some deeper insight is provided here to some things that you may notice me using.

extension Chapter1: BoolVsBoolean {
```

---

**What are they called:**<br>
Boolean - /bool/ee/in/<br>
You've seen me call then `Bool` and you've seen me call them `Boolean`. But, which one is it?

It's: `Bool`

---

**Actually..**<br>
Did you know in an old version of Swift, Bool was actually Boolean! According to [this article](https://stackoverflow.com/questions/40776830/swift-bool-vs-boolean), the Type of `true` and `false` used to be Boolean and not Bool. (Like in Swift version 1. Several years ago.)

---

**Is it with us today?**<br>
In some cases, Swift lets us write old code. Can we still write Boolean? Let's try with my Swift 5.3:

```swift
let a: Boolean = true
```

`Error: Cannot find type 'Boolean' in scope; did you mean to use 'DarwinBoolean'? Replace 'Boolean' with 'DarwinBoolean' - (fix)`

This means that the Swift engineers have completely removed `Boolean` from their system. But hey, what's this DarwinBoolean? Let's click the fix button and see what happens:

```swift
let a: DarwinBoolean = true
```

DarwinBoolean conforms to the `ExpressibleByBooleanLiteral` protocol. And look at this true statement:

```swift
a.boolValue == true`
```

---
**Practicality of Darwin Booleas?**<br>
It appears as though that Darwin Booleans are a simplified version of the Regular Boolean Object. I've never seen this before today, but this is very interesting. I'll do some more research on it.

---

**What really is Darwin Boolean?**<br>
According to [this article](https://stackoverflow.com/questions/33667321/what-is-darwinboolean-type-in-swift) (the only article I could find about DarwinBooleans) the DarwinBoolean is a C type boolean. There's actually 3 types of Booleans:

- Bool - The Swift Boolean we all know and love. Used to be called Boolean.
- ObjcBool - Objective C's Boolean made for Swift
- DarwinBoolean - C's Boolean made for Swift

Huh. I never knew this! Cool.

---
**But wait, there's more**<br>
I've figured out a history of the word Boolean in Swift. It's been changed a few times.. [According to this](https://stackoverflow.com/questions/27304158/type-boolean-does-not-conform-to-protocol-booleantype/27304432#27304432)

- Swift 1 - Boolean used to just be Boolean.
- Swift 2 - Boolean changed to be a typeAlias of the UInt8 data type.
- Swift 3 - Boolean up and removed. Compiler asks if you mean 'Darwin Boolean'

---
**Can we use it today??**<br>
If you truly want to be able to use Bool or Boolean interchangeably, just put this piece of code in the top level of your program:

```swift
typealias Boolean = Bool
```

Now you'll be able to use it whenever and it will still mean Bool! (But apparently, `BooleanLiteralType` already does this. Ha.)

---

```swift
}
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```