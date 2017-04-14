//: [Previous](@previous)

import Foundation

///1.不像c中,swift中函数可以嵌套使用
func test()->Void{

    func nestFunc(){
        print("nestFunction")
    }
    
    print("testFunction")
    nestFunc()
}

test()


///2.函数类型的提取(是不是函数签名那?)

func operateNum1(a:Int,b:Int)->Int{
    
    return a + b
}

func operateNum2(c:Int,d:Int)->Int{

    return c - d
}

var functype  = operateNum1
functype(10,10)
functype = operateNum2
functype(10,10)


/// 3.方法重载
func testOverload(aaa:String){

}

func testOverload(aaa:Int){

}
