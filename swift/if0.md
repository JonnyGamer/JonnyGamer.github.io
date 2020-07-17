# **if 0 { }**

**Preface**<br>
In an old version of Swift, a handy protocol `BooleanType` existed. Using this protocol, you could do many magical things. Including this:

```swift
extension Int : BooleanType {
    public var boolValue : Bool {
        return self > 0
    }
}
if 0 {}
```

Notice how the `0` is now considered a Bool! Incredible! Impeccable! But there's one thing..

---
**Where are you BooleanType**<br>
As of Swift 3 in [SE-0109](https://github.com/apple/swift-evolution/blob/master/proposals/0109-remove-boolean.md), the BooleanType was removed. This spurred many threads accross the internet, asking: "Is it still possible to if 0 {}"

The main concensus is, "No, it is not currently possible"

But these are only nay-sayers. They closed it out of spite because according to them, `if 0 {}`, is highly unreadable. Which it is. But that does not make it bad. <sub><sup>At least to me</sup><sub>


Unfortunately, when I do it on Swift 5.3, this is what happens:
```swift
extension Int: BooleanType {}
```
`Error: Cannot find type 'BooleanType' in scope`

Nooooooooooooo

---
**My Research**<br>

I first came across [this article](https://stackoverflow.com/questions/32892734/swift-boolean-checking) which was outdated and provided very old code. This was actually the article initially that caused my interest in this.

[Type 'Int' does not conform to protocol 'BooleanType'](https://stackoverflow.com/questions/28613532/type-int-does-not-conform-to-protocol-booleantype) - This article described that it is not currently possible.

I was pointed [here](https://developer.apple.com/forums/thread/53405) and it was not helpful whatsoever.

From there, I was directd to [SE-0109](https://github.com/apple/swift-evolution/blob/master/proposals/0109-remove-boolean.md) which made me very sad indeed.

---
**Can enum help us?**<br>

After seeing many counterexamples, I had a good thought. Since enums can inherit from the StringProtocol, why not Booleans? It's a good thing true and false are [not considered magic literals](https://bugs.swift.org/browse/SR-12998?jql=project%20%3D%20SR%20AND%20issuetype%20%3D%20Bug%20AND%20text%20~%20%22magic%20literal%22).

So I attempted this, thinking it would work:

```swift
enum Foo: Bool {
    case bar = true
}
```

`Error: 'Boolean' declares raw type 'Bool', but does not conform to RawRepresentable and conformance could not be synthesized`

I've attempted this before, and I've seen this error, and I've given up before. But I wanted to make one last attempt.


---


**Ahh, here it is**<br>
I finally stumbled across [this answer](https://stackoverflow.com/a/42295661/13426627) which finally did the trick:

```swift
extension Bool: ExpressibleByIntegerLiteral {
    init(integerLiteral value: Int) { self = value != 0 }
}
if 1 { print("1 is true!") }
```

There you go! Simply incredible. Whenever Swift wants a Boolean Expression, but sees an Integer instead, it runs that custom init method and turns the Int into a Bool. In this case, 0 = false, any other number is true.

Examples:
- `if 1 {}`
- `func foo() -> Bool { return 1 }`
- `let foo: Bool = 1`
- `let foo: (Bool, Bool) = (1, 1)`

You can even write `print(1 as Bool)` and it will print `true`

Simply Magical.

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```