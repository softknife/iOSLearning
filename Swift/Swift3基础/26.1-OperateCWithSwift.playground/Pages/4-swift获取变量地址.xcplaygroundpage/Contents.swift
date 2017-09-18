//: [Previous](@previous)

import Foundation

var ten : CInt = 10

/// 1.我们并不能像在C中一样直接通过&符号获取变量的地址
//let tenPtr = &ten // error: variable has type 'inout CInt' (aka 'inout Int32') which includes nested inout parameters

// 如果我们想获取该变量的地址,那么我们需要使用如下函数
withUnsafePointer(to:&ten){
    
    print($0.pointee ) // 此时这里pointee是只读的
}

print(ten)

withUnsafeMutablePointer(to: &ten) { ptr in
    ptr.pointee = 11  // 该方法可以通过地址修改变量
}

print(ten) // 注意上述获取的变量地址只在大括号中是安全的!


/// 2.手动获取内存空间
// 将无类型空间转为具体类型空间
let rawPointer = malloc( 10 * MemoryLayout<Int>.size)! // 假设我们一定可以分配到内存
let intPtr = rawPointer.bindMemory(to: Int.self, capacity: 5 * MemoryLayout<Int>.size) // 这里我们只是把前一半的空间初始化为Int类型的空间, 后一半任然是无类型空间

// 将有类型空间转换为无类型空间
let bindedRawPointer = UnsafeMutableRawPointer(&ten)
let tenPointer = bindedRawPointer.assumingMemoryBound(to: CInt.self)



//: [Next](@next)
