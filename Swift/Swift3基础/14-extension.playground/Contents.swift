//: Playground - noun: a place where people can play

import UIKit

/**
 Concrete Constrained Extensions（姑且翻译为类的约束扩展吧）
 
 Swift 3.1允许您扩展具有类型约束的通用类型。以前，你不能像这样扩展类型，因为约束必须是一个协议。我们来看一个例子。
 

 */

extension String {
    var isBlank: Bool {
        return trimmingCharacters(in: .whitespaces).isEmpty
    }
}

let abc = " "
let def = "x"

abc.isBlank // true
def.isBlank // false

// 如果你希望 isBlank 计算型属性为一个可选值所用

// Swift 3.1
extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
}

var ccc:String?

ccc.isBlank



