//
//  BehaviorSubject.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation
import RxSwift

/**
 试用制订阅
 会将最近一次历史事件发送给订阅者
 */
func behiviorSubjectBasicUsage(_ desc:String) {
    
    print(desc)

    // 此处,value表示第一个事件将要发送了,提前发送的一个事件
    let subject = BehaviorSubject<String>(value: "事件将要发生预警!!")
    
    let observer1 = subject.subscribe(
        onNext:{print("Observer1 - what happened:\($0)")}
    )
    
    subject.onNext("Episode1 updated")
    observer1.dispose() // 结果,我们可以看到 observer1接收到两个事件
    
    
    let observer2 = subject.subscribe(
        onNext: {print("Observer2 - what happened:\($0)")}
    )
    
    subject.onNext("Episode2 updated")
    subject.onNext("Episode3 updated")
    
    observer2.dispose() // observer2接收到三个事件
    
    
    /*
     Observer1 - what happened:事件将要发生预警!!
     Observer1 - what happened:Episode1 updated
     Observer2 - what happened:Episode1 updated
     Observer2 - what happened:Episode2 updated
     Observer2 - what happened:Episode3 updated
     */
    

}
