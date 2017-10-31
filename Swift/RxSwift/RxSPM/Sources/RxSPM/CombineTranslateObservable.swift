//
//  CombineTranslateObservable.swift
//  RxSPM
//
//  Created by Apple on 2017/10/31.
//

import Foundation
import RxSwift


/// Observable 的传递
///
func combine_translateBetweenObservables(_ desc:String) {
    
    
    
    // 获取另一个Observable中的的值
    example(of: desc) {
        
        let textField = BehaviorSubject<String>(value:"inital data ")
        let submitButton = PublishSubject<Void>()
        let bag = DisposeBag()
        
        submitButton.withLatestFrom(textField).subscribe(onNext:{
            dump($0)
        }).disposed(by: bag)
        
        submitButton.onNext(())
        textField.onNext("Input data")
        submitButton.onNext(())
        
        /*
         - "inital data "
         - "Input data"
         */

    }
    
    example(of: "订阅的内容在两个Observable中传递-swiftLatest") {
        
        let coding = PublishSubject<String>()
        let testing = PublishSubject<String>()
        let working = PublishSubject<Observable<String>>()
        
        let bag = DisposeBag()
        
        working.switchLatest()
            .subscribe(onNext:{ dump($0)})
            .disposed(by: bag)
        
        working.onNext(coding)
        coding.onNext("version1")
        
        working.onNext(testing)
        testing.onNext("FAILED")
        
        // 由于当前working工作的Observable是testing,所以,即使coding产生事件,也不会触发
        coding.onNext("version1.5")
        
        working.onNext(coding)
        coding.onNext("version2")
        
        working.onNext(testing)
        testing.onNext("PASS")
        
        /*
         - "version1"
         - "FAILED"
         - "version2"
         - "PASS"
         */
        
    }
    
    
}
