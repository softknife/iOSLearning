//: [Previous](@previous)

import Foundation

// 1.无参数无法返回值函数
func test(){
    print("无参数无返回值")
}

test()

// 2.有参数无返回值函数
func test1(a : Int){
    
    print(a)

}
test1(a: 2)

// 3.无参数有返回值函数
func test2() -> String{
    return "2222"
}
test2()


// 4.有参数有返回值函数
func test3( a : Int) -> Int{

    return a % 2
}
test3(a: 5)

// 5.多参数多返回值函数
func test4(a: Int,b : Int) -> (Int,Int){
    
    return (a + b,a - b)

}
let tuple = test4(a: 5, b: 8)
tuple.0
tuple.1

