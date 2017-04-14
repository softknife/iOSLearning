//: [Previous](@previous)

import Foundation


/// 1.定义协议
protocol PersonProtocol {
    
    func study()
    func play()

}


/// 2.创建一个类,并遵守协议
class Student : NSObject,PersonProtocol {
    
    func play() {
        print("玩虾米")
    }

    func study() {
        print("学习语文")
    }
    
    
}