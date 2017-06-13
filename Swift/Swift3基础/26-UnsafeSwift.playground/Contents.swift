//: Playground - noun: a place where people can play

import UIKit

/*:
 
 > Memory Layout
 
 Swift语言是用C++写的
 Swift的核心Library是用Swift自身写的。
 对于C++来说，内存区间如下
 
 堆区
 栈区
 代码区
 全局静态区
 Swift的内存区间和C++类似。也有存储代码和全局变量的区间，这两种区间比较简单，本文更多专注于以下两个内存区间。
 
 Stack（栈），存储值类型的临时变量，函数调用栈，引用类型的临时变量指针
 Heap（堆），存储引用类型的实例
 
 
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
 
- 对于`Empty`空结构体的大小为 0，内存对齐为 1， 表明它可以存在于任何一个内存地址上。有趣的是 stride 为 1，这是因为尽管结构为空，但是当我们使用它创建一个实例的时候，它也必须要有一个唯一的地址。 内存碎片是不是由此产生的?
-  而对于`Demo`结构体,大小为9,内存对其为8, 数组中一节占用16个bytes, 可见,这种结构不是那么理想,凭空占用了7个bytes
 
- 对于构造类型内存, stride是alignment的倍数,而和size不一定相关!
 
 
 */

struct Empty{}

MemoryLayout<Empty>.size
MemoryLayout<Empty>.alignment
MemoryLayout<Empty>.stride

struct StructDemo{
    let number:Int64
    let result : Bool
}

MemoryLayout<StructDemo>.size
MemoryLayout<StructDemo>.alignment
MemoryLayout<StructDemo>.stride

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
 4.类的内存分布情况
 - 由于类是引用类型,所以他所有的内存占用大小都是8个字节
 */
class EmptyClass{}

MemoryLayout<EmptyClass>.size
MemoryLayout<EmptyClass>.alignment
MemoryLayout<EmptyClass>.stride


class DemoClass{
    let number : Int64 = 0
    let flag = true
}

MemoryLayout<DemoClass>.size
MemoryLayout<DemoClass>.alignment
MemoryLayout<DemoClass>.stride


class InnerClass{
    struct InnerStruct {
        let number : Int
        let flag : Bool
    }
    
    let str = InnerStruct(number: 1, flag: true)
}

MemoryLayout<InnerClass>.size
MemoryLayout<InnerClass>.alignment
MemoryLayout<InnerClass>.stride

MemoryLayout<InnerClass.InnerStruct>.size
MemoryLayout<InnerClass.InnerStruct>.alignment
MemoryLayout<InnerClass.InnerStruct>.stride


/*:
 5.指针内存占用
 - 学过C语言的同学都知道,指针操作(直接内存操作)是非常不安全的, 当然,如果你是老鸟,这种操作也可以帮你完成很多不可思议的工作!
 - 基于Swift这门语言设计为安全的,所以,如果你真的想进行指针操作(C编程),Swift中提供了一套UnsafePointer的类型,帮我们完成指针操作!
 - 通过Swift的指针类型名字,我们就可以很清晰的知道该指针的类型,是可变还是不可变,原生(raw)还是有类型的,是否为缓冲(buffer)类型, 总共8中类型的指针.

 - `Unsafe[Mutable][Raw][Buffer]Pointer[<T>]`
 
    - UnsafePointer<T>          UnsafeMutablePointer<T>
    - UnsafeBufferPointer<T>    UnsafeMutableBufferPointer<T>
    - UnsafeRawPointer          UnsafeMutableRawPointer
    - UnsafeRawBufferPointer    UnsafeMutableRawBufferPointer
 
   - Pointers are just memory addresses. Direct memory access is Unsafe. Mutable means you  can write to it. Raw means it points to a blob of bytes. Buffer means that it works like a collection. Generic <T> pointers are typed.
 
 
 */

/*:
 - 5.1 使用无类型(Raw)指针
 
 */

let count = 3
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let byteCount = stride * count

