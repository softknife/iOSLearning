//
//  19-Buffer事件范围.swift
//  RxSPM
//
//  Created by Apple on 2017/11/1.
//

import Foundation
import RxSwift


/// 为了回放特定时间段内,特定事件个数:
/// 将某个时间段内的 所有事件发送给订阅者 window
/// 使用buffer ,限定事件个数 和 时间
func constaintEventsCountInTimeSpan(_ desc:String) {
    
    /*
    example(of: desc) {
        
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).buffer(timeSpan: 4, count: 2, scheduler: MainScheduler.instance)
        
        print("START - " + stamp())
        
        _ = interval.subscribe(onNext:{
            print("Subscriber 1 : Event - \($0)" + stamp())
        })
        
        dispatchMain()
    }
    */
    
    /* 可见4秒内, 如果发生了限制次数(2次), 那么不会等到4秒就会触发
     START - 18:37:49
     Subscribed:0
     Subscribed:1
     Subscriber 1 : Event - [0, 1]18:37:51
     Subscribed:2
     Subscribed:3
     Subscriber 1 : Event - [2, 3]18:37:53
     Subscribed:4
     */
    
    
    example(of: "window的使用: 给定时间内,window中发生的事件") {
        
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance).window(timeSpan: 4, count: 4, scheduler: MainScheduler.instance)
        
        print("START - " + stamp())
        
        _ = interval.subscribe(onNext:{ (subObservable : Observable<Int>) in
            
            print("=====window open====")
            
           _ =  subObservable.subscribe(onNext:{ (value:Int) in
                print("Subscriber 1 : Event - \(value)" + stamp())

            },onCompleted:{
                print("=====window closed====")

            })
            

        })
        
        dispatchMain()

        /* 可见第一个window生命周期内, 发生三次事件, 后面是4次
         START - 18:44:29
         =====window open====
         Subscribed:0
         Subscriber 1 : Event - 018:44:30
         Subscribed:1
         Subscriber 1 : Event - 118:44:31
         Subscribed:2
         Subscriber 1 : Event - 218:44:32
         Subscribed:3
         =====window closed====
         =====window open====
         Subscriber 1 : Event - 318:44:33
         Subscribed:4
         The queue was disposed.
         Subscriber 1 : Event - 418:44:34
         Subscriber 1 : Event - 518:44:35
         Subscriber 1 : Event - 618:44:36
         =====window closed====
         =====window open====
         Subscriber 1 : Event - 718:44:37
         Subscriber 1 : Event - 818:44:38
         Subscriber 1 : Event - 918:44:39
         Subscriber 1 : Event - 1018:44:40
         =====window closed====
         =====window open====
         Subscriber 1 : Event - 1118:44:41
         Subscriber 1 : Event - 1218:44:42
         Subscriber 1 : Event - 1318:44:43
         Subscriber 1 : Event - 1418:44:44
         =====window closed====
         */
    }
    
}

