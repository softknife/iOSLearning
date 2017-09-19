//: Playground - noun: a place where people can play

import UIKit

/*:
 Swift中指针操作关键字
 Managed 被ARC托管的
 Unsafe 需要自己申请和释放内存
 Raw  无类型数据 类似 void *
 Mutable 可修改的内存大小指针
 
 Pointer 指针
 OpaquePointer
 */

/// 常规内存操作
// 1.申请内存空间
var intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 10) // Uninitialized
// 2.初始化变量
intPtr.initialize(to: 0, count: 10)

// 使用 ....

// 3.析构
intPtr.deinitialize()
// 4.释放内存
intPtr.deallocate(capacity: 10)


/*:
 为什么我们要initialize内存??
 */
class Foo{
    var m:Int  = 0
}

// 1.申请内存空间
var fooPtr = UnsafeMutablePointer<Foo>.allocate(capacity: 10) // Uninitialized
// 2.初始化变量,
fooPtr.initialize(to: Foo(), count: 10)

fooPtr[0] = Foo()
fooPtr[1] = Foo()
fooPtr[2] = Foo() //error: Execution was interrupted, reason: EXC_BAD_ACCESS (code=1, address=0x1b08).
// 如果我们不初始化内存, 那么, 由于Foo的内存是被ARC托管的, 当我们使用下标访问fooPtr时,ARC会尝试将指针指向的空间,使用Foo规则释放,但是事实是该空间里是垃圾数据,那么就会报错!

// 3.析构
fooPtr.deinitialize()
// 4.释放内存
fooPtr.deallocate(capacity: 10)

