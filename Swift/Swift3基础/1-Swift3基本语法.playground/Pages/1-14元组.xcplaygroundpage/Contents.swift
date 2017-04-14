//: [Previous](@previous)

import Foundation

/*
 * 元组:tuple,当我们想存放一组不同类型的数据时
    * 1. 使用数组就不合适了,因为我们后续访问时不方便,也不能知道某个元素的具体类型,Swift的数组并不建议我们用来存放不同类型的数据
    * 2. 使用字典,不够直白,需要知道对应的key,也无法直接知道访问value的类型
    * 此时就需要使用元组
 * 注意元组并不是数据结构
 */

// 形式1.通过下标访问,很明显不够见名知意
let tuple = (18,120,1.88,"王小丫")
tuple.0
tuple.2

// 形式2.通过拟定的名字访问每个元素
let tuple1 = (age:18,weight:120,height:1.88,name:"王小丫")
tuple1.age
tuple1.weight
tuple1.height
tuple1.name


// 形式3. 这种形式给人感觉好像定义的全局变量一样
let (age,weight,height,name) = (12,100,1.77,"小雅")
age
weight
height

