# **Increased Interpolation**

Say hello to Interpolation: The ability to insert anything inside of your String. And I mean anything.

**What is this Magic?**<br>
You already know how to interpolate.

`"This statement is: \(true)"`

is a fancy way of saying:

`"This statement is: true"`

Without the option for a typo.

---
**Here's something Advanced**<br>
Right off the bat, here we go. How many Characters are in this String:

`"We are \(100) years old"`

If you counted 23 Characters, that is a good attempt. However, what does this String turn into?

`"We are 100 years old"`

See how the `\()` just disappeared? It's gone!

---
**Wondering if I can do this:**<br>
`"\()"`

Turns out, if you leave an interpolation empty, Swift gets a little grumpy:

`Missing argument for parameter #1 in call`

---
**Interpolate a String?**<br>

Is it possible insert a String within a String?

`"Hello there. \("Hi.")"`

Turns out it is! This resolves to:

`"Hello there. Hi."

---
**How many Sub-Interpolates cna I get?**<br>
Hmm.. Let's see..

We can definetely do this: `let a = "\("\("foo")")"`

Hey look:

`"\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("\("a")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")")"`

As soon as I hit 99 interpolations, something happened!
`An internal error occured. Source editor functionality is limited. Attempting to restore..`

My project still runs, but the color-coded text broke and is now black. <br>Let's see if I can keep this up.

---
**We found the limit**<br>
Around 300 interpolations, Xcode literaly crashed. I saw a little error: `Abort trap: 6` and then Xcode disappeared.

Well, that was cool to learn. I never new it did that. This goes for a pretty valuable Stump Me.

---
**HEY WAIT**<br>
I'm literally unable to open my project again in Xcode, so I'm gonna have to edit the file, and then relaunch.. I hope I didn't just break it.

(I had to open the file in a basic text editor to prevent it from crashing. Woah.)

Thatwasweird. It works again. <sub><sup>Maybe I'll have to report that as a bug later</sup></sub>

---

```swift
}
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```