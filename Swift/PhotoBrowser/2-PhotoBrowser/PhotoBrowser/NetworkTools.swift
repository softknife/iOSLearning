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

    static let instance : NetworkTools = {
    
        let tools = NetworkTools()
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
        
        return tools
    
    }()
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

extension HomeCC {
    
    func loadHomeData( _ completion: @escaping ([[String : Any]]?)->Void ) -> Void {
        
        let urlString = "http://api.budejie.com/api/api_open.php"
        
        let para = [
            "a" : "list",
            "c" : "data"
        ]
        
        NetworkTools.instance.request(.get, url: urlString, para: para, success: { response in
            
            guard let resultDict = response as? [String : Any] else{
                return
            }
            
            guard let resultArray = resultDict["list"] as? [[String:Any]] else{
                return
            }
            
            
            completion(resultArray)
            
            
        }, failure: { error in
            
            print(error?.localizedDescription ?? "")
            
        })

        
    }
}
