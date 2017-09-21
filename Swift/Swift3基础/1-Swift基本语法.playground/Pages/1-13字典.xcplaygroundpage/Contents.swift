//: [Previous](@previous)

import UIKit

/*
 * CRUD 遍历
 */

// 创建
let dict1 = [1:"aaa",2:"bbb"] // hashable
var dict2 = [String : Any]()
//var dict3 = [Array : Any] error: type 'Array' does not conform to protocol 'Hashable'
//var dict4 = [Dictionary : Any] error: type 'Dictionary' does not conform to protocol 'Hashable'
var dict3 = [Double : AnyObject]()

var dict4 = [NSString : AnyObject]()
var dict5 = [NSArray : AnyObject]()
var dict6 = [NSDictionary : AnyObject]()
var dict7 = [NSURLRequest : Any]()
var dict8 = [UIView : Any]()
//var dict9 = [Any : Any]() error: type 'Any' does not conform to protocol 'Hashable'
//var dict10 = [AnyObject : Any]() error: type 'AnyObject' does not conform to protocol 'Hashable'


///可见,swift中 对象 和 Int Double String是遵守Hashable协议的!Array Dictionary没有,不可以作为key,范型Any/AnyObject也不可以

let dict11 = [1 : 1, 2 : "1"] as [Int : Any] // 对于不规则存储,需要指明类型
// 或者
var dict12 : [Int:Any] = [3:4]
dict12[1] = 2
dict12[2] = "2"

// 增加
dict2["1"] = 2
dict2.updateValue(3, forKey: "2")
dict2

let dictx = ["222":444]


// 删除
dict2.removeValue(forKey: "4")


// 改变
dict2["1"] = 3
dict2.updateValue(5, forKey: "2")


// 查-根据key获取

// 遍历
for key in dict2.keys{
    print(key)
}

for value in dict2.values{

    print(value)
}

for (key , value) in dict2{
    print(key,value)
}

// 合并,不能像数组那样直接加
for (k,v) in dictx {
    dict2.updateValue(v, forKey: k)
    
}

///////////////////////////////////////////////////////////////////////
// Swift4
//////////////////////////////////////////////////////////////////////
// 1.丰富了Dictionary的initial方法:
// 通过uniqueKeysWith: [(key,value)]方法!!

let numberDict = ["one":1,"two":2,"three":3]
let evenColl = numberDict.lazy.filter{ $0.1 % 2 == 0} // 偶数  LazyFilterCollection<Dictionary<String, Int>>


let evenDict = Dictionary(uniqueKeysWithValues: evenColl.map{ (key: $0.0 , value: $0.1) } )
evenDict // 偶数字典!!!


let numbers = ["one","two","three"]
let newnumberDict = Dictionary(uniqueKeysWithValues: zip(numbers, 1...))

// 重复的元素
let duplicates = [("a",1),("b",2),("a",3),("b",4)]

let letterDict  = Dictionary(duplicates , uniquingKeysWith:{(first,_) in return first})

// 或者
let letterDict1 = Dictionary(duplicates , uniquingKeysWith:max)


let names = ["jame","jerry","tom"]
let groupNames = Dictionary(grouping: names) { (ele) -> Character in
    return ele.first!
}


// 2.字典默认值
let characters = "aaabbc"

var frequencies = [Character:Int]()

characters.forEach {
    
    // 此处 default表示如果frequencies这个字典中$0key对应value没有值,那么默认给定!
     frequencies[$0,default: 0] += 1
}

frequencies




