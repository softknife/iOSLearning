//: [Previous](@previous)

import Foundation

/*
 * CRUD 遍历,拼接
 */

// 创建
let array = [1,2,3,4,5,6,6,7]
var array1 = [Int]()
var array2 : Array<Int> = []
// 对于不规则的存储要指明
let arrayx = [1,2,"1"] as [Any]
// 或者
let arrayy : [Any] = [1,"2"]



// 增
var array3 = [11,23]
array3.capacity
let array4 = [1,2] + array3
Array(arrayLiteral: 1,2)
array3.append(1)
array3.capacity
array3.append(contentsOf: [12,33])
array3.capacity

array3.insert(50, at: 0)
array3.capacity

array3.insert(contentsOf: [100], at: 0)
array3.capacity    // 申请空间是呈现指数爆炸增长2n次方


// 拼接
let array5 = ["a","b","c"]
let string = array5.joined()
let sting1 = array5.joined(separator: ",")


// 改
array3.replaceSubrange((array3.startIndex..<array3.endIndex), with: [1,2,3,4,5,6,7,8,9])
array3[0] = 2
array3

// 删除
array3.remove(at: 0)
array3.removeLast()
array3.removeFirst(3)
//array3.removeAll(keepingCapacity: true)


// 查找
array3[2]


// 遍历
for emment in array5{
    print(emment)
}

// 遍历器
for (idx , elment) in array5.enumerated() {
    print(idx,elment)
}

// 遍历前两个
for element in array5[0..<2] {
    print(element)
}

array5.forEach { (ele) in
    
    print(ele)
}

