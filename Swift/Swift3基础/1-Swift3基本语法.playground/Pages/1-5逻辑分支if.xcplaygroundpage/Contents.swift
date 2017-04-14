//: [Previous](@previous)

import Foundation


/*
 * if语句中()可以省略,也可以不省略,但是大括号不能省略
 * 判断条件只能是真或者假,不存在OC中的非0,非nil即真的概念
 */

let a = 5
if a > 10 {
    print("a大于10")
}


if a > 8 {
    print("很好")
}else if a > 7 {
    print("好得很")
}else{
    print(a)
}

let b = a > 8 ? true : false


// if 语句中的可选类型解包
var c : Int?

if let c = c {
    print("有值")
}else{
    print("没有值\(c)")
}
 
