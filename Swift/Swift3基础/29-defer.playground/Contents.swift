//: Playground - noun: a place where people can play

import UIKit

/*:
 > defer关键字
 
 defer关键字用来处理类似Ojective C中@try-@catch-@finally中，@finally的作用。
 1.defer代码块的内容在退出作用域之前会被执行;
 2.多个defer会按照逆序的方式执行。
 3.当你的程序遇到严重错误，比如fatalError,或者强制解析nil，或者segfaults的时候，defer的代码块并不会执行。
 */
