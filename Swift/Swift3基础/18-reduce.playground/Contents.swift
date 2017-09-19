//: Playground - noun: a place where people can play

import UIKit


let array = [0,1,2,3,4]

let result = array.reduce(-1) { (result, next) -> Int in
    
    return result + next
}

print(result)

/* 上述,参数表示
 第一个参数: 起始值:initialResult
 result参数: 迭代结果
 next参数: 下一个元素
 */

// 可以简写为:
let res = array.reduce(0){$0 + $1}
print(res)

