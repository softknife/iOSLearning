//
//  HTTPTools.swift
//  6-Closure
//
//  Created by 黄继平 on 2016/11/17.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class HTTPTools: NSObject {

    // ()->Void
    
    // 闭包作为参数, 闭包类型:有参数String,无返回值Void
    func loadData( _ executeTask : ((_ jsonData : String?)->())?) {
        
        // 1.发起异步请求,调用DispatchQueue的global方法,创建queue,调用async方法,异步执行任务
        DispatchQueue.global().async {
            
            print("请求数据,当前线程:\(Thread.current)")
            
            // 2.使用只读属性main获取主线程,异步执行返回值
            DispatchQueue.main.async {
                
                
                // 3.数据回调
                if let task = executeTask {
                    task("图片一张")
                    
                }
            }

        }
    }
}
