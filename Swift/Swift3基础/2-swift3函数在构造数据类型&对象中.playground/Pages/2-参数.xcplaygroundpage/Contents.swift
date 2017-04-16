//: [Previous](@previous)

import Foundation

/// 1.内外参数
// 默认情况下函数的参数既是内部参数(内部使用的参数),也是外部参数(外部使用的参数),但是我们可以通过自定义参数名,实现内外参数的区分
func sum(param1 a: Int,param2 b:Int) -> Int{
    
    return a + b
}

let result0 = sum(param1: 10, param2: 20)

//func go(to somePlace:String) {
//
//    
//}
//
//go(to: "beijing")

/// 2.值传递,引用类型(渐忘指针传递)
//默认情况下参数是值传递,使用inout类型修饰符可以完成指针传递的效果
func sum1(param1 a: inout Int,param2 b:Int) -> Int{
    
    a = 6666
//    b = 1111 //错误
    return a + b
}

var para1 = 10
var para2 = 20

let result1 = sum1(param1: &para1, param2: para2)
print(para1,para2)

///3.参数默认类型
// 默认情况下形参是let的,swift3.0后不能强制改变形参为var
func test(a:Int){
    
    //a += 1 //错误
    let a1 = a + 1
   
    print(a1)
}

test(a: 10)

/// 4.参数忽略
func test1(_ a :Int){
    print(a)
}
test1(10)


/// 5.默认参数
// 有默认参数时,我们可以选择不给该参数传递值
func test2(a:Int = 10){
    print(a)
}

test2()
test2(a: 20)

/// 6.可变参数
// 使用...表示可变参数
func sum2(nums:Int...) ->Int{

    var total = 0
    for num in nums {
        total += num
    }
    return total
}

sum2(nums: 1,2,3,4,5)

// 可变参数位置调整
func sum3(nums:Int...,num1:Int) -> Int{

    var total = num1
    for num in nums {
        total += num
    }
    
    return total
}

sum3(nums: 1,2,3,4, num1: 5)


/**
 # 简写参数名
 - $x
 如果一个闭包有一个或多个参数，Swift 允许我们给它们定义变量名
 */

func say(_ message: String, completion: (_ goodbye: String) -> Void) {
    print(message)
    completion("Goodbye")
}

    

say("Hi") { (goodbye: String) -> Void in
        print(goodbye)
}

// 其实上面闭包中参数没有存在的必要
say("Hi") { print($0) }


