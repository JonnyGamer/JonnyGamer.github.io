# **Coercion**

Remember our `Swift Inference` lesson in Chapter 2? Remember our example:

```swift
let myDouble: Double = 5
```

Remember how it's weird? Remember how I described it as `Inference Magic`?? In this segment I will explain to you.. COERCION!

---

What's coercion!? I've never heard of this word before. <sub><sup>Is it an operator?</sup></sub>

But first! Can you solve these problem??

```swift
1• 1 / 2.0                   // What is it?
2• 1.0 / 2                   // What is it?
3• let _: Double = 1 / 2     // What is it?
4• Double(1 / 2)             // What is it?
5• Double((1 / 2))           // What is it?
6• (1 / 2) as Double         // What is it?
7• 1 / 2 as Double           // What is it?
```

---
Hmm. Very puzzly... I haven't even shown you what `as` does. Ahaha.

Answers:
```swift
1• 0.5
2• 0.5
3• 0.5
4• 0.0
5• 0.0
6• 0.5
7• 0.5
```

Hmm.. What makes `4` and `5` equal to Zero?

And what's `as`?? <sub><sup>All in due time</sup></sub>

---

# **Simple Answer**

I wrote a long confusing answer, but then I found an easier one [here](https://stackoverflow.com/a/28813749/13426627).<br>
Doubles conform to these two protocols:
`ExpressibleByFloatLiteral` and `ExpressibleByIntegerLiteral`

What does this mean?

`ExpressibleByFloatLiteral` means that Doubles can be formed by numbers with digits like `1.111` or `10.0` or `-5.55050`

`ExpressibleByIntegerLiteral` means that if Swift sees an Int, but is expecting a Double, Swift will automatically convert it into a Double. Example: if Swift sees `1` but what expecting a Double, it will read `1.0` instead. <sub><sup>This opens up lots of strange bugs</sup></sub> This is called **coercion**.

**However there's this exception:**
```swift
let hello: Double = 500       // this is ok

let foo = 500
let bar: Double = foo        // error!
let hey: Double = Int(500)   // error!
Int(1) as Double             // error!
```

Interesting.

For now, this is all you need to know. In fact, it still confuses me quite a bit. Later on, this will all make a more sense.

If you are still really interested, you can read the explanations to each question. Pardon the legnthiness of the answers. You can pass on this no problem.

---

### **Question 1  <sub><sup>&</sup></sub>  2**

With our newfound knowledge, let's explain why Questions 1 and 2 are 0.5

`1 / 2.0` is `0.5`<br>
  Swift notices that `2.0` is a Double.<br>
  Swift automatically turns `1` into `1.0` through ceorcion since Ints cannot be divided by Doubles.

`1.0 / 2` is `0.5`<br>
  The same thing is happening here.

Catch the pattern? Written numbers like `1` or `2` can be coerced, and infered, into `Doubles`. This does not work the other way around (ever).

---

### **Question 3**

Question 3 is cool:
`let _: Double = 1 / 2`

It's expecting a `Double` type. Since `1 / 2 == 0` (an Int result), Swift is able to coerce the 1 and 2 into 1.0 and 2.0, making the `/` operator yield a Double output: being 0.5

---
### **Question 4 <sub><sup>&</sup></sub> 5**

This looks *Super* similar to Question 3, but actually, it is different. Why is this answer 0, but Question 3 is 0.5?

Code | Explanation
:-- | --:
**3.** `let _: Double = 1 / 2` | Since the type is expected to be a Double, Swift makes some coercion magic happen
**4.** `Double(1 / 2)` | This Double forces whatever in the parenthesis to become a Double, no matter the response (therefore it takes the Int route making the answer `0`)
**5.** `Double((1 / 2))` | This is a more exagurated version of Question 4.

---
### **Question 6** → `as`

Alright. What's the deal with `as`.

This `as` is the coercion operator. What does it do??

---
# **The Coercion Operator**


Because of the `ExpressibleByIntegerLiteral`,<br>
`1 as Double == 1.0`

But..

`(1.0 as Int) == 1` causes a *nasty error*<br>
`Cannot convert value of type 'Double' to type 'Int' in coercion`

If Int conformed to `ExpressibleByFloatLiteral` it would be possible. But it doesn't (Maybe we'll learn about this in later lessons!)

Oooh.. that `as` operator is cool.<br><sub>(very rare use of an operator whose name isn't `+` or `%` or something)<sub>

---

### **Question 6**

`(1 / 2) as Double`

Because of coercion, Swift is expects a Double response. It turns the 1 and 2 into Doubles first. Wow! Swift is *very* magical to be able to do this.

I had to really mull over why this happens. In short the reason is because of this:

```swift
(1 / 2) as Double     // Answer is 0.5
Int(1 / 2) as Double  // error!
```

---
### **Question 7**
`1 / 2 as Double`

This is a little different. Rewritten, this expession actually means this:

`1 / (2 as Double)`

Which turns into this:

`1 / 2.0`

Which is 0.5 through coercion.

---
Hmm, coercion is a bit odd. This has caused plenty of confusion for people in Swift. Abstract.

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```