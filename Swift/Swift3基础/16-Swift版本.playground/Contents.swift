//: Playground - noun: a place where people can play

import UIKit

/**
 您可以使用 #if swift(>= N) 静态构造 来检查特定的Swift版本：
 */

// Swift 3.0
#if swift(>=3.1)
    func intVersion(number: Double) -> Int? {
        return Int(exactly: number)
    }
#elseif swift(>=3.0)
    func intVersion(number: Double) -> Int {
        return Int(number)
    }
#endif

/*
 然而，当使用Swift标准库时，这种方法有一个主要缺点。它需要为每个受支持的旧语言版本编译标准库。这是因为当您以向后兼容模式运行Swift编译器时，例如您要使用Swift 3.0行为，则需要使用针对该特定兼容性版本编译的标准库版本。如果您使用版本3.1模式编译的，那么您根本就没有正确的代码

 因此，@available除了现有平台版本 [SE-0141]https://github.com/apple/swift-evolution/blob/master/proposals/0141-available-by-swift-version.md 之外，Swift 3.1扩展了该属性以支持指定Swift版本号：
 */

// Swift 3.1

@available(swift 3.1)
func swiftVersion(number: Double) -> Int? {
    return Int(exactly: number)
}

@available(swift, introduced: 3.0, obsoleted: 3.1)
func swiftVersion(number: Double) -> Int {
    return Int(number)
}