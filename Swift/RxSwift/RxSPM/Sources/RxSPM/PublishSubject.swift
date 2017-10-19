//
//  PublishSubject.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation
import RxSwift

/**
 会员制订阅
 我们称即能接收事件,还能发送时间的Observable, 为Subject
 */
func publishSubjectBasicUsage(_ desc:String)  {
    
    print(desc)
    
    
    let subject = PublishSubject<String>()
    
    // 注意,这里应为实行的是会员制,所以,需要在发出事件之前,订阅!
    let observer1 = subject.subscribe(
        onNext:{print("Observer1 - what happened:\($0)")}
    )
    
    subject.onNext("Episode1 updated")
    observer1.dispose() // 解除订阅
    
    
    // 这里第二个订阅者进入
    let observer2 = subject.subscribe(
        onNext: {print("Observer2 - what happened:\($0)")}
    )
    
    subject.onNext("Episode2 updated")
    subject.onNext("Episode3 updated")
    
    observer2.dispose()
    
}
