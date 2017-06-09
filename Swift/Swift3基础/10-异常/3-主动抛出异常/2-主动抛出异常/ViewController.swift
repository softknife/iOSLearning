//
//  ViewController.swift
//  2-主动抛出异常
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

enum TestError:Error{
    case errorType
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        


    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        do {
            try testThrows()
        } catch {
            print(error)
        }

        /*
         Error Domain=EricYellow.me Code=-1 "(null)" UserInfo={-1=随机值能被2整除}
         errorType
         errorType

         */
    }
    
    func testThrows() throws ->  Void {
        
        if arc4random() % 2 == 0{
            throw NSError(domain: "EricYellow.me", code: -1, userInfo: [-1:"随机值能被2整除"])
            
        }else{
            throw TestError.errorType
        }
    }

}