do {
    print("Raw pointers test")
    
    // 1.申请byteCount大小的内存,对齐方式为alignment, UnsafeMutableRawPointer，它的名字表明这个指针可以用来读取和存储（改变）原生的字节。
    let pointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
    
    // 2.保证作用于后,手动释放内存
    defer {
        pointer.deallocate(bytes: byteCount, alignedTo: alignment)
    }
    
    // 3.存储Int类型的数字42
    pointer.storeBytes(of: 42, as: Int.self)
    // 4.步进一个步幅后,存储Int类型的数字12(pointer+stride).storeBytes(of: 6, as: Int.self)。
    pointer.advanced(by: stride).storeBytes(of: 20, as: Int.self)
    // 因为pointer这个指针类型是 Strideable 的，我们也可以直接使用指针算术运算
    (pointer + 2 * stride).storeBytes(of: 10, as: Int.self)
//    pointer.advanced(by: stride).storeBytes(of: 10, as: Int.self)
    
    
    
    // 5.读取字节
    pointer.load(as: Int.self)
    pointer.advanced(by: stride).load(as: Int.self)
    (pointer + 2 * stride).load(as: Int.self)
    // 每次拿到的pointer都是从头开始的

    
    
    // 6.数组指针读取上面的内存数据
    // UnsafeRawBufferPointer 类型以一系列字节的形式来读取内存。这意味着我们可以这些字节进行迭代，对其使用下标，或者使用 filter，map 以及 reduce 这些很酷的方法。缓冲类型指针使用了原生指针进行初始化。
    let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
    for (index,byte) in bufferPointer.enumerated() {
        print("byte : \(index):\(byte)")
        // 这里打印了16次,说明bufferPointer遍历是以alignment为单位进行的!
        
    }
    
    /*
     byte : 0:42
     byte : 1:0
     byte : 2:0
     byte : 3:0
     byte : 4:0
     byte : 5:0
     byte : 6:0
     byte : 7:0
         byte : 8:20
         byte : 9:0
         byte : 10:0
         byte : 11:0
         byte : 12:0
         byte : 13:0
         byte : 14:0
         byte : 15:0
     */
    
    
}



/*:
 - 5.2 使用类型指针
 
 */

let count1 = 3
do {

    print("有类型指针test")
    let pointer = UnsafeMutablePointer<Int>.allocate(capacity: count1)
    // 在使用类型指针前需要对其进行初始化，并在使用后销毁。这两个功能分别是使用 initialize 和 deinitialize 方法。
    pointer.initialize(to: 0, count: count1)
    
    defer {
        pointer.deinitialize(count: count1)
        pointer.deallocate(capacity: count1)
    }
    
    // 类型指针提供了 pointee 属性，它可以以类型安全的方式读取和存储值。
    pointer.pointee = 42
    // 当需要指针前进的时候，我们只需要指定想要前进的个数。类型指针会自动根据它所指向的数值类型来计算 stride 值。
    pointer.advanced(by: 1).pointee = 20
    pointer.pointee
    pointer.advanced(by: 1).pointee
    pointer.advanced(by: 2).pointee = 10
    (pointer + 2).pointee
    
    
    // 有类型的缓冲型指针也会直接操作数值，而非字节
    let bufferPointer = UnsafeBufferPointer(start: pointer, count: count1)
    for (index,value) in bufferPointer.enumerated() {
        print("value \(index):\(value)")
    }
    
}


/*:
 - 5.3 将无类型指针转换为类型指针
 */

do{

    print("Converting raw pointers to typed pointers")
    
    let rawPointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
    defer {
        rawPointer.deallocate(bytes: byteCount, alignedTo: alignment)
    }
    
    // 我们通过将内存绑定(binding)到指定的类型上来创建类型指针。通过对内存的绑定，我们可以通过类型安全的方法来访问它。当我们手动创建类型指针的时候，系统其实自动帮我们进行了内存绑定。
    let typedPointer = rawPointer.bindMemory(to: Int.self, capacity: count)
    typedPointer.initialize(to: 0, count: count)
    defer {
        typedPointer.deinitialize(count: count)
    }
    
    
    typedPointer.pointee = 42
    typedPointer.advanced(by: 1).pointee = 6
    (typedPointer + 2).pointee = 10
    typedPointer.pointee
    typedPointer.advanced(by: 1).pointee
    typedPointer.advanced(by: 2).pointee
    
    let bufferPointer = UnsafeBufferPointer(start: typedPointer, count: count)
    for (index,value) in bufferPointer.enumerated() {
        print("value \(index) : \(value)")
    }
    

}


