//: Playground - noun: a place where people can play

import UIKit

enum Sex{
    case male
    case female
}
class Person{
    let sex:Sex
    var money:CGFloat
    init(sex:Sex ,money:CGFloat) {
        self.sex = sex
        self.money = money
    }
}


enum MarryError : Error{
    case lackMoney
    case wrongSex
}

extension Person{
    func marry(with another: Person) throws -> Bool{
        guard self.sex != another.sex else{
            throw MarryError.wrongSex
        }
        guard self.money + another.money > 100000 else {
            throw MarryError.lackMoney
        }
        return true
    }
}

let tom = Person(sex: .male, money: 100000)
let jack = Person(sex: .male, money: 100000)

/*
 如果我们清楚有哪些异常,可以具体捕获
 */
do{
    try tom.marry(with: jack)
}catch MarryError.wrongSex {
    print("Two Person have same sex")
}catch MarryError.lackMoney{
    print("Oh, they do not have enough moeny")
}catch let error{
    print(error)
}
/*
 当然，如果不需要区分每一个Error，也可以这么调用。
 */
do{
    try tom.marry(with: jack)
}catch let error{
    print(error)
}