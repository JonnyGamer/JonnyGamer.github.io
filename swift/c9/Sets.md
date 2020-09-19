# **Sets**
Sets are so awesome! They are *super* similar to `Arrays`, however, they cannot contain duplicate elements. ok.

Also they don't have an order.

What!?

---
### **Making a Set**

Making a set is simple, but it took me a while to fully understand. You need to make sure Swift knows it's a `Set` and not an `Array`.

Making `Set<Int>`<br>
Here are a few ways to do the same thing:
```swift
let foo0 = Set(arrayLiteral: 1, 2, 3)
let foo1: Set<Int> = [1, 2, 3]
let foo2: Set = [1, 2, 3]
let foo3 = Set([1, 2, 3])
let foo4 = Set(1...3)
```

When printed out, it looks just like an array:

```swift
[1, 2, 3]
```

---
# **Insert &c.**

With Sets, there is no `append` method. Sets cannot be added together with `+`. You also cannot use subscripts with Sets. What!! Instead there is a whole new set of methods waiting for you:

- `contains(member:)` - Check to see if a Set contains a given element
- `count` - See how many elements are within a set.
- `insert(newMember:)` - Insert a new element into a set
- `intersection(other:)` - Returns the common elements between 2 sets
- `isDisjoint(with:)` - Returns a true if 2 Sets have common elements
- `isEmpty` - Returns true if set has 0 elements
- `isSubset(of:)` - Returns true if set only contains common elements with another set.
- `isSuperset(of:)` - Returns true if contains all of the elements of another set.
- `remove(member:)` - Remove an element from the set
- `symmetricDifference(other:)` - Returns a Set made up of all uncommon elements between 2 sets.
- `union(other:)` - Adds 2 sets together

---

In some ways, sets can be easier than Arrays. Sometimes not. It all depends on how you want to use something. Here's a cheet sheet:

- **Use Array If:** You need to the order of things
- **Use Set If:** You need to know if a group contains something

---

```swift
// ©2020 Jonathan Pappas, Unusually Brilliant Adventures Nonprofit.
```