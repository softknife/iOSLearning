//: [Previous](@previous)

import Foundation


/// 1.属性的访问
/*
 * 1.存储属性
 * 2.只读属性(计算属性)
 * 3.类属性
 */

class Student {

    // 1.存储属性
    var name = ""
    /** age*/
    var age = 0
    /** mathScore*/
    var mathScore = 0.0
    /** chineseScore*/
    var chineseScore = 0.0
    
    // 2.计算属性(只读属性),计算型属性不占用存储空间!
    /** 平均值*/
    //    var averageScore : Double {
    //    
    //        return (mathScore + chineseScore) * 0.5
    //    }
    // 或者
    var averageScore : Double {
    
        get{
        
            return (mathScore + chineseScore) * 0.5
        }
    }
    
    
    // 3.类属性,只能通过类名进行访问,不能具体对象访问
    static var courseCount :  Int = 0
    
}


// 访问属性-注意:let 只是声明某个实例为常量,并不限制常量内部的属性的修改
// 访问存储属性
let student = Student()
student.name = "lilei"
student.age = 20
student.mathScore = 99.9
student.chineseScore = 59.9
// 访问计算属性
print(student.averageScore)
// 访问类属性
Student.courseCount = 2

/// 2.属性的监听
class Person {

    var name  = "" {
    
        // 隐藏临时属性newValue
        willSet (newName ){
        
            print(name)
            print(newName)
            
        }
        
        // 隐藏临时属性oldValue
        didSet{
            print(oldValue)
            print(name)
            
        }
    }
}

let per = Person()
per.name = "xiaoming"

