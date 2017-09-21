//: [Previous](@previous)

import Foundation

/*
 * CRUD,遍历,分割
 */
// 创建
var aString = "hello playground!"
var bString = String("hello playground!!")
var cString = String(format: "%.04d年%.02d月%.02d日", arguments: [2016,10,30])
var dString = String(format: "%.02d月 %.02d日", 10,22)



// 拼接-增
let append = aString.appending("append")
let append1 = aString + "append1"
let append2 = aString.appendingFormat("%.02d月%.02d日", 1,2) // 格式化拼接
let append3 = "\(aString)-append3" // 转义拼接



// 删除
aString.remove(at: aString.index(aString.startIndex, offsetBy: 3) )
    
//aString.removeAll()
aString


// 改

let startIndex = aString.startIndex
let endIndex = aString.endIndex
// 按索引直接把string中的内容换了
aString.replaceSubrange((startIndex..<endIndex), with: "nihaoma")
// 按索引生成新的
let targetIndex = aString.index(startIndex, offsetBy: 3)
aString.replacingCharacters(in: (startIndex..<targetIndex) , with: "222")
// 直接更换
aString.replacingOccurrences(of: "ni", with: "wo")

(aString as NSString).replacingCharacters(in: NSMakeRange(0, 3), with: "eeee")
(aString as NSString).replacingOccurrences(of: "wo", with: "ta")



// 查
aString.hasPrefix("h")
aString.hasSuffix("1")
aString.characters
aString.characters.count


// 截取
aString.substring(to: aString.index(startIndex, offsetBy: 2))
aString.substring(from: aString.index(startIndex, offsetBy: 2))
aString.substring(with: (startIndex..<aString.endIndex))

(aString as NSString ).substring(to: 4)
(aString as NSString).substring(from: 4)
(aString as NSString).substring(with: NSMakeRange(0, 4))


// 可见,OC字符串部分功能更好用

// 遍历
for c in aString.characters {
    
    let index = aString.characters.index(of: c)
    index.debugDescription
    print( index ?? "错误")
}

for i in 0..<aString.characters.count {
    print(i)
    
}


// 分割
aString.components(separatedBy: ",")
aString.split(separator: Character(","))


/////////////////////////////////////////////////////////////////
// swift4
/////////////////////////////////////////////////////////////////
// 1.String变成集合类型了!!! Swift is collection of character
let swift4String = "Hello swift 4!"
_ = swift4String.count
swift4String.forEach {
    print($0)
}

let ch = Character("4")
let index = swift4String.index(of: ch)!
print(index)

// 2.换行字符串
let paragraph = """
<body>
    <a> 多行字符串</a>
</body>

"""

print(paragraph)


