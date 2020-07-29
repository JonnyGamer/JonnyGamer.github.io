# **Unicode Interpolation**

This is a cool feature in Swift Strings. In fact, we can add it to our list of _Meta Characters_

Ever had a Character like ﷽ or something that just breaks the line spacing in you Xcode or slows down your document because it's obscure?

Ever had a Character like: →​← The Zero Width Character (I've hidden it in between those arrows) and you just can't see it??

Or have you ever had a ‮backwards character?<br>
Yes???

Well this chapter is just for you!! Remember how I told you every character has a special number assigner to it?? We'll be using this greatly in this lesson

---
**Let's begin**<br>
Look at our new *Meta Character*: `\u{}` fancy

Let's try it out. What do you think this is: `"\u{0041}"`?<br>
It's... ...   ... `"A"`

Wow! Tricky!

---
**Lesson 1**<br>
What's this: `"\u{1F600}"`

It's...

`"😀"`

---
**Simple Q**<br>
Which one is more correct:
`"\u{1f600}"` or `"\u{1F600}"`

They're both correct! Amazing! They both are equal to `"😀"`.

---
**Lesson 2**<br>
What do you think _this_ one is??

`"e\u{301}"`

It's...

`"é"`

Huh? If we look at Unicode Character U+0301, we'll see it is the: `COMBINING ACUTE ACCENT`. The _combining_ part is important. It combines with the previous letter :o

---
**Lesson 3**<br>
My favorite! What do you think this is??

`"\u{2192}\u{200B}\u{2190}"`

It's..

`"→​←"`

But.. There's only 2 Characters. Where did the 3rd one go??<br>
Oh.. That's because I've hid a Zero Width Character in the middle of the arrows. You cannot see it. But it's definition is U+200B. Go ahead and copy it and text it to your friends.

---
# **Interpolate This**
So `\u{}` is a _Meta Character_.. Can add it in through String Interpolation?

• We can do this just fine: `"\("\u{41}")" == "A"`

• But if I try this: `"\u{\(41)}"`<br>
I get a small error: `Expected '}' in \u{...} escape sequence`

So.. Maybe it isn't possible..

• Trying this out doesn't work either: `"\("\\u"){\(41)}" == "\u{41}"`

Hmm. This is a Stumper. According to [this answer](https://stackoverflow.com/a/32555223/13426627) it is not possible. But we _can_ do this:<br>
• `String(UnicodeScalar(Int(41, radix: 16)!)!) == "A"`

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```