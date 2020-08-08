# **Operator Naming Scheme**

Not all symbols are created equal. A few of them are taboo. Some combinations are also a no no. We will be reading today from [The Grammar of an Operator](https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html#grammar_operator) and [Lexical Structure of Operators](https://docs.swift.org/swift-book/ReferenceManual/LexicalStructure.html#ID418)

---

### **Reserved Operators**
Prefix | Infix | Postfix
:--: | :--: | :--:
`=` | `=` | `=`
`->` | `->` | `->`
`//` | `//` | `//`
`/*` | `/*` | `/*`
`*/` | `*/` | `*/`
`.` | `.` | `.`
`?` | `?` | `?`
`<` |
`&` |
 | | | `>`
 | | | `!`

>The tokens =, ->, //, /*, */, ., the prefix operators <, &, and ?, the infix operator ?, and the postfix operators >, !, and ? are reserved. These tokens can’t be overloaded, nor can they be used as custom operators.

---

# **Secret Letter Based Operators**

Here's a cool list that you can use to build word-like operators!
```swift
infix operator ©⁍⁅⸠⸡⸤°⁋®⸉†×
// CDEHLOPRSTX
```

Ahh, but this isn't very cool to make words out of. Anything better?

Yes indeed.

```swift
infix operator -ͣ-ͨ-ͩ-ͤ-ᷥ-ᷛ-ͪ-ͥ-ᷜ-ᷝ-ͫ-ᷠ-ͦ-ͧ-⃚-ͬ-ᷤ-ͭ-ͮ-ͯ-ᷦ
infix operator -ᷞ-ᷟ-ᷡ-ᷢ
infix operator -ᷔ--ᷕ--ᷖ--ᷘ--ᷙ--ᷣ--ᷗ
```

These may not all be visible. But there's an incredible amount of `letters` here. The trick is that `Combining Unicode Characters` were allowed and I combined some of them with a hypen `-`. Allowing for untold adventures.

Check out [this page](https://gist.github.com/Sajjon/8c227a8610efa58fa6c3bea2ee2cdfa1#additional-allowed-characters-for-operators).


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```