//
//  Transform+map.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/29.
//

import Foundation
import RxSwift

/// 这个转换操作,更加强大的操作map
func mapOperateBasicUsage(_ desc: String) {
    
    print(desc)
    
    let bag = DisposeBag()
    
    //
    Observable.of(1,2,3)
        .map{ value in
            value * 2
        }
        .subscribe(onNext:{
            dump(type(of:$0))
            dump($0)
        }).disposed(by: bag)
    
    /*
     - Swift.Int #0
     - 2
     - Swift.Int #0
     - 4
     - Swift.Int #0
     - 6
     */
    
    let numbers = PublishSubject<Int>()
    
   let mapOb = numbers.asObservable().enumerated().map{ index,value in
            index < 1 ? value * 2 : value
        }
    mapOb.subscribe(onNext:{ sum in dump(sum) })
        .disposed(by: bag)
    
    numbers.onNext(4)
    numbers.onNext(5)
    numbers.onNext(6)
    /*
     ▿ next(8)
     - next: 8
     ▿ next(5)
     - next: 5
     ▿ next(6)
     - next: 6
     */
    
}
