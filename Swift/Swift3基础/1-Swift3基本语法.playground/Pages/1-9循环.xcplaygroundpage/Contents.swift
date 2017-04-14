//: [Previous](@previous)

import Foundation

/*
 * for 循环
 * while/repeat while循环
 */

/// for循环

// 区间: 半开半闭区间,全闭合区间
for i in 1..<10 { // 半开半闭区间
    print(i)
}

for i in 1...10 { // 全闭合区间
    print(i)
}

// 省略写法
for _ in 0..<9 {
    print("👌")
}


// while循环
var i = 10
while i > 0 {
    print(i)
    i -= 1
}


// repeat while
var j = 12
repeat {
    j -= 1

    print(j)
}while j > 0
