//: [Previous](@previous)

import Foundation

/*
 * 其实guard就是if的语法糖,反向操作而已
 */

let a = 8
if a > 5 {
    let b = a
    
    print("在这里进行业务逻辑")
}




func testGuard() -> Bool{
    
    let b = arc4random() % 2
    // guard需要用在函数或者循环中
    guard b > 5 else {
        
        return false
    }
    
    print("在这里进行业务逻辑")

    return true
}

testGuard()
