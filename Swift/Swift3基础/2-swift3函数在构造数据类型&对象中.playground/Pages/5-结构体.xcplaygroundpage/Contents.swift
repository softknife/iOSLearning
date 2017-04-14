//: [Previous](@previous)

import UIKit

///1.结构体的定义
struct Location {
    /** x*/
    var x : Double
    var y : Double
    /** z*/
    var z : Double
    
//    init(x:Double,y:Double,z:Double) {
//        self.x = x
//        self.y = y
//        self.z = z
//    }
}


/// 2.创建结构体
// 对于我们自己创建的结构体,如果我们不实现自定义的构造方法,那么系统会默认帮我们生成构造方法
let l1 = Location.init(x: 20, y: 30, z: 40)
let l2 = Location(x: 30, y: 40, z: 50)

//系统结构体的创建
let point = CGPoint.init(x: 20, y: 30)
let point1 = CGPoint(x: 30, y: 40)
let rect = CGRect(x: 0, y: 0, width: 20, height: 20)


/// 3.结构体中的构造函数
/* 1.创建一个结构体时,本质上都是在调用我们的构造函数;
 * 2.默认情况下系统会给结构体提供默认的构造函数;
 * 3.构造函数都不需要写返回值
 * 4.如果自定义构造函数,那么必须保证构造函数结束时,所有的属性被初始化
 * 5.如果自定义构造函数,那么系统不会帮我们提供默认的构造函数,需要手动去写
 */

struct Location1{
    /** x*/
    var x : Double = 0
    /** y*/
    var y : Double = 0
    
    // 系统默认
    init() {
    }
    
    // 系统默认
    init(x : Double,y:Double) {
        self.x = x
        self.y = y
    }
    
    // 自定义
    init(x :Int,y:Int) {
        self.x = Double(x)
        self.y = Double(y)
    }
    // 自定义
    init(x: CGFloat,y:CGFloat) {
        self.x = Double(x)
        self.y = Double(y)
    }
    
}

var loca = Location1(x: 10, y: 10)


/// 4.结构体中的扩充函数
/*
 * 1.swift中,结构体中可以扩充函数;
 * 2.普通函数,直接扩充
 * 3.如果扩充函数中需要对属性进行修改,需要用mutating修饰该函数
 */

// 1.给自定义结构体扩充
extension Location1 {
    func getAllPropreties() {
        print("x:\(x),y\(y)")
    }
    
    mutating func moveX(_ distance:Double){
        self.x += distance
    }
    
}


loca.getAllPropreties()
loca.moveX(10)

// 2.给系统结构体扩充
extension CGRect{
    mutating func moveX(_ diff: Double)
    {
        self.origin.x += CGFloat(diff)
    }
}

var rect1 = CGRect(x: 0, y: 0, width: 10, height: 10)
rect1.moveX(10)

extension UIButton {
    func getTitle() -> String? {
    
        guard let title = self.titleLabel?.text else {
            return nil
        }
        
        return title
        
        
    }
}

let btn = UIButton(type: .custom)

btn.currentTitle
btn.getTitle()




