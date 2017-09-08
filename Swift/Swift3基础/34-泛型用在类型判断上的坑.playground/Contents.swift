//: Playground - noun: a place where people can play

import UIKit

/*
 泛型与protocol结合使用时,一定要注意:
 protocol中Self和self可能不同的!!! 例如Self是父类,而self是真实的派生类
 */

public final class MX<T>{
    public let base : T
    init(base:T) {
        self.base = base
    }
    static func testAbstractClass(){
        print("测试抽象类型传入的真实类型:\(self)")
    }
}

protocol Compatible{}
extension Compatible{
    
    static var mx:MX<Self>.Type{
        print("获取真是的类型:\(self)")
        let type = MX<Self>.self
        type.testAbstractClass()
        return type
    }
}

class TestClass:Compatible {}
class SubTestClass:TestClass{}

func test(_ test:TestClass.Type){

    print("========testbegin======")
    print("Test1:  \(test)")
    print("Test1-mx: \(test.mx)")
    print("========testend========\n\n")
    
}


func test2<T:TestClass>(_ test:T.Type){
    print("========test2begin======")
    print("Test2:  \(test)")
    print("Test2-mx: \(test.mx)")
    print("========test2end========\n\n")

}


test(TestClass.self)
test(SubTestClass.self)
print("-------------------------------------\n")
test2(TestClass.self)
test2(SubTestClass.self)


