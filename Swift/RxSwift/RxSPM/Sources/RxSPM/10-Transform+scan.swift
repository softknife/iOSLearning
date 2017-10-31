//
//  Transform+scan.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/29.
//

import Foundation
import RxSwift

/// 这个转换操作,类似高阶函数reduce
func scanOperateBasicUsage(_ desc: String) {
    
    print(desc)
    
    let bag = DisposeBag()
    
    //
    Observable.of(1,2,3)
        .scan(0){ sum , value in
            sum + value
        }
        .subscribe(onNext:{
            dump(type(of:$0))
            dump($0)
        }).disposed(by: bag)
    
    /*
     - Swift.Int #0
     - 1
     - Swift.Int #0
     - 3
     - Swift.Int #0
     - 6
     */
    
    let numbers = PublishSubject<Int>()
    
    numbers.asObserver()
        .scan(0, accumulator: +)
        .subscribe({ sum in
            dump(sum)
        }).disposed(by: bag)
    
    numbers.onNext(4)
    numbers.onNext(5)
    numbers.onNext(6)
    /*
     ▿ next(4)
     - next: 4
     ▿ next(9)
     - next: 9
     ▿ next(15)
     - next: 15
     */
    
}
