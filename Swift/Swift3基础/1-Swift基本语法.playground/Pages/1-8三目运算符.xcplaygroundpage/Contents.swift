//: [Previous](@previous)

import Foundation

/*
 * 强类型的三目运算 & 可选类型的三目运算
 */

/// 强类型的三目运算
var a = 4
let  b = a > 3 ? true : false


/// 可选类型的三目运算
var c : Int?

let d = c ?? 666

// 或者
let e = c != nil ? c : 666
