# **Overflow Operators**

Here's something annoying:<br>
`1 + .max`

Is there any way around this??
Sure! Use the Overflow Operators - they wrap around if the minimum value.

---

Value | + | Value | == | Result |
:-- | :--: | :-- | :--: | --:
`1` | `&+` | `.max` | `==` | `-.max`
`-.max` | `&-` | `1` | `==` | `.max`
`UInt.max` | `&+` | `1` | `==` | `0`
`UInt(0)` | `&-` | `1` | `==` | `UInt.max`
`(Int.max / 2) + 1` | `&*` | `2` | `==` | `Int.min`
`(Int.max / 2) + 1` | `&*` | `2` | `==` | `0`

Yo.


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```