//
//  NetworkTools.swift
//  PhotoBrowser
//
//  Created by 黄继平 on 2016/11/29.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit
import AFNetworking

enum RequestMethod {
    case get
    case post
    
}

class NetworkTools: AFHTTPSessionManager {

    static let instance = NetworkTools()
}

// MARK: 网络请求封装
extension NetworkTools{
    
    func request(_ method:RequestMethod,url:String,para:[String:Any],success: @escaping (_ response:Any?)->Void ,failure:@escaping (Error?)->()) -> Void {
        
        switch method {
        case .get:
            
            get(url, parameters: para, progress: nil, success: { (_, response) in
                success(response)
                
            }, failure: { (_, error) in
                
                failure(error)
                
            })
            
        case .post:
            
           post(url, parameters: para, progress: nil, success: { (_, response) in
            
                success(response)
            
           }, failure: { (_, error) in
                failure(error)
           })

            
        }
    }
}
