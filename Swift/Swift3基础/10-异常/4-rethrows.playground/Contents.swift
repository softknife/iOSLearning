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

