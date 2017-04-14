//
//  HTTPTools.swift
//  6-Closure
//
//  Created by 黄继平 on 2016/11/17.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class HTTPTools: NSObject {

    /*
     在Swift 3.0 [ SE-0103 ] 中函数中的闭包的参数是默认是不逃逸的（non-escaping）。在Swift 3.1中，您可以使用新的函数 withoutActuallyEscaping() 将非逃逸闭包转换为临时逃逸。
     */
    // 闭包作为参数, 闭包类型:有参数String,无返回值Void
    func loadData( _ executeTask : (_ jsonData : String?)->() ) {
        
        // 3.数据回调
        // DispatchQueue.global().async(execute: executeTask) // executeTask是noescaping 包,不可以使用GCD异步函数调用! 如果想使用,必须做如下处理,临时逃逸
        
        let queue = DispatchQueue.global()
        
        withoutActuallyEscaping(executeTask) { escapableT in
            
            
            queue.async {
                print("异步")
                escapableT(nil)
            }
            
            queue.sync(flags: .barrier){}
        }
        
        /**
         此函数同时加载两个闭包，然后在两个完成之后返回。
         
         executeTask 进入函数后由非逃逸状态，转换为逃逸闭包: escapableT
         async(execute:) 的调用需要逃逸闭包，我们在上面已经进行了转换。
         通过运行 sync(flags: .barrier) ，您确保 async(execute:) 方法完全完成，稍后将不会调用闭包。
         在范围内使用 escapableF .
         如果你存储临时逃离闭包(即真正逃脱)这将是一个Bug。未来版本的标准库可以检测这个陷阱,如果你试图调用它们。
         */
    }
}
