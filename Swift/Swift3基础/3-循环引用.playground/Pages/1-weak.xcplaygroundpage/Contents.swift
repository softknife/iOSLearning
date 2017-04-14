//: Playground - noun: a place where people can play

import UIKit

/// 1.对象的循环引用,使用weak避免强引用,默认都是强引用
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
    weak var owner : Person?
    
    deinit {
        print("Dog deinit")
    }
}


var person : Person? = Person()
var dog : Dog? = Dog()


person?.name = "小明"
person?.dog = dog

dog?.name = "jack"
dog?.owner = person



//dog = nil
person = nil

dog?.owner?.name





///






