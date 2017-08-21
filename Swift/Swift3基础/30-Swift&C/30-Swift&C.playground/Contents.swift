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
 * 
 */
