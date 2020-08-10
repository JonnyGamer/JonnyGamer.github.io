# **Safe Guarding**

I've hidden a little something from you. `guard statements!!` They are similar to `if-statements` but they are *super* interesting.

Guard Statements are like `if-statements`, except that if something is `false`, guard statements want to break your code.

Here's a simple guard statement:
```swift
guard false else {
    fatalError()
}

_ = "This code never runs"
```

Guards are funny like this. I'll go into more detail about guards when we learn about *FUNCTIONS*.

---
**GUARD CASE LET**<br>
Guards have this magical quality of doing this:

```swift
let foo = false

guard case let this = foo else {}

print(this) // false is printed
```

Unlike if-statements, Guards let you make a value, and use it *Outside of the Scope!!*

---
**Here's another way to write the same code:**<br>
Except we've changed `guard case let` just to `guard let` hmm.. And I've added `Optional` what's that I wonder!?

```swift
let foo = false
guard let this = Optional(foo) else { fatalError() }
print(this) // false is printed
```

---
**Guard Var**<br>
You can even make `guard case var`

```swift
let foo = false

guard case var this = foo else {}

this = true
print(this) // true is printed
```

---
## **Reassigning LET**
I promised to show you how to mutate a `let constant`. Well, to be honest I didn't know if it was possible. But now I've figured it out!!

```swift
let this = true
print(this) // this is true

guard case let this = false else {}
print(this) // this is false

guard case let this = true else {}
print(this) // this is true
```

How incredibly MAGICAL!

---
## **Type MUTATION**
With the aforementioned method, you can even mutate the `type` of a value! Previously thought to be impossible except with `Any`

```swift
let this = true
print(type(of: this)) // Bool

guard case let this = 1 else {}
print(type(of: this)) // Int

guard case let this = 1.0 else {}
print(type(of: this)) // Double
```

Swift isn't a TYPE SAFE LANGUAGE anymore!! Ahhh!!!

---
**Even Separated by Commas**

```swift
let this = true
guard case let this = false, case let this = 1 else {}
print(this) // 1
```

Ok this is way cool I never knew you could do *all this* woah!

---
Monumental.

So much for *safe* guarding.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```