//: [Previous](@previous)

import Foundation

/*
 * 类型推导:
 *1.如果是初始化强类型变量,那么,编译器会根据我们初始化变量时给定的初始值,自行判断该变量/常量所属类型,不需要我们赋值
 *2.如果我们直接声明为可选类型,那么就需要我们自己拟定好范型
 */

// 1.强类型变量/常量定义
let a = 1 // 该处会自行推导为申请内存最合适的整形,即Int 而是Int32/64等
var b = 1.1 // 自定推导为Double

// 2.直接声明为可选类型
var c : String?


/*
 * 类型转换:
 * 结构体类型
 * 对象类型
 由于结构体/对象都能定义方法,所以,都可以调用自己的方法去完成类型转换
 */

let aInt = 10
let toDouble = Double(aInt) // Double(v : aInt)其实就是这个,只不过参数缺省了

// 结构体转OC基本类型
aInt as NSInteger

// 结构体转OC对象
let aArray = [String]()
aArray as NSArray

var aString = ""
let ocString = aString as NSString


ocString.substring(to: 0)
//aString.substring(to: 0) // 这样就不行,Swift中String是结构体,他的方法不是很好用


/// as & is
/*
 * 类型转换用的as as? as!
 * 作用域限定的private fileprivate open public
 */

/// as : 用于将swift类型转换为OC类型
let string = "swift"

(string as NSString).substring(to: 2)

var test : String? = "111"

print(test)

/// as? : 用于将抽象类转换为具体类,弱转换
let array : [Any] = ["1",2,3]

print(array[0])

if  let a0 = array[0] as? String {
    print(a0)
}


/// as! :用于将抽象类型转换为具体类型,强制转换,不建议这样⚠️

let a1 = array[1] as! Int
print(a1)


/// is 用于判断是否为某种类型
// is 用于判断值类型,isKindOf用于判断对象
if array[2] is Double {
    print("b1 是double类型")
}



