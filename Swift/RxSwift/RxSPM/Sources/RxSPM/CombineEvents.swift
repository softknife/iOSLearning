//
//  CombineEvents.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/29.
//

import Foundation
import RxSwift


/// 合并最近的事件
func combineEventsBasicUsage(_ desc : String) {
    
    print(desc)
    
    let bag = DisposeBag()
    
    let queueA = PublishSubject<String>()
    let queueB = PublishSubject<String>()
    
    // 这种合并方式, queueA和queueB可以使不同类型的事件源
//    Observable.combineLatest(queueA,queueB){
//        e1 , e2 in
//        e1 + e2
//        }.subscribe(onNext:{
//            dump($0)
//        }).disposed(by: bag)
//
//    queueA.onNext("A1")
//    queueB.onNext("B1")
//    queueA.onNext("A2")
//    queueB.onNext("B2")
    
    /* 注意,合并的事件只能是latest
     - "A1B1"
     - "A2B1"
     - "A2B2"
     
     -----A1-----A2-----
             \  /  \
     --------B1-----B2----
     
     */
    
    
    // 如果我们使用集合的方式,那么事件源必须类型一致!!
    Observable.combineLatest([queueA,queueB]){
        events in
        events.joined(separator: ",")
        }.subscribe(onNext:{
            dump($0)
        }).disposed(by: bag)
    
    queueA.onNext("A1")
    queueB.onNext("B1")
    queueA.onNext("A2")
    queueB.onNext("B2")
    queueA.onCompleted()
    queueB.onNext("B3")
    queueB.onNext("B4")
    /* 我们可以注意到, 虽然queueA前结束了,但是queueB还是会和queueA的最后一个事件进行合并!
     - "A1,B1"
     - "A2,B1"
     - "A2,B2"
     - "A2,B3"
     - "A2,B4"
     */
    
    
    
    // zip: 和combineLatest不同的是,他只会将每个事件合并一次,一旦一个事件源结束了,那么整个就结束了.
    /*
     -----C1-----C2-----
             \    \
     --------D1-----D2----
     */
    let queueC = PublishSubject<String>()
    let queueD = PublishSubject<Int>()
    Observable.zip(queueC,queueD){
        e1 , e2 in
        e1 + "," + String(e2)
        }.subscribe(onNext:{
            dump($0)
        }).disposed(by: bag)

    queueC.onNext("C1")
    queueD.onNext(1)
    queueC.onNext("C2")
    queueD.onNext(2)
    
    /*
     - "C1,1"
     - "C2,2"
     */

}
