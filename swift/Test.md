How can I create a tuple with only 1 element?

# The Question
If possible, how can I create a tuple with only 1 element?<br>

Requirements:<br>
 • When accessing the element from the tuple, it must be of the form `foo.0`<br>
 • Must retain the ability to reassign the value `foo.0 = 5`
 • When using the `type(of:)` method, it must output `(Int)`

If Impossible:<br>
 • Where in the Swift Grammar does it define this?<br>
 • What this possible in a previous version of Swift?<br>
 • If so, which SE was the change made to disallow it?

>[Can I Replace Func Parameter with a Tuple?][1]<br>
>"till Xcode 7 it was possible to pass the tuple as input parameter to function (type, number of parameters should match, won't work for default and optional ). but it's no longer possible. –"

Does this mean that you could have passed in tuples of size 1 as the input parameter to a function?
___
## Tuple Example
Here is an ordinary Tuple of size 2
```swift
let foo: (Int, Int) = (100, 200)
print(foo.0) // prints 100
print(foo.1) // prints 200
```
But I will attempt to make one of size 1
___
## Closure Example
Here is a closure passing 1 parameter, and returning one value:
```swift
let foo: (Int) -> Int = { $0 }
type(of: foo)
let a = foo(5)
```
As you can see, the parameter is of type `(Int)`
___
## Generic Struct Example
Here is a generic struct with the name of `U+200B` the zero width character. And one attribute named `O`
```swift
struct ​<T> {
    var O: T
    init(_ o: T) { O = o }
}

let foo = ​(5)
print(foo.O) // prints 5
type(of: foo) // this prints <Int>
```
This is very close to what I'm looking for. However, it is a pain to have to paste the Zero Width Character.. And it's also extremely unreadable and confusing. Also, it the attribute is not a Zero, but a Capital O. You can copy/paste this code and it will work.
___
# Generic Enum Example
```swift
enum Foo<T> {
    case o(T)
    var O: T {
        get { P }
        set(to) { self = .o(to) }
    }
    var P: T { switch self { case .o(let p): return p } }
}

var bar = tuple(5)
print(bar.O) // Prints 5

bar.O = 100
print(bar.O) // Prints 100
```
I think this is as close as I'm gonna get
___

# How does Apple define Tuples?
>“In addition to familiar types, Swift introduces advanced types not found in Objective-C, such as tuples. Tuples enable you to create and pass around groupings of values. You can use a tuple to return **multiple** values from a function as a single compound value.”

The key here is that Tuples can combine **multiple** values. This is why I don't think it is possible anymore. However, we have yet to determine if the Swift Grammar describes this.
___
# The Swift Grammar

>“A tuple expression consists of a **comma-separated** list of expressions surrounded by parentheses.”

Since Tuples of size 1 are not comma separated, it must not be possible.<br>
However, Tuples can be of size 0 (Which makes them `()` or `Void`)

>"A tuple expression can contain zero expressions, or it can contain two or more expressions. A single expression inside parentheses is a parenthesized expression."
>
>>**NOTE**<br>
>>Both an empty tuple expression and an empty tuple type are written () in Swift. Because Void is a type alias for (), you can use it to write an empty tuple type. However, like all type aliases, Void is always a type—you can’t use it to write an empty tuple expression.<br>
>
>>**GRAMMAR OF A TUPLE EXPRESSION**<br>
tuple-expression → ( ) | ( tuple-element , tuple-element-list )<br>
tuple-element-list → tuple-element | tuple-element , tuple-element-list<br>
tuple-element → expression | identifier : expression<br>

___

As I'm reading this, I am persuaded it isn't currently possible.<br>But that does not mean it was not possible in the past.

Of the four SE's about Tuples, they do not seem super related<br>
• [0015 - Tuple Comparison Operators][2]<br>
• [0029 - Remove Implicit Tuple Splat][3]<br>
• [0110 - Distinguish Single Tuple Arg][4]<br>
• [0283 - Tuples Conform to Equatable, Comparable, and Hashable][5]

It appears as though it was never possible to begin with, but I could be wrong.


  [1]: https://stackoverflow.com/questions/61493255/replacing-func-parameter-with-tuple
  [2]: https://github.com/apple/swift-evolution/blob/master/proposals/0015-tuple-comparison-operators.md
  [3]: https://github.com/apple/swift-evolution/blob/master/proposals/0029-remove-implicit-tuple-splat.md
  [4]: https://github.com/apple/swift-evolution/blob/master/proposals/0110-distingish-single-tuple-arg.md
  [5]: https://github.com/apple/swift-evolution/blob/master/proposals/0283-tuples-are-equatable-comparable-hashable.md
