//: Playground - noun: a place where people can play

import UIKit

/// map 和 flatMap 这两兄弟专门负责将 “一个数组 转化为 另外一个数组”。

let array = ["111","","22233"]

/**
 # map
 - map函数能够被数组调用，它接受一个闭包作为参数，作用于数组中的每个元素，闭包返回一个变换后的元素，接着将所有这些变换后的元素组成一个新的数组。
 */

let transferArray = array.map { (element) -> Int? in
    
    let length = element.characters.count
    
    guard length > 0 else {
        return nil
    }
    
    return element.characters.count
    
}

print(transferArray)


/**
 # flatMap
 - flatMap很像map函数，但是它摒弃了那些值为nil的元素。
 - 另外一个与map函数不同之处在于：倘若元素值不为nil情况下，flapMap能够将可选类型(optional)转换为非可选类型(non-optionals)。
 
 */

let transferArray2 = array.flatMap { (string:String) -> Int? in
    let length = string.characters.count
    guard length > 0 else {
        return nil
    }
    
    return string.characters.count
}
print(transferArray2) //[5, 8, 6]


/**
 # flatMap-字典转模型
 */
struct Person:CustomStringConvertible {

    var name : String?
    
    var height: Double?
    
    
    init?(dict:[String:Any]) {
        
        guard   let name = dict["name"] as? String ,
                let height = dict["height"] as? Double else {
            
                return nil
                    
        }
        
        self.name = name
        self.height = height
        
    }
    
    
    
    var description: String {
    
        return "\(String(describing: name)) \(String(describing: height))"
    }
   
    
}


let personArray =  [
                    ["name":"eric","height":180.0],
                    ["name":"gloria","height":175.0]]

let data = try? JSONSerialization.data(withJSONObject: personArray, options: .prettyPrinted)

let jsonString = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)

let jsonArray = jsonString as? [[String:Any]]

let modelArray = jsonArray?.flatMap(Person.init(dict:))
let modelArray1 = jsonArray?.flatMap(Person.init)

print(modelArray ?? "失败")


