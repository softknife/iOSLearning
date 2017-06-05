//: Playground - noun: a place where people can play

import UIKit


class KPTest : NSObject{

    @objc var name = "王小二"
}


let test = KPTest()


let value = test.value(forKeyPath: #keyPath(KPTest.name))

test.setValue("ddddd", forKey: #keyPath(KPTest.name))

print(test.name)
