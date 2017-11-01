//
//  toArray.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/29.
//

import Foundation
import RxSwift


/// toArray会将observable中的 事件一次性放入一个array 中
/// 同时,只接收订阅之前已经存在的事件
func toArrayOperateBasicUsage(_ desc: String) {
    
    print(desc)
    
    let bag = DisposeBag()
    
    // toArray
    Observable.of(1,2,3)
        .toArray()
        .subscribe(onNext:{
            dump(type(of:$0))
            dump($0)
        }).disposed(by: bag)
    
    /*
     - Swift.Array<Swift.Int> #0
     ▿ 3 elements
     - 1
     - 2
     - 3
     */
    
    let numbers = PublishSubject<Int>()
    
    numbers.asObserver()
        .toArray()
        .subscribe(onNext:{
            
            dump(type(of:$0))
            dump($0)

        }).disposed(by: bag)
    
    numbers.onNext(4)
    numbers.onNext(5)
    numbers.onNext(6)
}
