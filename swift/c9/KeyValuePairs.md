# **KeysValuePairs**

A very rare Swift Type! I heard of this only recently, so today will be the first time I check it out!


| | | |
| -: | :-: | :- |
| `Array` | *is to* | `Set` |
| | *as* | |
| `KeyValuePairs` | *is to* | `Dictionary` |

---
## **Huh?**

`KeyValuePairs` are the same as `Dictionaries`, but they are allowed to hold duplicate elements.

Let's try it out.

```swift
let keyValuePair: KeyValuePairs<String, String> = [
    "Foo" : "Bar"
]

print(keyValuePair[0])
// prints (key: "Foo", value: "Foo")
```

Some crucial features we must note:
- *Must* explicitely define as `KeyValuePairs<String, String>`, else Swift will think you are making a normal dictionary. (Same rule as Set)
- Subscripting is *always* with Ints. Note the `[0]` takes the first element.
- Taking an element like `[0]` gives you a Tuple of type `(key: String, value: String)`. Note that it's a named tuple as well!

---
# **AAAHH**

I just realized that `KeyValuePairs` do not have an `append` function.

You cannot make them bigger! Can't even add them together!

No wonder no one uses these. <sub><sup>I'll show you how to make our own append method for `KeyValuePairs`!!</sup></sub>


---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```