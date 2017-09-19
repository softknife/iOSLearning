



print("Hello, world!")



// 这里const 表示不可变,所以这里是UnsafePointer
//printAddress(<#T##p: UnsafePointer<Int32>!##UnsafePointer<Int32>!#>)
// 这里是可变的,所以是UnsafeMutablePointer
//doubler(<#T##p: UnsafeMutablePointer<Int32>!##UnsafeMutablePointer<Int32>!#>)

var ten: CInt = 10
doubler(&ten)
printAddress(&ten)


/// 1.我们并不能像在C中一样直接通过&符号获取变量的地址
//let tenPtr = &ten // error: variable has type 'inout CInt' (aka 'inout Int32') which includes nested inout parameters

// 如果我们想获取该变量的地址,那么我们需要使用如下函数
withUnsafePointer(to:&ten){
    
    print($0.pointee ) // 此时这里pointee是只读的 $0类型UnsafePointer<CInt>
}

print(ten)

withUnsafeMutablePointer(to: &ten) { ptr in
    ptr.pointee = 11  // 该方法可以通过地址修改变量
}

print(ten) // 注意上述获取的变量地址只在大括号中是安全的!


/// 2.手动获取内存空间
// 将无类型空间转为具体类型空间,这里需要我们自己管理内存, 类型检查,对齐等任务都需要自己管理
let rawPointer = malloc( 10 * MemoryLayout<Int>.size)! // 假设我们一定可以分配到内存
let intPtr = rawPointer.bindMemory(to: Int.self, capacity: 5 * MemoryLayout<Int>.size) // 这里我们只是把前一半的空间初始化为Int类型的空间, 后一半任然是无类型空间 , 并且只能绑定一次 

// 将有类型空间转换为无类型空间
let bindedRawPointer = UnsafeMutableRawPointer(&ten)
let tenPointer = bindedRawPointer.assumingMemoryBound(to: CInt.self)


// 3.指针类型转换
let intPtr1 = UnsafeMutablePointer<CInt>.allocate(capacity: 1)
intPtr1.initialize(to: 0x1233444)

// 1 CInt(Int32) = 4 * Int8
intPtr1.withMemoryRebound(to: Int8.self, capacity: 4) {
    
    // $0 - UnsafeMutablePointer<Int8>
    print($0[0])
    print($0[1])
    
}



//////////////////////////////////////////////////////////////////////////////////////
// 解除ARC监管对象
//////////////////////////////////////////////////////////////////////////////////////
class Foo{
    
    var foo = "foo"
    
    init() {
        print("Foo get initialized")
    }
    
    deinit {
        print("Foo get released ")
    }
}


// 为了在funcWithCallBack 访问的对象安全,我们需要将传入的对象解除ARC监管,需要我们自己监管!!!
if true {
    let fooObj = Foo()

    let unmanagedFoo = Unmanaged.passRetained(fooObj)
    let unmanagedPtr = unmanagedFoo.toOpaque()

    funcWithCallBack(unmanagedPtr) { (ptr : UnsafeMutableRawPointer!) in
        
        //  let fooObj = Unmanaged<Foo>.fromOpaque(ptr).takeUnretainedValue()
        let fooObj = Unmanaged<Foo>.fromOpaque(ptr).takeRetainedValue()

        // 获取对应的对象,takeUnretainedValue并不会将引用计数 -1
        // takeRetainedValue 才会-1
        
        print(fooObj.foo)
        
    }
}


//////////////////////////////////////////////////////////////////////////////////////
// 字符串
//////////////////////////////////////////////////////////////////////////////////////
// fputs是一个函数，具有的功能是向指定的文件写入一个字符串
// stdout这个表达式指向一个与标准输出流（standard output stream）相关连的 FILE 对象。
fputs("Hello world\n", stdout)

// 使用c方式访问字符串中的每个字符
"Hello world!".withCString {
    let elem = $0 // UnsafePointer<Int>
    debugPrint(elem.debugDescription)
}

// 获得一个字符的ASCII码值
let asciiOfA = UInt8(ascii:"A")

// 将某个数字转换成对应的字符
let character = Character(UnicodeScalar(60))
// 或者
_ = String(describing: UnicodeScalar(60))





