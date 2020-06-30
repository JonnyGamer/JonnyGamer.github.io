<a href="https://jonnygamer.github.io/swift">
  <img alt="Back" src="/Images/Back.jpg" width="120">
</a><br>

<img alt="Back" src="/Images/swift/MagicLiteralAsEnumCase.png" width="600">

---

**Bug > Swift > Enum > String Protocol**

---

I was attempting to create an enumeration in which all its elements were file names, and I stumbled across something interesting. Like so:

```swift
enum FileNames: String {
     case main = #file
}
```

This resulted in an internal error. (Segmentation Fault: 11)

___
I was able to figure how to get an actual error message:

```swift
enum Foo: String {
    case one = "\(1)"
}
```

```Error: Raw value for enum case must be a literal```

___

**Related Questions:**<br>
 • Is ```#file``` considered a String literal?<br>
 • Why does ```#file``` break the enum? Should this be reported on bugs.swift.org?<br>
 • I noticed that replacing ```String``` to ```Int``` and ```#file``` to ```#line``` causes the same issue. Is this a hint?

___
# Color Literals Don't Work

I thought they did, but I made a mistake. It also causes the same internal error.
```swift
import UIKit

enum ColorEnum: UIColor {
    case foo = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
}
```
___

# The Swift Programming Language (Swift 5.2)
According to Apple, ```#file``` is considered a literal:

[![#file is described as a literal according to Apple][1]][1]


___

# What about nil Literals?

These also crash the compiler.

```swift
enum Foo: String? {
    case breaks = nil
}
```
___
23 Characters of Mass Destruction
```swift
enum I:Int?{case a=nil}
```
___

# Bug Fixed
The crash has now been fixed, it has been merged officially into Swift here: [Merged on GitHub][3]
Here's the bug report: [SR-12998][2]

**Adding Support!**<br>
The use of magic literals as raw values for enum cases is being supported here: [SR-13022][4]


  [1]: https://i.stack.imgur.com/Eitgf.png
  [2]: https://bugs.swift.org/browse/SR-12998?jql=project%20%3D%20SR%20AND%20issuetype%20%3D%20Bug
  [3]: https://github.com/apple/swift/pull/32364
  [4]: https://bugs.swift.org/browse/SR-13022
