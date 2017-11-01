//
//  ReplaySubject.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation
import RxSwift


/**
 试用制-控制发送给订阅者历史事件的范围
 */
func replaySubjectBasicUsage(_ desc:String) {
    
    print(desc)
    
    // 此处bufferSize 表示历史范围为2
    let subject = ReplaySubject<String>.create(bufferSize: 2)
    
    let observer1 = subject.subscribe(
        onNext:{print("Observer1 - what happened:\($0)")}
    )
    
    subject.onNext("Episode1 updated")
    subject.onNext("Episode2 updated")
    subject.onNext("Episode3 updated")
    observer1.dispose()
    
    
    let observer2 = subject.subscribe(
        onNext: {print("Observer2 - what happened:\($0)")}
    )
    
    
    observer2.dispose()
    
    /* 结果,我们可以看到,observer2接收到的历史事件有两个!
     Observer1 - what happened:Episode1 updated
     Observer1 - what happened:Episode2 updated
     Observer1 - what happened:Episode3 updated
     Observer2 - what happened:Episode2 updated
     Observer2 - what happened:Episode3 updated
     
     */

}
