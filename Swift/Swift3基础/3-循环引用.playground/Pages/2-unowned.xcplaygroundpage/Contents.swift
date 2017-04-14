//: [Previous](@previous)

import Foundation

/// 1.对象的循环引用,我们还可以使用unowned修饰符,类似于OC中的__unsafe_unretain 修饰符
class Person {
    /** name*/
    var name = ""
    /** dog*/
    var dog : Dog?
    
    deinit {
        print("person deinit")
    }
}

class Dog {
    /** name*/
    var name = ""
    unowned var owner : Person = Person()
    //  error: 'unowned' may only be applied to class and class-bound protocol types, not 'Person?'
    // 所以,看见unowned修饰的变量只能指向明确的类对象,不能是可选类型
    
    deinit {
        print("Dog deinit")
    }
}


var person : Person? = Person()
var dog : Dog? = Dog()

person?.name = "小明"
person?.dog = dog

dog?.name = "jack"

//dog?.owner.name = "" //访问僵尸对象

dog = nil
person = nil

/// weak和unowned区别:
/*
 weak 修饰的变量,在其指向的对象deinit时,会自动把变量指向0x0,即nil
 unowned 修饰的变量则不会,所以如果对象deinit后,还使用该变量访问对象内部属性,则会访问僵尸对象
*/
