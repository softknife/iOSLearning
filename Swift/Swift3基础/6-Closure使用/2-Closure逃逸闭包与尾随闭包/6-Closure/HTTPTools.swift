//
//  HTTPTools.swift
//  6-Closure
//
//  Created by 黄继平 on 2016/11/17.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class HTTPTools: NSObject {

    
    // 闭包作为参数, 闭包类型:有参数String,无返回值Void
    // @convention(block) 可以自动生成尾随闭包❤️
    // () 等价于 Void 等价于 Swift.Void
    
    // swift3.0后,默认闭包是非逃逸,这样效率更高,同时不保持self,如果闭包在异步中执行,需要收到加上逃逸
    // 注意@escaping不能修饰可选类型的Closure!💖
    
    func loadData( _ executeTask : @escaping @convention(block) (_ jsonData : String?) -> Swift.Void) {
        
        // 1.发起异步请求,调用DispatchQueue的global方法,创建queue,调用async方法,异步执行任务
        DispatchQueue.global().async {
            
            print("请求数据,当前线程:\(Thread.current)")
            
            // 2.使用只读属性main获取主线程,异步执行返回值
            DispatchQueue.main.async {
                
                // 3.数据回调
                executeTask("图片一张")

            }

        }
    }
}
