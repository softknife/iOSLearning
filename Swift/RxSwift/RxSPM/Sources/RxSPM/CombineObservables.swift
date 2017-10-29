//
//  MultiObservable.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/29.
//

import Foundation
import RxSwift



enum Condition: String{
    case cellular = "Cellular"
    case wifi = "wifi"
    case none = "none"
}

/// 合并多个observables
/// 需要要求被合并的observable类型必须相同
func combineObservablesBasicUsage(_ desc:String) {
    
    print(desc)
    
    let bag = DisposeBag()
    let request = Observable<String>.create {
        $0.onNext("Response from the server.")
        $0.onCompleted()
        
        return Disposables.create()
    }
    
    request.startWith(Condition.wifi.rawValue)
        .subscribe(onNext:{
            print($0)
        }).disposed(by: bag)
    
    /* 将两种事件源合并到一起
     wifi
     Response from the server.
     */
    
    
    
    /// 我们还可以将两个Observable合并-串行合并
    //serialObservables()
    
    /// 并行合并-merge
    mergeObservables()
}


private func serialObservables(){
    
    let bag = DisposeBag()

    let queueA = PublishSubject<String>()
    let queueB = PublishSubject<String>()
    
    // concat : 表示一个事件源执行完之后, 两一个才执行
    let concat = Observable.concat([queueA.asObservable(),queueB.asObservable()])
    concat.subscribe( onNext: { event in dump(event)},
                      onCompleted:{print("completed")},
                      onDisposed:{print("Disposed")})
        .disposed(by:bag)
    
    
    queueA.onNext("A1")
    queueA.onNext("A2")
    queueA.onCompleted()
    queueB.onNext("B1")
    queueB.onCompleted()
    
    /* 由于concat是queueA和queueB的组合, 所有只有当二者都结束时,concat才会comleted
     - "A1"
     - "A2"
     - "B1"
     completed
     */
    // 当然,我们也可以通过queueA来合并queueB
    // let combine = queueA.concat(queueB)
    

}

private func mergeObservables(){
    
    let bag = DisposeBag()
    let queueA = PublishSubject<String>()
    let queueB = PublishSubject<String>()
    
//    let concurent = Observable.merge([queueA.asObservable(),queueB.asObservable()])
//    concurent.subscribe( onNext: { event in dump(event)},
//                         onCompleted:{print("completed")},
//                         onDisposed:{print("Disposed")})
//        .disposed(by:bag)
//
//
//    queueA.onNext("A1")
//    queueA.onNext("A2")
//    queueB.onNext("B1")
//    queueA.onCompleted()
//    queueB.onCompleted()

    /* 结果中,我们可以看到使用merge时,即使queueA没有complete,queueB依然执行了!
     - "A1"
     - "A2"
     - "B1"
     completed
     Disposed
     */
    
    
    
    // 如果我们指定 merge的最大并发度为1,那么依然可以起到concat的效果
    let concurent = Observable.of(queueA.asObservable(),queueB.asObservable()).merge(maxConcurrent:1)
    concurent.subscribe( onNext: { event in dump(event)},
                         onCompleted:{print("completed")},
                         onDisposed:{print("Disposed")})
        .disposed(by:bag)


    queueA.onNext("A1")
    queueA.onNext("A2")
    queueB.onNext("B1")
    queueA.onCompleted()
    queueB.onCompleted()

    /*
     - "A1"
     - "A2"
     completed
     Disposed
     */
}

