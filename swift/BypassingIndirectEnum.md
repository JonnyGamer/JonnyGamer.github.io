# Bypassing Indirect Enum

```swift
indirect enum Foo { case bar(Foo), bas }
```

This is an indirect enum.

You can instantiate it like this:
`let this = Foo.bar(.bar(.bas))`

If you take the `bas` out of the enum, you'll also see a funny warning<br>
`Enum containing only recursive cases is impossible to instantiate`

###### Let's see if I can recreate it without that `indirect`
My first thought is that we need a Generic Parameter. Since I cannot directly store an enum on itself, otherwise it would want me to mark it as indirect.

>Before I do this I tried to make a protocol witness:
>```swift
>protocol Hey {
>   static func bar(_ this: Hey) -> Self
>}
>```
>Sometimes this hits an error, but sometimes it doesn't. I tried to conform it to an enum, but Swift is smart and catches it and politely stops me to add an `indirect` mark.

So here we go, Generic Enum :)
```swift
enum Foo<T> {
   case bar(T)
}
```
This is cool it allows you to do this:
```swift
let a = Foo.bar(Foo.bar(5)) etc.
type(of: a)	// Foo<Foo<Int>>
```

Awesome! That was easy!
But.. What if I want to exactly replicate my first example.
I don't want to give the option of adding a `5` or anything. Hmm. A little trickier.
Still gonna use Generics, but this time maybe I'll add a protocol constraint.

# Generically Conform to Oneself

```swift
protocol Hey {}
enum Foo<T: Hey>: Hey {}
```
Check this out, the Generic conforms to Foo! And it does not require an indirect enum!! Neato! Now let's add some cases:

```swift
enum Foo<T: Hey>: Hey {
   case bar(T), bas
}
let this = Foo.bas
```
However, we get a sneaky error: `Generic parameter 'T' could not be inferred.` Uh oh..
```swift
let this = Foo<_>.bas
let this = Foo<Foo<_>>.bas
let this = Foo<Foo<Foo<_>>>.bas
```

# Sneaky Spoof Struct

Hmm.. I think it'll go on forever.. Huh. What can I do now!?
At this point, I became quite frustrated.
I wish I could end it with `Void` or something, but remember `Void` cannot be extended `here`.

Aha! I decided to make a spoof-struct conforming to `Hey`

```swift
protocol Hey {}
struct None: Hey {}
enum Foo<T: Hey>: Hey {
   case bar(T), bas
}

let this = Foo<Foo<Foo<None>>>.bar(.bar(.bas))
```

Well, there we go! We did it! (Notice how Swift wants to explicitely show the type. It's suuper fat. No wonder Indirect Enums are *Much* better)

# Indirect Structs?

Funny, you cannot make indirect structs:
```swift
indirect struct Foo { var bar: Foo }
```
 • Value type `Foo` cannot have a stored property that recursively contains it.<br>
 • `indirect` modifier cannot be applied to this declaration<br>
 • Note that enums cannot hold stored properties :)

Ahh, but I got this indirect struct figured out here:

```swift
protocol This {}
struct He: This {
   var foo: This?
   init(_ bar: This) {foo=bar}
   init(){}
}
let ha = He(He(He()))
print(ha)
// He(foo: Optional(FooBar.He(foo: Optional(FooBar.He(foo: nil)))))
```

Ha. Let's rid of those ugly `Optionals`

```swift
struct Ha: This {}
struct He: This {
   var foo: This
   init(_ bar: This) {foo=bar}
   init(){foo=Ha()}
}
let ha = He(He(He()))
print(ha)
// He(foo: FooBar.He(foo: FooBar.He(foo: FooBar.Ha())))
```

This is a little shorter, but I still think Indirect Enum is King. <sub><sup>Which makes me sad</sup></sub>
