//: Playground - noun: a place where people can play

import UIKit


/* 0x0
 * Swift中的数据类型:
 * 总体上分为强类型和可选类型
 
 * 强类型---Any:
 * 就是不能为nil,必须有明确的值
 
 * 可选类型---Optional<Any>:
 * 就是既可以为nil,也可以为确定值
 */

/// 赋值上的强势表现
// 如果你想给你变量/常量赋值为nil,那么这变量必须为可选的
let any : Optional<Any> = .none
let anyThing : Optional<Any> = nil
let a : Int? = nil // Int? 为上面写法的语法糖
let a111 : Int? = .none


// 这样是错的
// let a : Int = nil

// 同理
var b : Double? = nil


var c : Int = 0
//c = nil //这样也是错的

var d : String?
let e : Int? // 此时,编译器不会帮我们给初始值,因为只有一次赋值机会
var f : Int
let g : Double



/// 计算上的强势表现
let a1 : Int = 10
let b1 : Double = 1.9
//let c1 = a1 + b1 //这样就是错的,类型不同,不会隐式帮我们转换成同一种类型,再计算
let aaaaa = Int(10.1)

/// 结论:
///    强类型变量,如果我们在定义时不给他初始值,那么编译器并不会帮我们赋值,和OC不同
///    可选类型并且是变量,我们定义时,如果不给他初始值,那么编译器会默认帮忙我赋值为nil


// 可选类型的另一种形式,真奇怪
var h : Int! = nil
var i = h // 此时h变量本身是Int!类型,而i是Int?




/// 注意:在Class中,无论常量还是变量,必须是定义时就得赋初始值,不存在系统帮我们赋默认值的情况,强类型语言!

class aaa {
    
    /** <#注释#>*/
    //let aa : String? 错误
    //var aa : String 错误
    var aa : String? // ✔️因为编译器会帮我们赋值为nil
    
    
}
