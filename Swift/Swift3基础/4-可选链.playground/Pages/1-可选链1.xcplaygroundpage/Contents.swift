//: [Previous](@previous)

import Foundation

// 1.定义两个类
class Person {
    var name = ""
    /** book*/
    var book  : Book?
}

class Book{
    /** 价格*/
    var price : Double = 0.0
    
    func transferKnowledge() -> Void {
        print("大大大")
    }
}

// 2.创建两个对象
var person : Person? = Person()
var book : Book? = Book()


// 3.给person的book属性赋值
//3.1 太麻烦
if let person = person {
    person.book = book
}

print(person?.book ?? Book())
//swift3.0中,打印可选类型变量,需要提供默认值,但是不能是nil, error: nil is not compatible with expected argument type 'Any'

// 3.2 太危险
person!.book = book

// 3.3 正确方法
person?.book = book
person?.book = Book()


person?.book?.price = 100000.0

// 可见所谓可选链,只是可选绑定的另一种简便写法


// 使用可选链执行函数
person?.book?.transferKnowledge()

