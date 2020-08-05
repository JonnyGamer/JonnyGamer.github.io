# **Stealing Names**

Check out this indestructable feature!

Have you ever wanted to use the name `let` or `var` as the name of one of your values like this??

```swift
let let: Int = 5
```

Oh I bet you've tried. It doesn't work.

But can we *make* it work?? (oooh)

---
**Backticking**

I've just only recently discovered this potential technique:

```swift
let `let` = 5
let foo = `let`
```

If you include those little backticks ``` `let` ``` Swift says it's A-OK. However, when referring to it, you must still include those backticks ``` `let` ```

Sometimes this isn't the case, but I'll have to show you in a later chapter.. ooh..

---
**Where does backticking work?**<br>
Just like this:

```swift
let `foo` = 5
var bar = `foo`  // Ok
bar = foo        // Still OK
```

Notice how we defined foo with backticks, but we can use it with and without backticks?

Incredible!!

However, theresince `let` is a special keyword, we cannot use it without backticks (sometimes).


---
**LIST LIST LIST**<br>
Here's a list of *keywords* that you currently know that you can *steal* by *backticking*.

- true
- false
- let
- var
- _


>**Quote from the Swift Documentation:**<br>
>If you need to give a constant or variable the same name as a reserved Swift keyword, surround the keyword with backticks (`) when using it as a name. However, avoid using keywords as names unless you have absolutely no choice.

---
**Using other names?**

Do you think this is possible?

```swift
let Int: Int = 5
let foo = Int
```

Hmmm..

YES! It is possible!

How amazing wonderful.

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```