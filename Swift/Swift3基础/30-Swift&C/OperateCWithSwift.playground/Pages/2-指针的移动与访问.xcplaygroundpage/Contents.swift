//: [Previous](@previous)

import UIKit

extension UnsafeMutablePointer where Pointee : CustomStringConvertible{
    
    func dump(count:Int )  {
        
        var info = ""
        
        for i  in 0..<count {
            info += self[i].description + " "
        }
        
        print(info)
    }
    
}


// 1.申请内存空间
var intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 10) // Uninitialized
// 2.初始化变量
intPtr.initialize(to: 0, count: 10)



var head = intPtr // 复制指针

head.dump(count: 10)

// 使用intPtr修改内存
for i in 0...9 {
    
    // 指针操作1.
        //    intPtr[i] = i
    // 指针操作方式2
        //    (intPtr + i).pointee = i + 1
    // 指针操作方式3
    intPtr += 1 // 右移
    intPtr.predecessor().pointee = i // 左移
    //    intPtr.successor() // 右移
    
}



head.dump(count: 10)

// 3.析构
intPtr.deinitialize()
// 4.释放内存
intPtr.deallocate(capacity: 10)

/*
 内存操作示意图,参考resouces中图片
 */



//: [Next](@next)
