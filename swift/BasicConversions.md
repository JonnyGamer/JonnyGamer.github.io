# **Basic Conversions**

Our four basic types are: `Bool, Int, Double, String`<br>
I'm gonna show built in methods of how to convert between the two.<br>
   (i.e. Turn a String into an Int)

Since we are only on Chapter 1, these methods may change as you learn more and more advanced techniques.

In some ways, this is really advanced stuff since we won't be using `if` statements or `==` comparasin operators for filtering. This proves mighty challenging.

PLEASE: Do *NOT* memorise this list. I have not. This article was only created for fun. There are *much* better ways to code. I just haven't taught you yet.

---
# **Bool → ___**
**Bool → Int**<br>
We want something like this:
- **true** → **1**
- **false** → **0**

Right off the bat, here we go:

`Int(true) == 1`<br>
`Int(false) == 0`

But hey, look at this little warning we're getting:<br>
  *'init(_:)' is deprecated: replaced by 'init(truncating:)'*

If I click *fix* this is what it looks like:

`Int(truncating: true) == 1`<br>
`Int(truncating: false) == 0`

Funny. But both options work.

---
**Bool → Double**<br>
This is interesting. I think we will want this:
- **true** → **1.0**
- **false** → **0.0**

I guess we could just do this: `Double(Int(true))` or `Double(Int(false))

---
**Bool → String**<br>
There is 2 ways to do this:

1. `String(true)`
2. `"\(true)"`

Both of these tecniques turn `true` into `"true"`. You can also do the same thing with false.

---
# **Int → ___**
**Int → Bool**<br>
Turning an Integer into a Bool is interesting. 0 is false. All other numbers will be true.

You might be tempted to say this: `Bool(100)` but this is incorrect. Even though `Bool(100) == true` I have found a contingency: `Bool(0) == 0` as well... So we'll have to find something else.

Turns out it's super complicated:

`Bool(truncating: .init(value: Double(1))) == true`<br>
`Bool(truncating: .init(value: Double(0))) == false`

No idea why the built-in method is so complex. Just figured it out right now. In later lessons, we'll be able to shrink this waaay down.

**• DIY Secret!**<br>
If you paste this code into your program:<br>
`extension Bool { init(n: Int) { self = n == 0 } }`

You'll then be allowed to do this no problem: `Bool(n: 5) == true` and `Bool(n: 0) == false`

But again, we'll speak about this much later

**But Wait!**<br>
I just figured out a *much* better and smaller method:

- `!(0.isMultiple(of: 0)) == false`
- `!(1.isMultiple(of: 0)) == true`

This will do the trick!

---
**Int → Double**<br>
This one is muuuch easier:

`Double(100)`

---
**Int → String**<br>
This one is also handy:

`String(100)` or `"\(100)"`

Unfortunately, doing this: `"\(-0_001_0)"` just turns into `"-10"`

---
# **Double → ___**
**Double → Bool**<br>
In this case, only `0.0` can be `true`. All else will be `false`.

Here you go:

- `Bool(truncating: .init(value: 0.0)) == false`
- `Bool(truncating: .init(value: 0.1)) == true`
- `Bool(truncating: .init(value: -100.11)) == true`

Similar to the **Int → Bool** answer shown above, this is also pretty complex. Turning things into Bools are just plain weird.

But wait! I just figured out a *much* better and smaller method:

- `!(0.0.isZero) == false`
- `!(0.1.isZero) == true`
- `!(-100.11.isZero) == true`

---
**Double → Int**<br>
Here we go. For this one, all numbers after the decimal point will be removed. We will be rounding down. In Math, this is known as a floor function:

- `Int(1.0) == 1`
- `Int(1.1) == 1`
- `Int(1.9999) == 1`

If you want a true rounding function.. I'll tell you later :)

---
**Double → String**<br>
This can be done in two ways:

`String(100.0)` or `"\(100.0)"`

Unfortunately, doing this: `"\(-0_001_0.100__000)"` just turns into `"-10.1"`

---
# **String → ___**
**String → Bool**<br>
This one is a bit of a trick:
- `"true"` will be turned into `true`.
- `"false"` will be turned into `true`.
- `""` emtpy String will be turned into `false`.

I found the method after some deep thinking:

- `!("true".isEmpty) == "true"`
- `!("false".isEmpty) == "true"`
- `!("".isEmpty) == "false"`

---
**String → Int**<br>
This one is quite tricky. `"400"` will be turned into `400`. That's ok.
But what will `"Hahaha"` turn into?

We will learn about Optionals in a later lesson. But for now, I'll show you how to give a Default Value for non-numbers. Let's turn all Non-Numbers into 0.

- `Int("400") ?? 0 == 400`
- `Int("-1") ?? 0 == -1`
- `Int("000") ?? 0 == 0`
- `Int("Hahaha") ?? 0 == 0`
- `Int("0001") ?? 0 == 1`  <sub><sup>← (I'm surprised they allow this)</sup></sub>

Unfortunately, this happens:
- `Int("1_1_1") ?? 0 == 0`

---
**String → Double**<br>
This has a similar solution. Remember, the defualt value for all Non-Numbers will be 0.0

- `Double("1.0") ?? 0.0 == 1.0`
- `Double("0001.0000") ?? 0.0 == 1.0`
- `Double("-1") ?? 0 == -1.0`
- `Double("Hahaha") ?? 0.0 == 0.0`

---
Well that was super interesting! This will get a *whole lot* easier once we learn about `if` statements. In fact, I'll just make a new article for that. It will be so much short, I promise. And it won't be a list. It will be super generic and straightforward for *all* types.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```