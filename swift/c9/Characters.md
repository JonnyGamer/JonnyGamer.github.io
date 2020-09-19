# **"C" "h" "a" "r" "a" "c" "t" "e" "r" "s"**


I think I've mentioned Characters before to you. Here's a basic sumary:

```swift
let word = "Hello"
print(type(of: word.first))
// Optional<Character>
```

Woah.. Hang on.. Character? Is this a new type?? (yes.)

Things Noted:
- the `first` method produces an optional
     - This Because the empty String `""` does not have a first Character
- The first letter is not a String. It's a `Character`.

This can get quite confusing..

---
# **Looping through a String**

Looping through Strings is *seemingly* simple:
```swift
for letter in "Hello" {
    print(letter)
}
// H
// e
// l
// l
// o
```

However there is one dangerous thing about Characters..

```swift
for letter in "Hello" {
    print(letter)
    print(letter + letter) // ERROR!
}
```

You are not allowed to add them together.. (No idea why. We'll fix this in our Custom Operators Chapter.)

---
# **String / Array Similarities**

- Arrays are collections of `Whatever Type you Want`.
- Strings are collections of `Charatcers`.

Strings are different because they are *always* collections of `Characters`.

Strings are similar to arrays, for example, you can use the `append` method on a String:

```swift
var superString = "Hello, World"
suoerString.append("!")
suoerString.append(" Wowowow!")
print(superString) // Hello, World! Wowowow!
```
How impressive.

---
# **Subscripting** <sup>[A String Secret..] <sub><sup><sup><sub>That I just figured out right now

***Very Simple Q:*** Is it possible to use subscripts on String, like Arrays??<br>   • Like: `"Hello"[0] == "H"`

***Very Simple Answer***: <sup><sub>(sort of)</sub></sup>
<br>Great..

---
### **Indices**

I just learned about the `indices` property. Apparently Arrays have this too. I'll show you how it works:


```swift
let array = [1, 2, 3, 4]
let indices = array.indices
print(indices)
// 0..<4

for i in indices {
    print(array[i])
}
// 1
// 2
// 3
// 4
```

In the middle of this code block, you can see `indices` prints `0..<4`<br>
This is merely an easier way to say: `0..<array.count`

Cool!

Let's try it with Strings:


```swift
let word = "Hello"

for i in word.indices {
    print(word[i])
}
// H
// e
// l
// l
// o
```

Amazing!

But wait. I forgot to print the indices. Let's see it:

```swift
print("Hello".indices)
// DefaultIndices<String>(_elements: "Hello", _startIndex: Swift.String.Index(_rawBits: 1), _endIndex: Swift.String.Index(_rawBits: 327681))
```

...

...

...
## WHAT!<br><br><br>
---
# **Easier String Subscripting**

Ok I don't know how I'll explain myself out of this one. When we learn about Rgular Expressions, hopefully I'll have a better explanation.

I did manage to create a new way to subscript. With Ints.

```swift
extension String {
    subscript(_ value: Int) -> Character {
        return self[String.Index.init(utf16Offset: value, in: self)]
    }
}

let word = "Hello"
print(word[0]) // H
print(word[1]) // e
print(word[2]) // l
print(word[3]) // l
print(word[4]) // o
```

Much better (except for that huge extension at the top.)


---


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```