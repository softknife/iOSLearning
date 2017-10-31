//
//  Transform+flatMap.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/29.
//

import Foundation
import RxSwift


struct Player {
    let score:Variable<Int>
}

/// 将监听序列中的事件转换为另一个可触发的序列
/// 对于
func flatMapOperateBasicUsage(_ desc:String){
    
    print(desc)
    
    let bag = DisposeBag()
    
    // transform the items emitted by an Observable into Observables
    let john = Player(score: Variable(70))
    let jole = Player(score: Variable(90))
    
    let players = PublishSubject<Player>()
//    players.asObservable()
//        .flatMap {$0.score.asObservable()}
//        .subscribe(onNext:{
//            dump($0)
//        }).disposed(by: bag)
//
//    players.onNext(john)
//    john.score.value = 80
//    players.onNext(jole)
//    john.score.value = 100
    
    /* 结果可见,player中的 两个时间 john & jole 转换的两个序列合二为一了!!! 这个过程叫做flatten
     - 70
     - 80
     - 90
     - 100
     */
    
    players.asObservable()
        .flatMapLatest {$0.score.asObservable()}
        .subscribe(onNext:{
            dump($0)
        }).disposed(by: bag)
    
    players.onNext(john)
    john.score.value = 80
    players.onNext(jole)
    john.score.value = 100
    /* 如果我们使用flatMapLatest这个operate,那么只会监听最新事件!
     转化操作flatMap的使用
     - 70
     - 80
     - 90
     */
}
