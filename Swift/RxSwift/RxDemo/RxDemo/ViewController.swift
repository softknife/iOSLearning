//
//  ViewController.swift
//  RxDemo
//
//  Created by 黄继平 on 2017/10/14.
//  Copyright © 2017年 EApple. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        leaningRx1()
//        leaningRx2()
//        learningRx3()
//        leaningRx4()
//        learningRx5()
        learningRx6()
    }



}

// MARK:- 直接传入序列,并对其进行操作,Rx内部自动通知到订阅者
extension ViewController {
    
    func leaningRx1()  {
        
        
        _ =  Observable.of("1","2","3","4","5","6","7","8","9")
        
        let evenNumberObservable = Observable.from(["1","2","3","4","5","6","7","8","9"]).map {Int($0)}.filter {
            if let item = $0 , item % 2 == 0 {
                print("even : \(item)")
                return true
            }
            
            return false
        }
        // 注意这里的map和filter操作 与 对一般序列的map/filter操作不同, 一般的map/filter会立刻执行,这里的是回调,当我们对evenNumberObservable订阅时,才会执行,属于Rx中的cold操作
        
        _ = evenNumberObservable.skip(2).subscribe( // 这里skip表示跳过前两个数
            onNext: {even in print("interesting Event number:\(even)")},
            onError: {print($0)},
            onCompleted: {print("completed")},
            onDisposed:{}
            
        )
        /*
         even : 2
         even : 4
         even : 6
         interesting Event number:Optional(6)
         even : 8
         interesting Event number:Optional(8)
         completed
         */
        
        // 使用bag回收销毁Observable
        var bag = DisposeBag()
        Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(
            onNext:{print("Subscribed:\($0)")},
            onDisposed:{print("The queue was disposed.")}
            ).disposed(by: bag)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            bag = DisposeBag()
        }
        /*
         Subscribed:0
         Subscribed:1
         Subscribed:2
         Subscribed:3
         Subscribed:4
         The queue was disposed.
         */

    }
}


// MARK:- 自定义通知单到订阅者的策略
extension ViewController{
    
    enum CustomError:Error {
        case somethingError
    }
    
    func leaningRx2()  {
        
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
}


// MARK:- 会员制订阅
// 我们称即能接收事件,还能发送时间的Observable, 为Subject
extension ViewController{
    
    func learningRx3() {
        
        let subject = PublishSubject<String>()
        
        // 注意,这里应为实行的是会员制,所以,需要在发出事件之前,订阅!
        let observer1 = subject.subscribe(
            onNext:{print("Observer1 - what happened:\($0)")}
        )
        
        subject.onNext("Episode1 updated")
        observer1.dispose() // 解除订阅
        
        
        // 这里第二个订阅者进入
        let observer2 = subject.subscribe(
            onNext: {print("Observer2 - what happened:\($0)")}
        )
        
        subject.onNext("Episode2 updated")
        subject.onNext("Episode3 updated")
        
        observer2.dispose()
        
        
    }
}

// MARK:- 试用制订阅
// 会将最近一次历史事件发送给订阅者
extension ViewController{
    
    func leaningRx4()  {
        
        // 此处,value表示第一个事件将要发送了,提前发送的一个事件
        let subject = BehaviorSubject<String>(value: "事件将要发生预警!!")
        
        let observer1 = subject.subscribe(
            onNext:{print("Observer1 - what happened:\($0)")}
        )
        
        subject.onNext("Episode1 updated")
        observer1.dispose() // 结果,我们可以看到 observer1接收到两个事件
        
        
        let observer2 = subject.subscribe(
            onNext: {print("Observer2 - what happened:\($0)")}
        )
        
        subject.onNext("Episode2 updated")
        subject.onNext("Episode3 updated")
        
        observer2.dispose() // observer2接收到三个事件
        
        
        /*
         Observer1 - what happened:事件将要发生预警!!
         Observer1 - what happened:Episode1 updated
         Observer2 - what happened:Episode1 updated
         Observer2 - what happened:Episode2 updated
         Observer2 - what happened:Episode3 updated
         */
        

    }
}

// MARK:- 试用制-控制发送给订阅者历史事件的范围
extension ViewController{
    func learningRx5()  {
        
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
}

// MARK:- 特殊的Observable - Variable
extension ViewController {
    
    func learningRx6()  {
        
        let stringVariable = Variable("Episode1")
        
        stringVariable.value = "Episode2"
        
        // 默认能监听到一个历史事件!
        _ = stringVariable.asObservable().subscribe{
            print("event:\($0)")
        }

        /* 注意,这里Variable需要强制转换为Observable
         event:next(Episode2)
         event:completed
         */
        
        
//        print(stringVariable.value)
        
        // 由于是对某种值创建的Observable,所以, value的修改就相当于调用onNext方法了, 同时,不能调用onError和onCompleted方法!
    }
}
