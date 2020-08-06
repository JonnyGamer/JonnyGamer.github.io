# **String into Array**

Another conversion! Let's turn a String into an Array. How will this look? Each `Character` in the `String` will be elements in the `Array`.

Example:

```swift
"hello"
// will turn into
["h", "e", "l", "l", "o"]
```

Turns out this is very difficult. Especially without loops.

---
**I wonder what this does?**

```swift
let foo = "hello".reduce(into: [String]()) { 
    $0.append(String($1))
}

print(foo) // prints ["h", "e", "l", "l", "o"]
```

Hey look! We got it working!!

But.. What in the world is this code!? Where did `$0` and `$1` come from!? This is very advanced, we will be learing it *much* later, so I'll break it down and explain what's going on.

---
**Reduce**<br>
`"hello".reduce` the reduce method is for `Collection Types` you can use it on Strings or Arrays, etc. The reudce method let's us reduce this String *into* something else.

- For example, we can reduce this *String* into another *String* with the `l`s
- or I could reduce it into an `Int` and give us the number of `l`s used.
- But this time, I reduced it into an `Array\String>`

The reduce method is very complicated and I will not explain it in detail here.

---
**$0 and $1**<br>
What's the deal with the dollars!? Note this code:

```swift
    $0.append(String($1))
```

What do you think is happening here?? Can you spot anything familiar?

- `String()` - We are turning `$1` into a `String`
- `append` - Then, we append it to `$0` which looks like an `Array<String>`

Pro tip: The `$1` is the current `Character`, and the `$0` is our final Array of Strings.

WOAH! Don't worry, this is super complex Functional Oriented Programming.

---

At least we figured out how to turn a String into an Array!


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```