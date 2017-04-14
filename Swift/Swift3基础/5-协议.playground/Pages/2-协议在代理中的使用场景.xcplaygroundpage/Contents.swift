//: Playground - noun: a place where people can play

import UIKit

// 创建代理协议
protocol BabyNancyProtocol {
    func feedFood(someOne :Any)
    func accompany(someOne :Any)
}


// 需要代理的对象
class Baby {

    /** 名字*/
    var name = ""
    var delegate : BabyNancyProtocol?
    
    fileprivate func eat(food:String?) {
    
        print("eat \(food)")
    }
    
    fileprivate func play(){
    
        print("玩")
    }
    
    
    func hungry1()  {
        delegate?.feedFood(someOne: self)
    }
    
    func hungry2() {
        delegate?.accompany(someOne: self)
    }
}

// 作为代理的对象
class Babysitter : BabyNancyProtocol {

    func feedFood(someOne: Any) {
        
        let baby = (someOne as? Baby)
        baby?.eat(food: nil)
    
    }
    
    func accompany(someOne: Any) {
        
        // 这样不安全
        (someOne as! Baby).play()
        
    }
}

// 创建对象
let baby = Baby()
let babysitter = Babysitter()
baby.delegate = babysitter


// 执行方法
baby.hungry1()
baby.hungry2()







