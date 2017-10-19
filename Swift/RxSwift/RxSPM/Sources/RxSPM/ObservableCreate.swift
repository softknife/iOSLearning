//
//  CustomNotifyStrategy.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation

import RxSwift


enum CustomError:Error {
    case somethingError
}


/// 自定义通知单到订阅者的策略
func observableCreateUsage(_ desc:String) {
    print(desc)

    let customOb = Observable<Int>.create { (observer) -> Disposable in
        
        // 给订阅者发送事件通知
        observer.onNext(2)
        observer.onNext(3)
        
        // 错误发生时,通知订阅者
        observer.onError(CustomError.somethingError)
        
        // 完成时,通知订阅者 ,这个是跟error互斥的
        observer.onCompleted()
        
        return Disposables.create()
    }
    
    let bag = DisposeBag()
    
    customOb.debug().subscribe(
        onNext:{print($0)},
        onError: {print($0)},
        onCompleted:{print("Completed")},
        onDisposed: {print("Over")}
        ).disposed(by: bag)

    
}
