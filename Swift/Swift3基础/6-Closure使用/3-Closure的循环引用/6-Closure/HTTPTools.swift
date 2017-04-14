//
//  HTTPTools.swift
//  6-Closure
//
//  Created by 黄继平 on 2016/11/17.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class HTTPTools: NSObject {

    // 为了测试死循环,我们这里强引用一下closure
    // 类初始化时,必须所有属性都得给一个初始值!!💕
    /** 闭包*/
    var work : ((String?) -> Void)?
    
    
    func loadData( _ executeTask : @escaping @convention(block) (_ jsonData : String?) -> Swift.Void) {
        
        work = executeTask

        DispatchQueue.global().async {
            
            print("请求数据,当前线程:\(Thread.current)")
            

            DispatchQueue.main.async {
                
                executeTask("图片一张")

            }

        }
    }
}
