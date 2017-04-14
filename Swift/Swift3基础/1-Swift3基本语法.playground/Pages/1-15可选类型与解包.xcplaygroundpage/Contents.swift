//: [Previous](@previous)

import Foundation

/*
 * 可选类型的解包方法: 强制解包,可选绑定
 */

// 1.类型转换
let str = "12233"
let num = Int(str)

/// 强制解包
// 此处,我们明确的知道str变量可以强制解包为Int数值,所以,我们可以直接强制解包
func caculateNum(num:Int){
    print(num + 10)
}

caculateNum(num: num!)


/// 可选绑定 if let
let urlStr = "ericYellow.me"
//let url = NSURL(string: urlStr)
let url = URL(string: urlStr) // URL被重构成结构体了!

if let url = url {
    
    NSURLRequest(url: url )
    
    URLRequest(url: url)
}


/// 可选绑定 guard let else
let path = Bundle.main.path(forResource: "122", ofType: nil)

func TestClass() {

    guard let path = path else {
        return
    }
    
    print(path)

    
}


/// 注意,Switch中,并没有对可选变量进行可选绑定,只是一个临时变量传递作用!!
let a : String? = nil

switch a {
case let temp where temp == nil:
    
    guard let temp = temp else {
        break
    }
    
    let b = "1" + temp
    
default:
    print("xxx")
}
