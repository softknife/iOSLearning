//: [Previous](@previous)

import Foundation


/// 1.定义协议
protocol PersonProtocol {
    
    func study()
    func play()

}


/// 2.创建一个类,并遵守协议,需要注意的是,如果该类继承自某个父类(超类),那么需要先写父类,再写遵守的协议(接口)
class Student : NSObject,PersonProtocol {
    
    func play() {
        print("玩虾米")
    }

    func study() {
        print("学习语文")
    }
    
    
}


/**:
 协议的组合 p1 & p2
 */
protocol Programable{
    func program()
}


class Programmer : PersonProtocol , Programable{
    func play() {
        print("玩吧")
    }
    func study() {
        print("学吧")
    }
    func program() {
        print("编程吧,少年")
    }
}


func FinishAppDebug(coder: PersonProtocol & Programable){
    
    coder.program()
}

let student = Student()
let coder = Programmer()

FinishAppDebug(coder: coder)


/*
 FinishAppDebug(coder: student) 这样写就是错的
 Playground execution failed: error: 1-协议的基本使用.xcplaygroundpage:55:23: error: argument type 'Student' does not conform to expected type 'PersonProtocol & Programable'
 FinishAppDebug(coder: student)
 ^~~~~~~
 as! PersonProtocol & Programable*/

/**:
 类&协议也可以组合,swift4中,才可以!
 */
//func DoSomeThingByCoderInSchool(_ coder: Student & Programable){
//
//    
//}


/**:
 协议中指定构造函数, 需要在遵守该协议的类中实现该构造方法,并且前面加required修饰
 */
protocol Teachable {
    init(className:String)
}

class Teacher : Teachable{
    
    required init(className: String) {
        
        
    }
}

// 如果是final class 可以不写required修饰符
final class EnglishTeacher : Teachable{

    init(className: String) {
        
    }
}



