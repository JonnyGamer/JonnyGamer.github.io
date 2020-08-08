# **Bitwise Operators**

What if we counted in Binary for a change. Hmm.<br>
What if we swapped `false` for `0` and `true` for `1`??

You know how `true || false == true`<br>
What if `1 | 0 == 1`

Oooh..

---

### **Bitwise OR**
Left | Operator | Right | Equals | Result
:--: | :---: | :--: | :--: | :--:
`0` | `|` | `0` | `==` | `0`
`0` | `|` | `1` | `==` | `1`
`1` | `|` | `0` | `==` | `1`
`1` | `|` | `1` | `==` | `1`

---

### **Bitwise AND**
Left | Operator | Right | Equals | Result
:--: | :---: | :--: | :--: | :--:
`0` | `&` | `0` | `==` | `0`
`0` | `&` | `1` | `==` | `0`
`1` | `&` | `0` | `==` | `0`
`1` | `&` | `1` | `==` | `1`

---

### **Bitwise XOR**
Left | Operator | Right | Equals | Result
:--: | :---: | :--: | :--: | :--:
`0` | `^` | `0` | `==` | `0`
`0` | `^` | `1` | `==` | `1`
`1` | `^` | `0` | `==` | `1`
`1` | `^` | `1` | `==` | `0`
<sup><sup>So that's where the `^` operator went..

---

### **Bitwise NOT**
Prefix | Number | Equals | Result
:--: | :---: | :--: | :--: |
`~` | `Int.max` | `==` | `Int.min`
`~` | `Int.min` | `==` | `Int.max`
`~` | `0` | `==` | `-1`
**Look:** | | | |
`~` | `UInt()` | `==` | `UInt.max`
**What!?** |

---

# **Shifting Operators!**

It literally *shifts* the Binary Digits to the left or right!

### **Bitwise Left Shift**
Left | Operator | Right | Equals | Result
:--: | :---: | :--: | :--: | :--:
`01` | `<<` | `1` | `==` | `10`
`0010` | `<<` | `2` | `==` | `1000`
`11011` | `<<` | `3` | `==` | `11011000`

### **Bitwise Right Shift**
Left | Operator | Right | Equals | Result
:--: | :---: | :--: | :--: | :--:
`10` | `>>` | `1` | `==` | `01`
`10000` | `>>` | `3` | `==` | `00010`
`111111` | `>>` | `5` | `==` | `000001`


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```