//: Playground - noun: a place where people can play

import UIKit

/*:
 > 内容介绍:
 http://www.swift.gg/2016/12/13/swift-and-c-everything-you-need-to-know/
 * C 类型
     * 数组和结构体
     * 枚举
     * 联合体
     * 关于长度的那些事
     * Null,nill, 0
 * 宏定义
 * 指针操作
     * 内存分配
     * 指针计算
 * 字符串操作
 * 函数操作
     * Unmanaged
 * 文件操作
 * 位操作
 * Swift 和 C 的混合项目
 * 结束语
 */

/*: C 类型
* 每一个 C 语言基本类型， Swift 都提供了与之对应的类型。在 Swift 中调用 C 方法的时候，会用到这些类型：
 
 |        C 类型                   |       Swift 对应的类型      |      别名                 |
 |      :------:                  |        : ------ :         |     :------:              |
 |         bool                   |           CBool           |       Bool                |
 | char, unsigned char            |  CChar ,CUnsignedChar     |    Int8 ,UInt8            |
 | short, unsigned short          |  CShort ,CUnsignedShort   |    Int16 ,UInt16          |
 | int, unsigned int              |  CInt  ,CUnsignedInt      |    Int32 ,UInt32          |
 | long, unsigned long            |  CLong  ,CUnsignedLong    |    Int ,UInt              |
 | long long, unsigned long long  |  CLong  ,CUnsignedLong    |    Int64 ,UInt64          |
 | wchar_t, char16_t, char32_t    |  CWideChar,CChar16,CChar32| UnicodeScalar ,UInt16 ,UnicodeScalar |
 | float, double                  |  CFloat  ,CDouble         |    Float ,Double          |

 
 即使在你写一些需要调用 C APIs 的代码时，你都应该尽可能地使用 Swift 的 C 类型。你会注意到，大多数从 C 转换到 Swift 的类型，都是简单地使用了常用的 Swift 固定大小的类型，而这些类型，你应该已经相当熟悉了。
 */


/*: 数组和结构体
 * 定义一个全局数组:
 */
/**
char name[] = "IAmString"
*/

// 在 Swift 中，有可能会被转换成一个 Swift 字符串，或者至少是某种字符类型的数组。当然，当我们真正在 Swift 中使用这个导入的 name 数组，将会出现以下结果：
// print(name) // (97, 115, 100, 100, 97, 115, 100, 0)

/*
 这个事实告诉我们，当你在做一个 Swift/C 混合的应用下时，在 C 语言层面，推荐使用指针表示一个对象的序列，而不是使用一个普通的数组。这样能避免在 Swift 语言层面下痛苦的转换。
 但是等一下，如果我们使用一段复杂的代码转换数字元组，恢复成之前定义为数组的全局字符串，是否更加好呢？答案是否定的，我们将会在讨论指针的时候，介绍如何使用一小段代码如何复原数组元组。
 
 Struct
 幸运的是，以上的情况不会在处理结构体时候发生，将会如预期的转换为 Swift 的结构体，结构体的成员也将会按照预期的方式转换，每一个成员都会转换成对应的 Swift 类型。
 比如，有以下的结构体：

 */


/*
 # 在当前目录下创建一个空项目，类型为函数库，并包含测试样例模板：
 $ swift package init
 
 # 在当前目录下创建一个空项目，类型为可执行程序（命令行）：
 $ swift package init --type=executable
 
 # 在当前目录下创建一个空项目，类型为桥接C语言函数库：
 $ swift package init --type=system-module
 
 
 // 生产Xcode项目
 $ swift package generate-xcodeproj
 
 # 编译为debug目标：
 $ swift build
 
 # 执行测试：
 $ swift test
 
 # 清理所有临时编译文件
 $ swift build --clean=dist
*/








