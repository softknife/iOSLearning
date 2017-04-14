//: [Previous](@previous)

import Foundation

/// 1.root class
class Person {

    /** name*/
    var name = ""
    /** age*/
    var age = 0
    
    // 如果有自定义构造函数,那么系统不会提供默认的构造方法,需要自己写
    init() {
        
    }
    
    // 自定义构造函数,传入多个属性
    init(name : String,age : Int) {
        self.name = name
        self.age = age
    }
    
    // 自定义构造函数,传入字典
    init(dict : [String : Any]) {
        
        let name = dict["name"] as? String //将抽象类型转换为具体类型
        if let name = name { // 可选绑定
            self.name = name
        }
        
        if let age = dict["age"] as? Int {
            self.age = age
        }
        
    }
    
    
}


let 人1 = Person()

let 人2 = Person(name: "xiaoming", age: 18)

let 人3 = Person(dict: ["name" : "jack","age":18])


/// 2.subclass-KVC
class Student : NSObject {

    var name = ""
    /** age*/
    var age = 0
    
    override init() {
        
    }
    
    init(dict : [String : Any]) {
        
        // 使用kvc之前要使用super
        super.init()
        // error: use of 'self' in method call 'setValuesForKeys' before super.init initializes self
        setValuesForKeys(dict)
    }

    // 为了防止其他人传入不认识的key,我们需要重写这个方法
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

let stu = Student(dict: ["name": "xxx","age":18,"height":1.8])


/// 3.便利构造方法
extension Student{

    // Swift官方并不建议我们随笔的给系统的类添加便利构造方法,只有系统的指定构造方法不能满足初始化所有属性时,或者,不能满足我们快速创建一个实例时,我们才考虑扩充便利构造方法
    convenience init(test:String) {
        self.init() // 注意此处依赖于一个指定构造方法
    }
}

/* Any表示任何类型,包含构造数据类型(结构体/枚举),对象
 * AnyObject只能是对象
 * NSObject表示根类
 */


