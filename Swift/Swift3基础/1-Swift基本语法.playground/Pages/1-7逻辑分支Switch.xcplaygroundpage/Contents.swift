//: [Previous](@previous)

import Foundation


/*
 * Swift中switch 
 * 1.条件可以不用括号
 * 2.case 可以不用break,因为不会穿透,如果真想穿透使用falltrough
 * 3.case 必须列举所以可能case,或者使用default
 * 4.case 可以使多个选项值拼在一块
 * 5.case 可以布尔
 * 6.case 可以使用区间
 * 7.case 可以使用int float double string等
 区间使用: http://www.tuicool.com/articles/JvyAzqz
 *
 */

let sex = 0

// 不穿透
switch sex {
case 0:
    print("男")
case 1:
    print("女")
default:
    print("泰国人")
}

// 多选
switch sex {
case 0,1:
    print("中国人")
default:
    print("萨瓦迪卡")
}

// 区间
switch sex {
case 0..<2:
    print("正常")
default:
    print("三倍体")
}

// 穿透
switch sex {
case 0,2:
    print("0")
    fallthrough
case 1:
    print("1")
    fallthrough
default:
    print("其他")
}

// 布尔
var x = true
switch x {
case true:
    print(x)
case false:
    print("false")
}

// 浮点型
let c = 1.1
switch c {
case 1.1:
    print("1.1")
default:
    print("失败")
}


// 字符串
var a : String = "11"
switch a {
case  "11" :
    print("解包成功")
default:
    print("失败")
}

// 元组
var b = (1,2)

switch b {
case (1,2) :
    print("成功")
default:
    print("失败")
}

// 对于不想关心的值,可以缺省
switch b {
case (_ , 1):
    print("失败")
case (_ , 2):
    print("成功")
case (0...1,_):
    print("也可以使用区间,如果是值类型")
default:
    print("非法")
}


// 元组中支持数值绑定
var bbb : String? = "b"
let info = (1,bbb)

switch info {
case (1 , let jiebao): // 只是一个值传递而已,并没有解包
    print(jiebao ?? "a")
    let test = "1" + jiebao!
default:
    print("正确")
}

switch info {
case let (1 ,  jiebao): // let写法2
    print(jiebao!)
    fallthrough
default:
    print("正确")
}

switch info {
case let (value ,  jiebao): // 这样写就没有意义了,因为这个case一定能走进去,缺少必要的限制条件
    print(jiebao ?? "b")
    
default:
    print("正确")
}

// 元组值绑定+判断
switch info {
case let (1 ,  jiebao) where jiebao != nil:
    print(jiebao ?? "b")
    
default:
    print("错误")
}

// 一般值绑定+判断
var ff : String? = "a"
switch ff {
case  var kk where kk == "c":
    print(kk ?? "c")
default:
    print("失败")
}
