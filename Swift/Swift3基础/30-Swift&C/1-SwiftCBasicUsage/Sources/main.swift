

/// 1.常量
print(global_ten)



/// 2.枚举
// 当我们在swift中使用NS_STRING_ENUM修饰的变量时,将会将共同前缀的一组变量转换为如下形式:
/*
struct TrafficColor : RawRepresentable {

    typealias RawValue = String
    init?(rawValue: Self.RawValue) {

    }

    var rawValue: RawValue {get}
    static var red : TrafficColor {get}
    static var green:TrafficColor{get}
    static var yellow:TrafficColor{get}

}
*/

let color = TrafficColor.green

switch color{
case .green:
    print("绿色\(color.rawValue)")
case .red:
    print("红色\(color.rawValue)")
case .yellow:
    print("黄色\(color.rawValue)")
    
default:
    print("Other color")
}



// 我们可以直接对Shape进行扩展
extension Shape{
    static var ellipse : Shape {
        return Shape(4)
    }
}

// 当然,我们也可以对使用NS_STRING_ENUM修饰的枚举进行扩展,只是和NS_EXTENSIBLE_STRING_ENUM语义上略有差别
extension TrafficColor{
    static var blue : TrafficColor{
        return TrafficColor(rawValue:"Blue")
    }
}



/// 3.函数
// 函数调用
let one = 1
_ = add(CInt(one), 2)

//_ = vsum(<#T##count: Int32##Int32#>, <#T##numbers: CVaListPointer##CVaListPointer#>)
_ = vsum(3, getVaList([1,3,4]))
// 或者
_ = withVaList([1,2,3]) {
    vsum(3, $0)
}
// 遗憾的是sum无法直接桥接过来




/// 4.结构体 
let loc1 = Location() // 默认x, y = 0
let _ = Location(x: 1, y: 1)
loc1.moveX(delta: 1.5) // 可见此时转换的方法是mutating的!!
//loc1.x = 10

var origin = Location(xy: 1)
Location.origin.x = 10




/// 5.union
let ascii = ASCII(character:CChar(11))
print(ascii.character)
let ascii2 = ASCII(code: 1233333333)
print(ascii2.character) // 这样就是错误的, 这样只能取8位!!!
print(ascii2.code) // 这样就是错误的, 这样只能取8位!!!
/* 打印结果
 11
 85
 1233333333
 */


//let car = Car(<#T##__Anonymous_field0: Car.__Unnamed_union___Anonymous_field0##Car.__Unnamed_union___Anonymous_field0#>, info: <#T##Car.__Unnamed_struct_info#>)
// xcode提示,我们可以看出union类型的字段为匿名字段!
let bmw = Car(.init(series:10),info:.init(price:10000,isAvailable:true))
print("复杂union\(bmw.series)")
print("复杂union\(bmw.model)")




/// 6.C中默认的枚举
// C中原生的枚举,反映到Swift并不友好
let red = Red
let yellow = Yellow
// OC方式的枚举
let orange : ColorOC = .orange
print(orange.rawValue)






