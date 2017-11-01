//
//  18-Connectable+回放事件.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/31.
//

import Foundation
import RxSwift


/// 回放事件
func connectable_replayBasicUsage(_ desc:String) {
    
    example(of: desc) {
        
        // replay 两个事件,表示可以订阅一个历史事件和一个当前事件
//        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).replay(2)
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).replayAll()

        _ = interval.subscribe(onNext:{ print("Subscriber 1: Event - \($0) at \(stamp())" )})
        
        _ = interval.connect()
        
        print("START: \(stamp())")
        
        delay(2, closure: {
            _ = interval.subscribe(onNext:{ print("Subscriber 2: Event - \($0) at \(stamp())" )})

        })
        
        
        delay(4, closure: {
            _ = interval.subscribe(onNext:{ print("Subscriber 3: Event - \($0) at \(stamp())" )})

        })
        
        dispatchMain()

        /* replay(2) : 结果
         START: 14:05:32
         Subscribed:0
         Subscriber 1: Event - 0 at 14:05:33
         Subscribed:1
         Subscriber 1: Event - 1 at 14:05:34
         Subscriber 2: Event - 0 at 14:05:34
         Subscriber 2: Event - 1 at 14:05:34
         Subscribed:2
         Subscriber 1: Event - 2 at 14:05:35
         Subscriber 2: Event - 2 at 14:05:35
         Subscribed:3
         Subscriber 1: Event - 3 at 14:05:36
         Subscriber 2: Event - 3 at 14:05:36
         Subscriber 3: Event - 2 at 14:05:36
         Subscriber 3: Event - 3 at 14:05:36
         Subscribed:4

         
         replayAll() 的结果
         START: 14:08:49
         Subscribed:0
         Subscriber 1: Event - 0 at 14:08:50
         Subscribed:1
         Subscriber 1: Event - 1 at 14:08:51
         Subscriber 2: Event - 0 at 14:08:51
         Subscriber 2: Event - 1 at 14:08:51
         Subscribed:2
         Subscriber 1: Event - 2 at 14:08:52
         Subscriber 2: Event - 2 at 14:08:52
         Subscribed:3
         Subscriber 1: Event - 3 at 14:08:53
         Subscriber 2: Event - 3 at 14:08:53
         Subscriber 3: Event - 0 at 14:08:53
         Subscriber 3: Event - 1 at 14:08:53
         Subscriber 3: Event - 2 at 14:08:53
         Subscriber 3: Event - 3 at 14:08:53
         Subscribed:4

         
         */
        
    }
}



