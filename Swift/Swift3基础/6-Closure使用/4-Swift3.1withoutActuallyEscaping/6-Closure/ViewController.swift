//
//  ViewController.swift
//  6-Closure
//
//  Created by 黄继平 on 2016/11/17.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /** 网络工具*/
    private var httpTools : HTTPTools?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        httpTools = HTTPTools()

    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        httpTools?.loadData({ json in
            
            print("得到数据: \(String(describing: json))")
            
        })
    }
    
    /*
     请求数据,当前线程:<NSThread: 0x60000007a2c0>{number = 3, name = (null)}
     得到数据:Optional("图片一张")
     */
}

