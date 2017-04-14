//: [Previous](@previous)

import Foundation

/// 1.枚举的定义与创建
// 枚举定义
enum Direction{
    case east
    case south
    case west
    case north
}

// 创建枚举类型变量/常量
let direction = Direction.east

var direction1 : Direction = .west
direction1 = .north

/// 2.指定枚举值的具体类型
enum Season : String{

    case spring = "春"
    case summer = "夏"
    case fall   = "autumn"
    case winter = "冬"
    
}

enum Planet : Int {
    
    case mars = 0, earth, mercury,venus
    
}

var season = Season.spring
if let season = Season(rawValue: "春"){
    print(season)
}

var planet = Planet(rawValue: 1)!


/// 3.枚举中的函数
extension Planet {
   
    func description() -> String {
        switch self {
        case .earth:
            return "地球"
        case .mars:
            return "火星"
        case .mercury:
            return "水星"
            
        default:
            return String(self.rawValue)
        }
    }
}

planet.description()


/// 4.枚举高级用法
enum Result {

    case success(Any)
    case failure(Int8,String)
}

class TestEnum {
    
    func test() -> Result {
        
        let result = arc4random() % 2
        
        if result == 0 {
        
            return .success(true)
        }else {
        
            return .failure(-1,"失败")
        
        }
        
    }
    
    func testEnum() -> Void {
        
        let result = test()
        
        switch result {
        case .success(let result):
            print(result)
        case let .failure( errorCode , errorDescription): // 注意,此处接受变量时,可以直接在前面写let
        
            print(errorCode,errorDescription)
        }
    }
}

