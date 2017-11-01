//
//  Skip.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation
import RxSwift

/*
 忽略序列中的特定事件
 */
func skipOperaterBasicUsage(_ desc:String)  {
    print(desc)
    
    let task = PublishSubject<String>()
    let bag = DisposeBag()
    
    
    //  task.subscribe{print($0)}.disposed(by: bag)
    
    //1. skip 忽略前几个
    //task.skip(2).subscribe{print($0)}.disposed(by: bag)
    /*
     next(T3)
     next(T3)
     next(T4)
     completed
     */
    
    // 2.ignoreElements 忽略所有的事件, 只保留complete
    //task.ignoreElements().subscribe{print($0)}.disposed(by: bag)
    /*
     completed
     */
    
    // 3.skipWhile{} 条件忽略 表示忽略T3事件发生之前的所有其他事件
    // task.skipWhile{ $0 != "T3" }.subscribe{ print($0) }.disposed(by: bag)
    /*
     next(T3)
     next(T3)
     next(T4)
     completed
     */
    
    
    
    // 4.distinctUtilChange() 去重忽略
    // task.distinctUntilChanged().subscribe{print($0)}.disposed(by: bag)
    
    /*
     next(T1)
     next(T2)
     next(T3)
     next(T4)
     completed
     */
    
    // 5.skipUntil 由另外一个observable触发
    let bossIsAngry = PublishSubject<Void>()
    task.skipUntil(bossIsAngry).subscribe{print($0)}.disposed(by: bag)
    /*
     next(T4)
     completed
     */
    
    
    task.onNext("T1")
    task.onNext("T2")
    task.onNext("T3")
    task.onNext("T3")
    
    bossIsAngry.onNext(())
    task.onNext("T4")
    task.onCompleted()
    
}
