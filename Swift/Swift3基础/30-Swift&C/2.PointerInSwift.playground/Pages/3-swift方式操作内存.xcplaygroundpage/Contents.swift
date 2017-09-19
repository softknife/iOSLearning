//: [Previous](@previous)

import Foundation


var head = UnsafeMutablePointer<Int>.allocate(capacity:10)
head.initialize(to: 0, count: 10)

// C语言访问方式
for i in 0...9 {
    head[i] = i
}


// 通过buffer数组的方式操作指针,比直接操作指针更安全!!
var buffer = UnsafeMutableBufferPointer(start: head, count: 10)

// 基本属性
buffer.isEmpty
buffer.count
buffer.max()
buffer.min()
buffer.baseAddress

// 访问buffer 类似数组
// 下标
let m =  buffer[0]
let n = buffer[0...5]

for i in n {
    print(i)
}

// 属性访问
buffer.first
buffer.last
let first = buffer.first(where: {return $0 > 1})
print(first)


// 排序
buffer.sorted() // 默认是升序
buffer.sorted(by: >) // 直接修改buffer中的顺序
let sorted = buffer.sorted(by: <) // 不修复原buffer,而是返回一个新的排序后的

buffer.reverse()
let reversed = buffer.reversed()
[Int](reversed) // 转换


// 迭代器, 通过迭代器,我们并不会改变buffer指向的内存值!!
var iter = buffer.makeIterator()
while let value = iter.next() {
    print(value)
}

_ = iter.map{  $0 * 2 } // 所有元素乘以2
_ = iter.filter{ $0 % 2 == 0} // 得到偶数
_ = iter.reduce(0, +)  // 求和


// swift4中,我们可以直接对buffer进行上述操作
_ = buffer.map{  $0 * 2 } // 所有元素乘以2
_ = buffer.filter{ $0 % 2 == 0} // 得到偶数
_ = buffer.reduce(0, +)  // 求和



head.deinitialize()
head.deallocate(capacity: 10)



//: [Next](@next)
