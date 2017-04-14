//
//  ViewController.swift
//  8-常见注释
//
//  Created by 黄继平 on 2016/11/19.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

/*
    1.单行注释 //
    2.多行注释 /**/
    3.文档注释 ///
    4.分组注释 // MARK:-
    5.书签 // FIXME:   // TODO:
 */

class ViewController: UIViewController {

    /// name
    var name : String = ""

    
    // MARK:- 系统回调函数
    /// view加载完成回调
    override func viewDidLoad() {
        super.viewDidLoad()

       print(name)
    }

    // MARK:- 测试函数
    func test() -> Void {
        viewDidLoad()
    }
    
    // FIXME:- 错误
    // TODO:- 未完成

}

