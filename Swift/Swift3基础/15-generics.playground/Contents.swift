//: Playground - noun: a place where people can play

import UIKit

/**
 泛型嵌套（Nested Generics）
 Swift 3.1允许您将嵌套类型与泛型混合。
 运行内嵌类型中使用外围类型中的范型,同时内嵌类型中可以使用自己的范型
 -----
 - 我们以链表为例:
 */

class List<T> {
    
    class Node: CustomStringConvertible {
        var value: T // 此处,内嵌类型中使用外围类型中的 范型
        var next : Node?
        
        init(value:T,next:Node?) {
            
            self.value = value
        }
        
        
        var description: String {
            var nextText = "End"
            
            if let next = self.next {
                nextText = "\(next.value)"
            }
            
            return "[value: \(value) next: \(nextText)]"
            
        }
        
    }
    
    class Storage<U> { // 此处U仅仅是用来区分和外围类中的范型不同,实际也可以用T
        var head : U?
        var current : U?
    }
    
    
    var storage : Storage<Node> = Storage()
    var count = 0
    
    
    func push(_ element:T) -> List<T> {
        let node = Node(value: element, next: nil)
        
        if storage.head == nil {
            storage.head = node
        }
        
        if storage.current != nil {
            storage.current!.next = node
        }
        
        storage.current = node
        
        count += 1
        
        return self
    }
    
    
}

extension List: CustomStringConvertible {
    var description: String {
    
        var desc = ""
        var pos = storage.head
        
        while pos != nil {
            desc += (pos!.description + "\n")
            
            pos = pos!.next
        }
        
        return desc
    }
}

var l = List<Int>()


l.push(2).push(3).push(5).push(8)


print(l)

		