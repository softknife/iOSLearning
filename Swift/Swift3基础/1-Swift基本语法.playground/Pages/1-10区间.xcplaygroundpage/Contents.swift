//: [Previous](@previous)

import Foundation

// 区间Range

// 积分区间
let range = Range(uncheckedBounds: (lower: 1.1, upper: 10.2))
// 等分区间
let range1 = Range(uncheckedBounds: (lower: 1, upper: 10))


// 无限区间
let x = 10
switch x {
case 10...Int.max:
    print(x)
case Int.min..<10:
    print("小于10")
default:
    print("无意义")
}

// 有限区间
switch x {
case 10...100:
    print(x)
case 0..<10:
    print("小于10")
default:
    print("无意义")
}
