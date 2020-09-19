# **guard let**

This currently causes an error:

```swift
let foo: String? = "hello"
if let fooBar = foo {}
print(foobar) // fooBar was removed after the `}`
```

Is there any way around this??<br>
Yes, there is. But to apply it properly, we'll have to read the chapter about functions.

---
**how to guard let**

```swift
let foo: String? = "hello"
guard let fooBar = foo else { fatalError() }
print(foobar) // hello
```

Check it out! using a `guard-let` does the same as an `if-let`, but it lets you use a value later! However, notice the `fatalError` bit. This will crash your code. This is really as good as a `!` force unwrap. However..

---
**Safe Usage**

Let's say you have a block of reusabe code. And in that reusable code, you have a `guard-let` that ends it early whever a `nil` appears. This would be a safe usage:

```swift
func reuse(_ value: String?) {
    guard let safeValue = value else { return }
    print(safeValue + "Wow!")
}

reuse("foo") // fooWow!
reuse("Wow!") // Wow!Wow!
reuse(nil) // nothing gets printed
```

Pardon the use of `func` we will learn it so soon!

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```