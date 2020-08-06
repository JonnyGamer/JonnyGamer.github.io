# **Word-Like Operators**

Why are operators always symbols? Is it allowed? Are there *any* operators that are words?

What do the Swift Engineers say about this?

---
Quote from [Swift Evolution - Commonly Rejected Proposals - Operators](https://github.com/apple/swift-evolution/blob/master/commonly_proposed.md#basic-syntax-and-operators)

# **Basic Operators**

- [Replace {} brace syntax with Python-style indentation](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20151214/003656.html): Surely a polarizing issue, but Swift will not change to use indentation for scoping instead of curly braces. [It's weird that they *do* have this syntax within `Switch Statements` in which we'll learn in Chapter 7]

- [Remove `;` semicolons](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20151214/002421.html): Semicolons within a line are an intentional expressivity feature. Semicolons at the end of the line should be handled by a linter, not by the compiler. [I haven't taught you these yet.]

- [Replace logical operators (`&&`, `||`, `!`, etc.) with words like "and", "or", "not"](https://lists.swift.org/pipermail/swift-evolution/2015-December/000032.html), and allow [non-punctuation operators](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20160104/005669.html) and infix functions: The operator and identifier grammars are intentionally partitioned in Swift, which is a key part of how user-defined overloaded operators are supported. Requiring the compiler to see the "operator" declaration to know how to parse a file would break the ability to be able to parse a Swift file without parsing all of its imports. This has a major negative effect on tooling support. While not needing infix support, `not` would need operator or keyword status to omit the parentheses as `!` can, and `not somePredicate()` visually binds too loosely compared to `!somePredicate()`.

- [Replace `?:` ternary operator](https://lists.swift.org/pipermail/swift-evolution/Week-of-Mon-20151214/002609.html): Definitely magical, but it serves a very important use-case for terse selection of different values. Proposals for alternatives have been intensely discussed, but none have been "better enough" for it to make sense to diverge from the precedent established by the C family of languages.

---

Personally, I disagree with the reasons of not allowing word-like operators. I hope they add it in the future.

**My reason**: Because *they do* have a few named operators. But *we* cannot make our own. :(

---
# **Word-Like Operators** <sub><sup><sub><sup>That Secretly Exist</sup></sub></sup></sub>

According to the [Operator Precedence List](https://developer.apple.com/documentation/swift/swift_standard_library/operator_declarations) there are a couple *word-like infix operators*. And they are..

- **is** - Type Checking Operator (ex: `1 is Int == true`)
- **as** - Type Casting / Coercion Operator
- **as?** - Optional Type Casting / Coercion Operator
- **as!** - Forced Type Casing / Coercion Operator

There is also these ones that are basically *word-like prefix operators*
- **try** - Run some code that may throw
- **try?** - Optionally run some code that may throw (becomes `nil`)
- **try!** - Forcefully run some code that may throw (may crash! :0 )

Like, dude.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```