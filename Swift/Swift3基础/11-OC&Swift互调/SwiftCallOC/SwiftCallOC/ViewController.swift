//
//  ViewController.swift
//  SwiftCallOC
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

/*
    1.在Swift项目中创建OC文件时,直接按照Xcode提示,生成一个bridge.h文件;
        1.1 或者自己手动创建一个bridge.h文件, 创建完成后,在项目->build setting中搜bridging->在bridging header对应的value中写入桥接文件的路径(项目名/桥接文件)
    2.在桥接文件中导入需要创建的OC头文件
    3.在Swift中就可以使用了!
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let button = CustomButton(type: .contactAdd)
        button.backgroundColor = UIColor.red
        
        view.addSubview(button)
        
    }

}

