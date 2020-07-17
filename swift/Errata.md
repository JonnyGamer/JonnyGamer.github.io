# **Strange Errors**

Swift changes over time. Some code that you may write might not be correct in future versions of Swift. Some things that I've taught you might not be correct in future version of Swift. Even over the course of time in making this course, I've found some things in Chapter 1 that have changed:

---
**Single Quote Strings Removed - Swift 1.1**<br>
Remember how I told you you could make Strings like this: `"haha"` and `'haha'`?<br>
You now recieve this error if you try to write `'haha'`:<br>
   `Single-quoted string literal found, use '"'`

Oh.. When was this changed? Back in [May 13, 2014](https://github.com/apple/swift/blob/master/CHANGELOG.md#2014-05-13) Oh..

Fun Fact about single quoted String literals. They were changed in [April 3, 2014](https://github.com/apple/swift/blob/master/CHANGELOG.md#2014-04-30) to be only for Single-Character Strings: `'a'` was allowed, but `'foo'` was not. Huh.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```