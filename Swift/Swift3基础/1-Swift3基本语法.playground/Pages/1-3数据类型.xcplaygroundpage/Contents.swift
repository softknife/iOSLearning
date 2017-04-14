//: [Previous](@previous)

import Foundation

/*
 * Swift 和 OC语言 及 C语言中的数据类型对比
 */

/// C语言中的数据类型一般都是栈中管理,除非手动申请
/*栈中数据类型:
 *基本数据类型
 * 字符类型    : char
 * 整型       : int short long
 * 浮点型      :float double
 *构造数据类型
 * 数组 xx[]
 * 结构体 struct
 * 联合体/共用体 union
 * 枚举
 *指针类型
 *空类型
 
 *堆中数据类型:
 *手动管理:手动申请malloc/new 手动删除free/delete
 
 
 // http://www.cnblogs.com/emanlee/archive/2009/04/12/1434278.html
 一个由c/C++编译的程序占用的内存分为以下几个部分
 
 1、栈区（stack）— 程序运行时由编译器自动分配，存放函数的参数值，局部变量的值等。其操作方式类似于数据结构中的栈。程序结束时由编译器自动释放。
 
 2、堆区（heap） — 在内存开辟另一块存储区域。一般由程序员分配释放， 若程序员不释放，程序结束时可能由OS回收 。注意它与数据结构中的堆是两回事，分配方式倒是类似于链表，呵呵。
 
 3、全局区（静态区）（static）—编译器编译时即分配内存。全局变量和静态变量的存储是放在一块的，初始化的全局变量和静态变量在一块区域， 未初始化的全局变量和未初始化的静态变量在相邻的另一块区域。 - 程序结束后由系统释放
 
 4、文字常量区 —常量字符串就是放在这里的。 程序结束后由系统释放
 
 5、程序代码区—存放函数体的二进制代码。
 
 */



/// OC语言
/*
 * 栈中的数据类型
 * 基本数据类型
 NSInteger NSUInteger
 CGFloat
 BOOL
 * 构造数据类型
 ENUM
 
 * 指针类型
 
 
 * 堆中的数据类型
 * 对象 NSxx
 
 
 NSObjCNoType = 0,
 NSObjCVoidType = 'v',
 NSObjCCharType = 'c',
 NSObjCShortType = 's',
 NSObjCLongType = 'l',
 NSObjCLonglongType = 'q',
 NSObjCFloatType = 'f',
 NSObjCDoubleType = 'd',
 NSObjCBoolType = 'B',
 NSObjCSelectorType = ':',
 NSObjCObjectType = '@',
 NSObjCStructType = '{',
 NSObjCPointerType = '^',
 NSObjCStringType = '*',
 NSObjCArrayType = '[',
 NSObjCUnionType = '(',
 NSObjCBitfield = 'b'
 
 */

/// Swift中
/*
 * 栈中的数据类型
 构造数据类型: 结构体
 * Int UInt Int32/64......
 * Float Float32/64....
 * Double
 * Array
 * Set
 * Dictionary
 * String
 * 元组(xx,yy,zz) //不清楚他到底是否为结构体
 * 堆中的数据类型
 * 对象
 * Foundation 框架
 * NSString
 * NSDate
 * NSURL
 * .....
 
 * UIKit框架
 * UIView
 * UIViewController
 * .....
 */

let a : Float = 1.1
let b : Double = 1.1
let c : Array = [AnyObject]()
let d : Array = [Any]()
let e : Dictionary = [Int : Any]()
let f : Dictionary = [Int : AnyObject]()
let (aa,bb) = ("11",11)
// 所以此处我们也可以知道为啥Swift中的非对象数据类型也可以赋值为nil了!!!

var g : Set<String>?


/// 我们思考一个问题,为啥Swift中的值要分为强类型和可选类型?
/*
 * 个人认为,这真正体现了Swift这门语言的健壮性! 
 * 对于任何一个值,他只存在有意义和无意义的状态,而不应该存在第三种状态,对于这一点,在计算机领域,我是深信不疑的!
 * 那么计算机中如何标记这两种值的状态那? 
    * 我想应该是 空 / 对象 这对值
 
 * 那么,在这种概念下, stack中和heap中申请的变量/常量都应该遵守这一法则!
 * 新的问题,常规的常规Apple开发语言中, C/OC中的值并不能完美的分为这两大类,因为:
    * 他们中即存在基本数据类型,例如:NSIntegar/int ,这种类型变量的值只能归为0/非0两大类;
    * 也存在对象(结构体)类型的数据,例如:NSArray,这种类型变量的值可以归为空/对象两大类
    
    * 可见,常规的语言,并不足以满足现代计算机编程思想的大统一概念!Swift中,又是如何弥补这一缺憾的那?
 
 * 我想Swift中应该是这样来标识的!
    * 1.使用一种特殊的结构体(或者说特殊的对象)来标记无意义的值
    * 2.使用一般的结构体(对象)来标记有意义的值
    * 这种特殊的结构体,我们我们称之为nil; 而一般值分为常规结构体和对象,其实对象就是特殊的结构体
 * 所以,我们看到,Swift定义的所有的可选类型变量,都可以被赋值为nil; 而如果是明确的强类型定义的变量,我们只能给他明确的值!
 */
