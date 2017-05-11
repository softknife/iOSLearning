//: Playground - noun: a place where people can play

import Foundation


func associateObject<ValueType:Any>(_ base:Any,key:UnsafePointer<UInt8>, _ initialiser:()->ValueType) -> ValueType{

    if let associated = objc_getAssociatedObject(base, key) as? ValueType {
        return associated
    }
    
    let associated = initialiser()
    
    objc_setAssociatedObject(base, key, associated, .OBJC_ASSOCIATION_RETAIN)

    return associated
//    if  (ValueType.self as? AnyClass) != nil {
//        objc_setAssociatedObject(base, key, associated, .OBJC_ASSOCIATION_RETAIN)
//
//    }else {
//        objc_setAssociatedObject(base, key, associated, .OBJC_ASSOCIATION_ASSIGN)
//
//    }
    
}

func associateObject<ValueType:Any>(_ base:Any,key:UnsafePointer<UInt8>,value:ValueType) {
    
    objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
}

class Miller {}

class Cat {

    var name : String?
}

private var catKey : UInt8 = 0
extension Miller {
    var cat:Cat {
    
        get {
            return associateObject(self, key: &catKey)
            { return Cat() }
        }
        set {
            associateObject(self, key: &catKey, value: newValue)
        }
    }
}

let miller = Miller()
miller.cat.name
