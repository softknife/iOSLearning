//: [Previous](@previous)

import Foundation


/** 协议中使用范型!
 swift中的协议(protocol)采用的是“Associated Types”的方式来实现泛型功能的，通过associatedtype关键字来声明一个类型的占位符作为协议定义的一部分。swift的协议不支持下面的定义方式：
 */


//protocol GeneratorType<Element> {
//    mutating func next() -> Element?
//}

// 而是应该使用这样的定义方式：
protocol GeneratorType {
    associatedtype ItemType
    func next() -> ItemType
    var count:ItemType {get}
    
}


struct Person:GeneratorType {
    
    // 可以不写
//    typealias Element = Int
    func next() ->  Int{
        
        return 1
    }
    
    var count: Int  {
        return next()
    }
}

struct Teacher : GeneratorType {
    func next() -> String {
        return "teacher"
    }
    
    var count: String {
        return next()
    }
}



/// 在swift中，class、struct、enums都可以是用参数化类型来表达泛型的，只有在协议中需要使用associatedtype关键字来表达参数化类型。为什么协议不采用<T>这样的语法形式呢？我查看了很多讨论，原因大概总结为一下两点：

/*
 采用语法<T>的参数化方式的泛型其实定义了整个类型的家族，在概念上这对于一个可以具体实现的类型(class、struct、enums)是有意义的，比方说Array<Int>,Array<String>。但对于协议来说，协议表达的含义是single的。你只会实现一次GeneratorType，而不会实现一个GeneratorType<String>协议，接着又实现另外一个GeneratorType<Int>协议。
 
 协议在swift中有两个目的，第一个目的是用来实现多继承(swift语言被设计为单继承的），第二个目的是强制实现者必须准守自己所指定的  [泛型约束]💕 。关键字associatedtype是用来实现第二个目的的。在GeneratorType中由associatedtype指定的Element，是用来控制next()方法的返回类型的。而不是用来指定GeneratorType的类型的。
 
 具体参考:http://www.jianshu.com/p/ef4a9b56f951
 */


/// 高级用法,NSNotificationCenter中的协议范型使用 
//http://swift.gg/2017/04/13/swift-nsnotificationcenter-protocol/

protocol Notifier {
    // 这句话的意思是,如果某个struct/enum/class...遵守该协议,那么他内部必然有关联类型,遵守了RawRepresentable协议
    associatedtype Notification: RawRepresentable
    
}

// 例如:如果在项目中的类或结构体想要发布通知，那就应该遵守 Notifier 协议，并提供遵守 RawRepresentable 协议的关联类型。
class Barista : Notifier {
    enum Notification : String {
        case makingCoffee
        case coffeeMade
    }
}

// 在 Swift 中，由于枚举也可以遵守 RawRepresentable 协议，所以可以使用一个 String 类型的枚举，并命名相应的通知。

class Beijing : Notifier {
    /*
     5-关联类型.xcplaygroundpage:31:20: note: protocol requires nested type 'Notification'; do you want to add it?
     associatedtype Notification: RawRepresentable
     */
    
    enum Notification : String {
        case peeking
        case greatWall
    }
    
}
