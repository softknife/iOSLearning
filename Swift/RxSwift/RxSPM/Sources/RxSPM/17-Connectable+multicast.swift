//
//  17-Connectable+multicast.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/31.
//

import Foundation
import RxSwift

func connectable_multicastBasicUsage(_ desc:String) {
    
    example(of: desc) {
        
        
        let supervisor = PublishSubject<Int>()
        _ = supervisor.subscribe(onNext:{print("supervisor :\($0)")})
        
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).multicast(supervisor)
        
        _ = interval.subscribe(onNext: {print("subscriber 1:\($0)")})
        
        _ = interval.connect()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
            
            _ = interval.subscribe( onNext:{print("subscriber 2:\($0)")})
        })
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            
            _ = interval.subscribe( onNext:{print("subscriber 3:\($0)")})
        })

        
        dispatchMain()
        
        /** 超级管理员从一开始就存在 

         supervisor :0
         subscriber 1:0

         supervisor :1
         subscriber 1:1
         subscriber 2:1

         supervisor :2
         subscriber 1:2
         subscriber 2:2
         subscriber 3:2

         supervisor :3
         subscriber 1:3
         subscriber 2:3
         subscriber 3:3

         */
        
    }
    
}
