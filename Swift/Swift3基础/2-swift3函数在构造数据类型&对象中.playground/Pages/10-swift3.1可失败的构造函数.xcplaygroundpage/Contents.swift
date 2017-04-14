//: [Previous](@previous)

import Foundation

/**
 可失败构造器 （ Failable Initializers ），新的序列函数等等。
 
 可失败的数值转换构造器（Failable Numeric Conversion Initializers）
 
 Swift 3.1 为所有数值类型 (Int, Int8, Int16, Int32, Int64, UInt, UInt8, UInt16, UInt32, UInt64, Float, Float80, Double) 添加了 可失败构造器 。
 */

// 这个功能非常有用，例如，以安全、可恢复的方式处理外源松散类型数据的转换，下面来看 Student 的 JSON 数组的处理：

class Student {
    let name: String
    let grade: Int
    
    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
            let gradeString = json["grade"] as? String,
            let gradeDouble = Double(gradeString),
            let grade = Int(exactly: gradeDouble)  // <-- 3.1 的改动在这
            else {
                return nil
        }
        self.name = name
        self.grade = grade
        
    }
}

func makeStudents(with data: Data) -> [Student] {
    guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
        let jsonArray = json as? [[String: Any]] else {
           
            return []
    }
    return jsonArray.flatMap(Student.init)
}

let rawStudents = "[{\"name\":\"Ray\", \"grade\":\"5.0\"}, {\"name\":\"Matt\", \"grade\":\"6\"},{\"name\":\"Chris\", \"grade\":\"6.33\"}, {\"name\":\"Cosmin\", \"grade\":\"7\"},{\"name\":\"Steven\", \"grade\":\"7.5\"}]"

let data = rawStudents.data(using: .utf8)!

let students = makeStudents(with: data)

// 标准库中的 dump（转储）函数实现保护。dump 非常有趣，因为它使用 Swift 的反射功能，用一个字符串类型存储值或者对象中的所有存储字段。通常由 dump 展示出的值或者对象的内部情况要比其自身的 description 或者 debugDescription 更详细。 https://developer.apple.com/reference/swift/1641218-dump
dump(students) // [(name: "Ray", grade: 5), (name: "Matt", grade: 6), (name: "Cosmin", grade: 7)]






