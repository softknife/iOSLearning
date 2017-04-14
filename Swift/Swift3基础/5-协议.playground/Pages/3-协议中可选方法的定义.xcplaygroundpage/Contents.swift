//: [Previous](@previous)

import Foundation

/*
 协议中的方法的可选
 1.Swift不建议方法写成可选类型
 2.如果希望某一个方法是可选的,那么需要在该方法前加上optional
 3.需要在协议前加 @objc
 4.加上@objc后,该协议只能被Class-type 遵守了!
 */

//@objc
//protocol SportPotocol {
//    
//    @objc optional func playFootBall()
//    func playBasketBall()
//    
//}

protocol SportPotocol {
    
    func playFootBall()
    func playBasketBall()
    
}

class Student:NSObject, SportPotocol {

    func playBasketBall() {
        print("打篮球")
    }
    
    func playFootBall() {
        print("踢足球")
        
        let season = Season(rawValue: 2)
        print(season?.rawValue ?? Season.fall)
    }
}

enum Season : Int,SportPotocol {

    case spring = 0
    case summer = 1
    case fall
    case winter
    
    func playFootBall() {
        
    }
    
    func playBasketBall() {
        
    }
}


// 测试
let stu = Student()
stu.playFootBall()


