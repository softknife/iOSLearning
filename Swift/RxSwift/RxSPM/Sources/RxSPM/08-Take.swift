//
//  Take.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation
import  RxSwift

/*
 获取序列中的特定事件
 */
func takeOperaterBasicUsage(_ desc:String){
    print(desc)
    
    let task = PublishSubject<String>()
    let bag = DisposeBag()
    
    // 1.elementAt 某个位置的事件获取
    // task.elementAt(1).subscribe { print($0)}.disposed(by: bag)
    /*
     next(T2)
     completed
     */
    
    // 2.take 取前几个
    // task.take(2).subscribe { print($0)}.disposed(by: bag)
    /*
     next(T1)
     next(T2)
     completed
     */
    
    // 3.takeLast 取后几个
    //task.takeLast(2).subscribe { print($0)}.disposed(by: bag)
    /*
     next(T3)
     next(T4)
     completed
     */
    
    // 4.过滤 takeWhile 不等于某个事件的前面所有事件
    //task.takeWhile{ $0 != "T3"}.subscribe { print($0)}.disposed(by: bag)
    /*
     next(T1)
     next(T2)
     completed
     */
    
    // 5.filter 过滤得到某个具体事件
    //task.filter{ $0 == "T2" }.subscribe { print($0)}.disposed(by: bag)
    /*
     next(T2)
     completed
     */
    
    // 6.takeUntil 一直获取事件,直到另一个observable触发
    let bossIsGone = PublishSubject<Void>()
    task.takeUntil(bossIsGone).subscribe { print($0)}.disposed(by: bag)
    /*
     next(T1)
     next(T2)
     completed
     */
    
    
    task.onNext("T1")
    task.onNext("T2")
    bossIsGone.onNext(())
    task.onNext("T3")
    task.onNext("T3")
    task.onNext("T4")
    task.onCompleted()
    
    
}