/*:
 - 5.4 获取一个实例的字节
 很多时候我们需要从一个现存的实例里获取它的字节。这时可以使用 withUnsafeBytes(of:) 方法。
 
Invokes the given closure with a buffer pointer covering the raw bytes of the given argument.

The buffer pointer argument to the `body` closure provides a collection
interface to the raw bytes of `arg`. The buffer is the size of the
instance passed as `arg` and does not include any remote storage.

- Parameters:
  - arg: An instance to temporarily access through a raw buffer pointer.
  - body: A closure that takes a raw buffer pointer to the bytes of `arg` as its sole argument. If the closure has a return value, it is used as the return value of the `withUnsafeBytes(of:_:)` function. The buffer pointer argument is valid only for the duration of the closure's execution. // 注意 The buffer pointer argument 作用域仅限于closure,不要直接返回
  - Returns: The return value of the `body` closure, if any. // 有或者无返回值

  - SeeAlso: `withUnsafePointer(to:_:)`, `withUnsafeMutableBytes(of:_:)`
 public func withUnsafeBytes<T, Result>(of arg: inout T, _ body: (UnsafeRawBufferPointer) throws -> Result) rethrows -> Result
 
 */
do{

    print("test getting the bytes of an instance")
    
    var demo = StructDemo(number: 12, result: true)
    
    withUnsafeBytes(of: &demo){ rawBytes in // rawBytes : UnsafeRawBufferPointer
        
        for byte in rawBytes {
            
            print(byte)
            /*
             12
             0
             0
             0
             0
             0
             0
             0
             1
             可见内存对齐方式,确然!!
             */
        }
        
    }

}

/*:
 ****************
 */
/*:
 > Swift 操作指针的三大原则
 1. 不要让指针逃脱出作用域
 */
do {
    print("1. Don't return the pointer from withUnsafeBytes!")
    
//    var demo = StructDemo(number: 12, result: true)
//    
//    let bytes = withUnsafeBytes<UnsafeRawBufferPointer>(of: &demo) { bytes in
//        return bytes // strange bugs here we come ☠️☠️☠️
//    }
//    
//    print("Horse is out of the barn!", bytes)  /// undefined !!!
    // 本身这段代码就不能通过编译,即使能通过编译,我们也不能这么使用,因为指针一旦暴露给外部,那么就会成为不可控的因素,随时可以把你炸的粉身碎骨!
}

/*:
 2.一次只绑定一种类型
    
 - 绝对不要让一个内存同时绑定两个不同的类型。如果你需要临时这么做，可以使用 withMemoryRebound(to:capacity:) 来对内存进行重新绑定。
    
 - 并且，这条规则也表明了不要将一个基本类型(如 Int)重新绑定到一个自定义类型(如 class)上。不要做这种傻事。
 */
do {
    print("2. Only bind to one type at a time!")
    
    let count = 3
    let stride = MemoryLayout<Int16>.stride
    let alignment = MemoryLayout<Int16>.alignment
    let byteCount =  count * stride
    
    let pointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
    
    let typedPointer1 = pointer.bindMemory(to: UInt16.self, capacity: count)
    
    // Breakin' the Law... Breakin' the Law  (Undefined behavior)
    let typedPointer2 = pointer.bindMemory(to: Bool.self, capacity: count * 2)
    
    // If you must, do it this way:
    typedPointer1.withMemoryRebound(to: Bool.self, capacity: count * 2) {
        (boolPointer: UnsafeMutablePointer<Bool>) in
        print(boolPointer.pointee)  // See Rule #1, don't return the pointer
    }
}

/*:
 3.不要超出内存范围
 
 */
do {
    print("3. Don't walk off the end... whoops!")
    
    let count = 3
    let stride = MemoryLayout<Int16>.stride
    let alignment = MemoryLayout<Int16>.alignment
    let byteCount =  count * stride
    
    let pointer = UnsafeMutableRawPointer.allocate(bytes: byteCount, alignedTo: alignment)
    let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount + 1) // OMG +1????
    
    for byte in bufferPointer {
        print(byte)  // pawing through memory like an animal
    }
}


/*:
 参考：
 - http://www.swiftyper.com/2017/01/15/unsafe-swift/
 - https://news.realm.io/news/goto-mike-ash-exploring-swift-memory-layout/
 */
