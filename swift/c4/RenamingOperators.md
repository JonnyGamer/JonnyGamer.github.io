# **Renaming Operators**
(Baby Steps to get our way to DIY Operators)

Did you know you can *rename* operators!! What!! Yes indeed, it is most interesting. However, I highly caution against it, as you may forget what your operator means, or you might choose an unwieldy Unicode Symbol.

Also, this is an *extremely andvanced* topic. We will go into *much* more detail later.

---
**Let's Begin.**<br>

Renaming the plus sign. `+` Ooh!

Let's rename it to.. Two Plus Signs!

Hopefully like this: `1 ++ 1`

---
**Code Time**<br>
Conveniently, I've got the code for us!

```swift
infix operator ++ : AdditionPrecedence
extension Int {
    static func ++ (lhs: Self, rhs: Self) -> Self {
        return lhs + rhs
    }
}

1 ++ 1 + 2 == 4
```

WOah! Check it out! What is this incredibleness!

Unfortunately, if you try `1.0 ++ 1.0` it won't work. We've only set it up for `Ints`

Let's add `Doubles` and `Strings`

---
**Give me the code**<br>
please

Just paste this code as well:

```swift
extension Double {
    static func ++ (lhs: Self, rhs: Self) -> Self {
        return lhs + rhs
    }
}
extension String {
    static func ++ (lhs: Self, rhs: Self) -> Self {
        return lhs + rhs
    }
}

1.0 ++ 1.0
"hello" ++ "there"
```

Cool! Except,, it's a little repetitive. Can I Shrink this down a lot??

yes.

---
**Protocol Operators**
I'm gonna assign our `++` operator to Int, Double, and String in *super short code*

```swift
infix operator ++ : AdditionPrecedence
protocol DoublePlus { static func + (lhs: Self, rhs: Self) -> Self }
extension DoublePlus {
    static func ++ (lhs: Self, rhs: Self) -> Self { lhs + rhs }
}

extension Int: DoublePlus {}
extension Double: DoublePlus {}
extension String: DoublePlus {}
extension Array: DoublePlus {}
```

This code *now* lets you do all this:

```swift
1 ++ 1 == 2
1.0 ++ 1.0 == 2.0
"1" ++ "1" == "11"
[1] ++ [1] == [1, 1]
```

Incredible! This is *super super* advanced, so I promise to make all this code very clear much later.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```