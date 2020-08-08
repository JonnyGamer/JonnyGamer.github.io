# **UInt**

Check out a *Brand New Type!*

`UInt`

What does it do!? <sup><sub>What does it do!?</sup></sub>

UInt stands for `Unsigned Integer` which means: "It cannot be Negative"

ooooh..

It also is created through Binary Values.. `10 == 3`

---
**Many UInts**

- Int is 64 bit. `Int.max == 9223372036854775807`
- UInt is 64 bit. `UInt.max == 18446744073709551615`

How can this be!? How can UInt be a bigger number??

Ah, but that's because `Int` can hold negative values. Half are used for positive values, and half are used for negative values: `Int.max == UInt.max / 2`

Woah..

Max | Value
:-- | ---:
`UInt64.max` | `18446744073709551615`
`UInt32.max` | `4294967295`
`UInt16.max` | `65535`
`UInt8.max` | `255`
`Float.greatestFiniteMagnitude` | `3.4028235e+38`
`Double.greatestFiniteMagnitude` | `1.7976931348623157e+308`
`Float80.greatestFiniteMagnitude` | `1.189731495357231765e+4932`

<sup>I Like to use [`BigInt`](https://github.com/attaswift/BigInt)</sup>


---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```