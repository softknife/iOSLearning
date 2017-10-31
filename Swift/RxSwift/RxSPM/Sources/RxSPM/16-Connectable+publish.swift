//
//  16-.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/31.
//

import Foundation
import RxSwift


/// 一个发布者,很多订阅者!
func connectable_publishBasicUsage(_ desc: String)  {
    
    
    /*
    example(of: desc) {
        
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        _ = interval.subscribe(onNext: {print("subscriber 1:\($0)")})
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            
            _ = interval.subscribe( onNext:{print("subscriber 2: \($0)")})
        })
        
        dispatchMain()
        
        /* 从如下结果,我们可以看出, 两个订阅者订阅的对象并不是同一个发布者!!
         subscriber 1:0
         subscriber 1:1
         subscriber 1:2
         subscriber 2: 0
         subscriber 1:3
         subscriber 2: 1
         */
        
    }
    
    */
    
    // 正确写法
    example(of: desc) {
        
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).publish()
        
        _ = interval.subscribe(onNext: {print("subscriber 1:\($0)")})
        
        _ = interval.connect()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            
            _ = interval.subscribe( onNext:{print("subscriber 2:\($0)")})
        })
        
        dispatchMain()
        
        /*

         subscriber 1:0

         subscriber 1:1

         subscriber 1:2
         subscriber 2:2

         subscriber 1:3
         subscriber 2:3

         */
        
    }

    
}
