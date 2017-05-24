//: Playground - noun: a place where people can play

import UIKit

/*:
 > Memory Layout
 - 默认情况下，Swift 是不允许我们直接操纵内存, 所以swift才是类型安全的 ,并且确保所有的变量在使用前都已经被正确地初始化了。
 - 那么,如果我们想要像写C语音一样去直接操纵内存,我们应该怎么做?
    - 官方提供了一系列的unsafe特性,这些就相当于C语言,可以用来直接操纵内存,但是,这种情况下,编译器可以给我们的提示帮助就微乎其微了, 一切都得靠我们自己了!
 
 */

/*:
 1.下面让我们来看下,如何使用MemoryLayout来检测类型的大小以及内存的对齐方式
 
    The contiguous memory footprint of `T`, in bytes.

    A type's size does not include any dynamically allocated or out of line storage. 
 
    In particular, `MemoryLayout<T>.size`, when `T` is a class type, is the same regardless of how many stored properties `T` has.
 
    When allocating memory for multiple instances of `T` using an unsafe pointer, use a multiple of the type's stride instead of its size.
    -SeeAlso: `stride`

- **public static var size: Int { get }**

 
    The number of bytes from the start of one instance of `T` to the start of the next when stored in contiguous memory or in an `Array<T>`.
    This is the same as the number of bytes moved when an `UnsafePointer<T>` instance is incremented. `T` may have a lower minimal alignment that trades runtime performance for space efficiency. This value is always positive.
 

- **public static var stride: Int { get }**

 
    The default memory alignment of `T`, in bytes.
    Use the `alignment` property for a type when allocating memory using an unsafe pointer. This value is always positive.
 

- **public static var alignment: Int { get }**
 
 
 MemoryLayout<T> 是一个用于在编译时计算出特定类型(Type)的 size, alignment 以及 stride 的泛型类型。返回的数值以字节为单位。
 
 */

/*:
 2.下面我们来看下,基本类型的内存分布的特点,
 结果可见,stride 都与 size 是一致的。
 */

MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride

MemoryLayout<Int8>.size
MemoryLayout<Int8>.alignment
MemoryLayout<Int8>.stride

MemoryLayout<Bool>.size
MemoryLayout<Bool>.alignment
MemoryLayout<Bool>.stride

MemoryLayout<Float>.size
MemoryLayout<Float>.alignment
MemoryLayout<Float>.stride

MemoryLayout<Double>.size
MemoryLayout<Double>.alignment
MemoryLayout<Double>.stride

/*:
 3.我们再来看看 构造数据类型 的内存分布特点.
 
 对于`Empty`空结构体的大小为 0，内存对齐为 1， 表明它可以存在于任何一个内存地址上。有趣的是 stride 为 1，这是因为尽管结构为空，但是当我们使用它创建一个实例的时候，它也必须要有一个唯一的地址。 内存碎片是不是由此产生的?
 而对于`Demo`结构体,大小为9,内存对其为8, 数组中一节占用16个bytes, 可见,这种结构不是那么理想,凭空占用了7个bytes
 
 对于构造类型内存, stride是alignment的倍数,而和size不一定相关!
 
 
 */

struct Empty{}

MemoryLayout<Empty>.size
MemoryLayout<Empty>.alignment
MemoryLayout<Empty>.stride

struct Demo{
    let number:Int64
    let result : Bool
}

MemoryLayout<Demo>.size
MemoryLayout<Demo>.alignment
MemoryLayout<Demo>.stride

enum EnumDemo {
    
}
MemoryLayout<EnumDemo>.size
MemoryLayout<EnumDemo>.alignment
MemoryLayout<EnumDemo>.stride

enum EnumDemo1 : Int64{
    case value1
    case value2
    
}
MemoryLayout<EnumDemo1>.size
MemoryLayout<EnumDemo1>.alignment
MemoryLayout<EnumDemo1>.stride
MemoryLayout<EnumDemo1.RawValue>.size
MemoryLayout<EnumDemo1.RawValue>.alignment
MemoryLayout<EnumDemo1.RawValue>.stride




/*:
 - 参考：http://www.swiftyper.com/2017/01/15/unsafe-swift/
 */