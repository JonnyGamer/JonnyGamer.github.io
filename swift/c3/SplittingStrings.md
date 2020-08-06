# **Splitting a String**

I have a fancy idea. What if we had a String like this:

```swift
"Welcome to Swift Master Class and Waffles"
```

And what if you turned our String into an `Array`!!<br>
<sup>Like this:</sup>

```swift
["Welcome", "to", "Swift", "Master", "Class", "and", "Waffles"]
```

WOAH! Could this be?

---
**Simple Solution**

```swift
"ha ha".split(separator: " ")
// returns ["ha", "ha"]
```
Wow! Check out this epic method! It works, too!

---
**((((Removing Puncuation!!!)))**<br>
None of us like punctuation... <sub><sup>It's the worst! *</sup></sub>

Notice this:
```swift
"Hello, World!".split(separator: " ")
// returns ["Hello,", "World!"]
```

I don't appreciate that punctuation there. Let's get rid of it! Shall we?

---
**Components**

```swift
let foo = "Hello, World! Hello? Hello, Hello..."

let words = paragraph.components(separatedBy: [",", " ", "!", ".", "?"])
// words is ["Hello", "World", "Hello", "Hello", "Hello"]
```

Cool! We can define an `Array` of things we want out. This is great! But.. Maybe it isn't. There are *sooo* many Unicode Characters out there. How will I get rid of all of them!?

---
**Regular Expressions**<br>
This is advanced. So I'll keep it short.

```swift
let foo = "(..#   Hello,,(---- World   ".split {
    String($0).range(of: #"\w"#, options: .regularExpression) == nil
}
print(foo) // ["Hello", "World]
```

Notice the `.regularExpression` this pairs with `#"\w"#` which is a fancy way of saying:
>Only include Letter-Like and Number-Like Characters

Note the use of Regex fancy Meta Character: `\w`

---
**Simpler Please?**<br>
There's a simpler way of doing this. Right?? Sort of.

Here's how to include only Letters and Numbers from ASKII. (This just means a-z, A-Z, and 0-9)

```swift
let foo = "(..#   Hello,,(---- World   ".split {
    !($0.isASCII && ($0.isLetter || $0.isNumber))
}
print(foo) // ["Hello", "World]
```
Wonderfully Advnaced!

---

This is quite advanced, even for me.

Notes from [SO-25678373](https://stackoverflow.com/questions/25678373/split-a-string-into-an-array-in-swift) and [my answer](https://stackoverflow.com/a/63288621/13426627)

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```

\* Punctuation is actually not the worst