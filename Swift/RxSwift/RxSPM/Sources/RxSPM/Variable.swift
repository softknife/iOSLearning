//
//  Variable.swift
//  RxSPM
//
//  Created by 黄继平 on 2017/10/19.
//

import Foundation
import RxSwift

/**
 特殊的Observable - Variable
 */
func variableBasicUsage(_ desc: String)  {
    
    print(desc)
    
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
