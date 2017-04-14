//
//  ViewController.swift
//  1-异常处理
//
//  Created by 黄继平 on 2016/11/19.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 思考:什么情况下需要考虑异常处理?
        // 当某个函数最后有一个throws时,说明调用该函数时,可能会抛出异常,那么就需要我们做异常处理!
        
        // 以正则匹配为例
        /*
            1.处理方式一:do try catch 这样可以手动捕获到异常的具体信息
            captureError1()
            
            2.处理方式二:try? 系统帮我们过滤异常,我们得不到异常具体原因,通常用于不关心具体错误原因的情境下
            captureError2()

            3.处理方式三:try! 我们自己认为一定没有异常!一旦发生异常,直接crash
            captureError3()

         */
        
        
    }

    
    private func captureError1(){
        
        do {
            let regex = try NSRegularExpression(pattern: "", options: []) // 注意,swift中如果需要传入某个枚举类型,而我们想传入默认值,那么使用[]即可
            print(regex)
            
            // ......
            
        } catch { // 捕获到异常
            print(error.localizedDescription)
            
        }
 
    }
    
    private func captureError2(){
        
        if let regex = try? NSRegularExpression(pattern: "", options: []) {
            
            // 如果没有发生异常,那么就走到这里来,如果发生异常,就不进入这里!
            print(regex)
            
        }
        // 或者💕推荐使用
        guard let regex = try? NSRegularExpression(pattern:"",options:[]) else {
            //print(error) 这样没有默认错误信息
            
            return
        }
        
        print(regex)
    }

    func captureError3()  {
        let regex = try! NSRegularExpression(pattern: "", options: [])

    }
}

