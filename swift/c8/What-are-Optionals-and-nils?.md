# **What are Optionals and nils?**

You have made it to your first *Intermediate Chapter*. Welcome to *Intermediate Swift*. Optionals play a HUGE role in Swift, however, for me, they were very hard to learn. Everywhere I went, they said, `"Oh! I can teach you Optionals the easy way"`. But they were bluffing. Optionals certainly are tricky.

I promise that Optionals will be your greatest friend in Swift. One way I'll teach this differently than most is that I wont hide from you how `The Optional` was created, where it's used, and why it's used. So let's begin!

---

**Overview:**
>Optionals are like a wrapper. Or a present. If you open it up, they could be something very nice inside, or maybe there is nothing inside.

This is somewhat true. Optionals are like a present. However, *you* have access to what is inside the present. *You* can determine whether there is something inside or not.

---

**First Example:**

Say we have this array:

- `let foo = [1, 2, 3, 4, 5]`

What is the starting element of the array? i.e. (`[1, 2, 3, 4, 5].first`)

You might say "It's 1", and you would only be partially correct, because actually it's `Optional(1)`. But why the Optional!?

This is because, on rare occasions, and array may **not** have a starting element. Like this one here:

- `let foo: [Int] = []`

The first element of this array is, `nil`. In other words, there isn't an answer.

---

I've given you a taste as to what Optionals are. And this is as far are normal courses would go. But there is *So Much More* about Optionals that are important. Like, "what are they????"

---

# **The Optional Type**

The Optional Type is a special one.

 - The `Int` is a basic struct.
 - The `Array` is a Generic Struct, which means it can store Types: 
    - `Array<Int>`
    - `Array<Array<String>>`
- The `Optional` is similar to an Array, in that it can store types:
    - `Optional<Int>`
    - `Optional<String>`
    - `Optional<Optional<Int>>` - This is incredibly rare and you won't see it.

Optionals are Generic, just like Arrays. However, Optonals are not structs. They are enums. This is because their is a cool use-case with switch-statements. We will discuss why this is in a future lesson. However, here's some examples of making optionals:

---

Here's 4 ways to do the same thing:

```swift
var a: Optional<Int> = Optional(1)
var b: Int? = Optional(1)
var c: Int? = .some(1)
var d: Int? = 1
```

And here's 4 ways to save a nil:

```swift
var a: Optional<Int> = Optional(nil)
var b: Int? = Optional(nil)
var c: Int? = .none
var d: Int? = nil
```

Notice that `nil`? It's *very special!!!* It is a keyword like `true` and `false`. But it's DIFFERENT!

---
# **Special Optional Inference**

This is *a very cool concept* about Optionals

```swift
let foo: Int = 1
let bar: Int? = foo
```

Woah!

---


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```