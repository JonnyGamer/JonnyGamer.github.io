# **Consistent Whitespace**

This lesson expounds on Chapter 4 - Flavors (Specifically Infix Operators) but I'll add this in here just to blow your mind a little.

```swift
let a = 1
```
Notice the form of this. Notice how there is a space bar betwixt the `a` the `=` and the `1`.

Notice that there *must* be consistent space betwixt.

```swift
// as these cause errors
// You may not have only 1 side without whitespace.
let a= 1
let b =1

// but this is ok, since both sides have no space.
let c=1
```

But let me show you another valuable trick.

---
**Large Whitespace??**<br>
Note the use of the word *consistent*

Is it possible to have more than 1 spacebar betwixt??<br>
Let's tr it out:

```swift
let a  =  1
let b =        1
let c          =              1
```

Hot dog, there's consistent white space here! These are all ways you can create values too. Although very strange ways, I don't recommend doing this.

---
**Other Whitespace??**<br>
Truth be told, there's different kinds of whitespace out there. If you've read the *Invisible Names* segment, you'll know that the Zero Width Character is not a space, and neither are the Override Characters. But what about the `Enter` key? And `Tab`? And `Non Breaking` counterparts??

- U+000D - Carriage Return (CR)
- U+0008 - Backspace
- U+0009 - Character Tabulation
- U+0020 - Space <sub><sup>(we already did this one)</sup></sub>
- U+00A0 - No-Break Space
- U+202F - Narrow No-Break Space

---
### **Carriage Return** (The return key)
```swift
let foo

=

5
```
Turns out this is ok with virtually as many or as little carriage returns as you'd like. Even over 5,000 of them! Funny!

---
### **Backspace** (The backspace key??)
OK. What does U+0008 even do? [Idk.](https://stackoverflow.com/questions/8540130/what-is-the-purpose-of-unicode-backspace-u0008)

Turns out it doesn't work in Xcode. Not even if you put it within a String! You'll see this:

`Unprintable ASCII character found in source file`

ooh. I know! I'll Unicode Interpolate it like this!

```swift
let foo = "\u{0008}"
```

In fact it *does* work!! It *is* printable. What are they doing. Sillies.<br><sup><sub>related: I kind of want to make a list of all error messages and how to trigger them. And work around them.</sub></sup>

---
### **Character Tabulation** (The tab key)

```swift
let foo =   0
```

Both sides have a tab space! Note that they are inequal, too. Funny.

But hang on! Are those tabulated spaces?? No! My tab spaces turned into regular spaces!!! How can I fix this!?

Turns out hitting the **tab** key won't do. I *must* paste in `U+0009` like so:

```swift
let foo	=	0
```

It works here.. but not in my Swift. My Xcode project still breaks it down into spaces. Aw. Let's try [my epic online playground](https://swift-playground.kishikawakatsumi.com/) for a change!

(Ha it has a funny result. If you paste `U+0009` in, it tabs the *whole* line)

Oh well I give up on this one.

But no!!

What if I paste my example code into it?? `let foo	=	0`

It works!!! Let's try to run it.. hahaha!

It works!!

If you put it in a String: `let foo = "	"` we get the `Unprintable` error again. Hmm. But adding in `\u{0009}` will work. This is awesome!

---
### **No-Break Space** (Option Space)
It works and we get this epic warning:<br>
`Non-breaking space (U+00A0) used instead of regular space`

---
### **Narrow No-Break Space**
This one just didn't work. Sad.

---
Wow this article was a lot longer than I thought it would be.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```