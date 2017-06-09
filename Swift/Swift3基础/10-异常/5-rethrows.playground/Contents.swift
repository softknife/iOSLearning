//: Playground - noun: a place where people can play

import UIKit

/*
 Swift异常处理体现了函数式语言的特性，因此我们可以传一个会抛出异常的函数闭包（高阶函数）作为参数传到另一个函数中（父函数），父函数可以在子函数抛出异常时直接向上抛出异常，这时用rethrow关键字表示引用闭包时抛出的异常。
 
 rethrow可以看作是throw的子集，Swift不把rethrow作为完整的类型。例如一个函数不能同时用throw和rethrow抛出异常，高阶函数闭包定义中也不能包含rethrow。rethrow更像函数的属性（类似@noreturn），rethrow只是在函数作为参数调用的上下文中才有意义，就是为了简化语法的。
 */

/*
 一个接受闭包作为参数的函数有下面三种throw选择
 
 1、throw异常，这表示这个函数可能会抛出异常，无论作为参数的闭包是否抛出异常
 2、rethrow异常，这表示这个函数本身不会抛出异常，但如果作为参数的闭包抛出了异常，那么它会把异常继续抛上去。
 例如:
 public func withUnsafeBytes<T, Result>(of arg: inout T, _ body: (UnsafeRawBufferPointer) throws -> Result) rethrows -> Result
 
 3、不抛出异常，这表示这个函数会处理参数闭包的异常，或者不对闭包进行运算。
 */

/*
 rethrow关键字在高阶函数中比较常见，所谓高阶函数，就是一个函数的参数或者返回值是函数类型。
 最常见的比如，Sequence协议map方法。
 public func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
 */
let array = [1,2,3]
let result = array.map{$0 * 2}

/**
 由于map函数传入的是一个闭包，这个闭包[可能]会抛出错误。由参数抛出的错误最后会向上传递给map函数。
 下面我们来让map rethrows我们自己闭包试试看!
 */

enum MapError : Error{
    case invalid
}
func customMapper(input:Int) throws -> Int{
    if input < 2{
        throw MapError.invalid
    }
    return input + 1
}
//let result = array.map(customMapper)
// 注意,这里customMapper这个闭包有可能会抛出异常!所以,我们这里不能直接调用!! 这和上面的 {$0 * 2} 这个闭包不一样
let re = try? array.map(customMapper)



/*
 下面我们来考虑一下第三种情况:
 函数自己处理闭包的抛出的异常!
 */

extension Array{
    func myMap<T>(_ transform: (Element) throws -> T) -> [T]{
        
        var newArray = [T]()
        for  e in self {
            
            let eResult = try? transform(e)
            
            guard let re = eResult else {
                continue
            }
            newArray.append(re)
        }
        
        return newArray
        
    }
}

// 可见这种情况我们就不需要try?
let newRe = array.myMap(customMapper)

print(newRe)
