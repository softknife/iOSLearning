//: [Previous](@previous)

import Foundation

class Person {

    /** name*/
    var name = ""
    /** age*/
    var age = 0
    
    // 当对象将要被系统销毁时,系统会调用deinit()函数,而不是dealloc函数
    deinit {
        print("将要被销毁")
    }
    
}


var p = Person()

p = Person()
// 此处p是引用类型
