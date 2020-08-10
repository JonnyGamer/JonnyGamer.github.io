# **Nested Conditionals**

Remember our fancy operator `?:` Conditionals!

Let's give us a quick test:
```swift
let foo = 6
let bar = (foo == 6) ? "hello" : "there"
// What is 'bar'?
bar == "hello"
```

Oooh.. Amazing. I love conditionals. They're like super tiny `if-else-statements`

---
### **NESTED** <sub><sup>CONDITIONALS <sub><sup>HOORAY</sup></sub></sup></sub>

```swift
let foo = 5
let bar = 6

let magic =
    (foo == 5)
    ?
    ((bar == 6) ? 1 : 2)
    :
    ((bar == 5) ? 3 : 4)
// Wowow, what *is* magic?
// magic is.. 1
```

Wow! Swift is even able to infer this!!

---
**Look**<br>
These both do the *same exact thing*

**IF STATEMENT:**
```swift
var foo = true
var bar = 0

if foo {
    bar = 1
} else {
    bar = 2
}
print(bar) // bar == 1
```

**CONDITIONAL CLOSURE STATEMENT:**
```swift
var foo = true
var bar = 0

let _ = foo ? {
    bar = 1
}() : {
    bar = 2
}()
print(bar) // bar == 1
```

---
**CHECK OUT THIS MASSIVE IF-STATEMENT**
```swift
let a = Bool.random()
let b = Bool.random()
let c = Bool.random()
let d = Bool.random()

var this = 0
if a {
    if b {
        if c {
            if d {
                this = 1
            } else {
                this = 2
            }
        } else {
            if d {
                this = 3
            } else {
                this = 4
            }
        }
    } else {
        if c {
            if d {
                this = 5
            } else {
                this = 6
            }
        } else {
            if d {
                this = 7
            } else {
                this = 8
            }
        }
    }
} else {
    if b {
        if c {
            if d {
                this = 9
            } else {
                this = 10
            }
        } else {
            if d {
                this = 11
            } else {
                this = 12
            }
        }
    } else {
        if c {
            if d {
                this = 13
            } else {
                this = 14
            }
        } else {
            if d {
                this = 15
            } else {
                this = 16
            }
        }
    }
}
```

**THIS IS THE SAME AS**

```swift
let a = Bool.random()
let b = Bool.random()
let c = Bool.random()
let d = Bool.random()
let foo = a ?
    b ?
        c ?
            d ? 1 : 2
            :
            d ? 3 : 4
        :
        c ?
            d ? 5 : 6
            :
            d ? 7 : 8
    :
    b ?
        c ?
            d ? 9 : 10
            :
            d ? 11 : 12
        :
        c ?
            d ? 13 : 14
        :
            d ? 15 : 16
```

**THIS IS THE SAME AS**

```swift
let a = Bool.random()
let b = Bool.random()
let c = Bool.random()
let d = Bool.random()
let bar = a ? b ? c ? d ? 1 : 2 : d ? 3 : 4 : c ? d ? 5 : 6 : d ? 7 : 8 : b ? c ? d ? 9 : 10 : d ? 11 : 12 : c ? d ? 13 : 14 : d ? 15 : 16
```

**THIS IS THE SAME AS**

```swift
let a = Int.random(in: 1...16)
```

**WOAH**

---


```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```