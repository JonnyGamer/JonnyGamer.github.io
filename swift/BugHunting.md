# **Bug Hunting**

One of my favorite parts of Swift is hunting for bugs. In this segment, I'll be searching for bugs, related to Chapter 1, that break the Swift compiler.

---

# **Bugs Found**
**The Hyper-Interpolated Bug**<br>
Turns out, if you nest 99 String Interpolations, some source functionality. It still compiles, but all the text turns black and loses it's color-coded appearance. (Same for Interpolated Strings for form `##"\##()"##` etc.. Always 99.)

**Fun fact:** Strings like `##""##` cannot have 1000 `#`s on both sides. Swift says so. I wonder what the maximum number is that still builds.. Oh. It's 256.


---

# Non Bugs
These programs all compiled just fine without issues.
- String of the form: `##"ha"##` except with 145,416 `#`s on either side.
- Int of the form `1___` except with 20,000 `_`s on the right side.
- Int of the form `0_` over and over again 10,000 times.
- Line of code of just `true` 10,000 times. It doesn't work to begin with. However, the more you put, the longer it takes to compile.
