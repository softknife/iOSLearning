//
//  ViewController.swift
//  9-访问权限
//
//  Created by 黄继平 on 2016/11/19.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

/*
    public:跨框架
    internal:默认权限,项目内(命名空间内)
    fileprivate: 文件内访问
    private:类内访问
 */
class ViewController: UIViewController {

    
    /// 内部属性
    private var privateProperty : String?
    // 文件内部属性
    fileprivate var fileprivateProperty : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        privateProperty = "内部属性"
    }


}

class SameFileClass {
    
    func test()  {
        
        let vc = ViewController()
        vc.fileprivateProperty = "修改"
        //vc.privateProperty = "修改" 这样就是错误的!
    }
}

