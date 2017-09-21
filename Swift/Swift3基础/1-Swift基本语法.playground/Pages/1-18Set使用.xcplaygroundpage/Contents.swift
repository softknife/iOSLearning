//: [Previous](@previous)

import Foundation

let numberSet = Set(1...10)
let evens = numberSet.lazy.filter{ $0 % 2 == 0}
// 当前evens的类型是 LazyFilterCollection<Set<Int>>,我们在swift4中可以将其转化为Set类型
let evenSet = Set(evens)

evenSet.isSubset(of: numberSet)

//: [Next](@next)
