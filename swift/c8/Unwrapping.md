# **Unwrapping**

We've talking about wrapping values. But what about unwrapping them??

There are **many** different ways to unwrap. I have 5 examples, however most I will discuss in greater detail in the next lessons.

---
# **1. <sub><sup>Simple Equivocation</sup></sub>**

You've seen this before, I'll show you the pros and cons.

```swift
let foo: Bool? = true

if foo == true {
    // do this!
} else {
    // do this instead!!
}
```

**Cons:** If foo is `true`, we're good, but if it is `false` or `nil`, it runs the other code instead.

Why is this a con? Because.. Let's try with Ints.

```swift
let foo: Int? = nil

if foo == 100 {
    // do this!
} else {
    // Foo was not 100
}
```

Usually we want to make a special case for `nil` since, it isn't a number. You could use `else if foo == nil`, but it may get annoying to do this over and over again.

---
# **2. <sub><sup>Force Unwrapping</sup></sub>**

```swift
let foo: Int? = 0

let bar: Int = foo!
```

Woahhh.. huh? What's going on here??<br>
    Here's a hint:<br>
`bar` is *forcing* `foo` to become an `Int`. This means when `foo` is `nil`, bad news happens. (aka: Crash)

---
# **3. <sub><sup>Default Value Safe Unwrapping</sup></sub>**

```swift
let foo: Int? = nil

let bar: Int = foo ?? 0
```

Woahhh.. huh? What's going on here??<br>
    Here's a hint:<br>
`bar` is *forcing* `foo` to become an `Int`. However, if `foo` is `nil`, you can provide a default value so your code doesn't crash. This one is very safe.

---
# **4. <sub><sup>Optional Binding</sup></sub>**
```swift
let foo: Int? = 500

if let bar: Int = foo {
    print(bar)
}
```

Woahh!!! What?? If Statements????

If foo is not nil, the if-statement makes a `bar` value, and you can use it inside the code block. Verrry interesting. This is the safest.

---
# **5. <sub><sup>Implicitely Unwrapped Types</sup></sub>**
```swift
let foo: Int? = nil

let bar: Int! = foo
```

Huh?..<br>
Similar to force unwrapping, but it won't crash when `foo` is `nil`. Somehow, this is the most dangerous.

---

Well that was an overview. Let's break each one down.


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```