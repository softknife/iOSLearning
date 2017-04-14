//: [Previous](@previous)

import Foundation

// 构造函数
// 1.在类中默认系统会提供一个默认的构造函数 init()
// 2.在swift中,必须保证构造函数结束时,所有属性必须被初始化

// 1.定义类
class Cat {
    /** 体重*/
    var weight  = 0.0
}

class Person {
    /** 名字*/
    var name = ""
    /** 年龄*/
    var age = 0
    /** 身高*/
    var height = 0.0
    
    /** 猫*/
    var cat : Cat?
    
}

// 2.创建对象

let p = Person()
p.name = "json"
p.age = 19
p.height = 1.99
p.cat = Cat()
