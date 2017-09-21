//: Playground - noun: a place where people can play

import UIKit


class KPTest : NSObject{

    @objc var name = "王小二"
}


let test = KPTest()


let value = test.value(forKeyPath: #keyPath(KPTest.name)) //结果是Any? 类型!!!

test.setValue("ddddd", forKey: #keyPath(KPTest.name))

print(test.name)




////////////////////////////////////////////////////////////////////////
// swift4中
///////////////////////////////////////////////////////////////////////////
// 取值
let nameKeyPath = \KPTest.name
var valueName = test[keyPath:nameKeyPath] // 类型是String
// 赋值
test[keyPath:nameKeyPath] = "张三"
//test[keyPath:nameKeyPath] = 1 // 这样是错的,因为编译器可以检测到,该keypath对应的值是String类型




struct Foo{
    var baz = [1,2,3,4]
}
// 数组访问
var foo = Foo()
_ = foo[keyPath:\Foo.baz]
//  key path support for subscript components is not implemented
//foo[keyPath:\Foo.baz[1]]




// KVO
class Child:NSObject{
    
    let name : String
    
    // KVO-enabled properties must be @objc dynamic
    @objc dynamic var age : Int
    
    init(name:String,age:Int) {
        self.name = name
        self.age = age
        super.init()
    }
    
    func happyBirthday()  {
        age += 1
    }
    
}


// 添加KVO
let jhonson = Child(name: "jonson", age: 10)
let observation = jhonson.observe(\.age, options: [.initial,.old]) { (child, change) in
    
    if let oldValue = change.oldValue{
        print("\(child.name)'s age changed from \(oldValue) to \(child.age)")
    }else{
        print("\(child.name)'s age is now \(child.age)")
    }
}

// this will trigger the KVO handler
jhonson.happyBirthday()

// Deiniting or invalidating the observation token
observation.invalidate()

// 此时不会在触发KVO
jhonson.happyBirthday()



