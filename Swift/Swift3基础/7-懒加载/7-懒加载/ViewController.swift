//
//  ViewController.swift
//  7-懒加载
//
//  Created by 黄继平 on 2016/11/18.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

/*
 懒加载
 1.用到时再加载
 2.多次使用只会加载一次
 3.有特殊保留字lazy
 4.懒加载属性只能是var属性!
 */


class ViewController: UIViewController {

    
    // 1.懒加载创建方法1
    lazy var name : String = {
    
        // 这里可以做一些事情.......
        print("懒加载方案1")
        
        return "大大大阿达!"
       // 我们在使用 lazy 作为属性修饰符时，只能声明属性是变量。另外我们需要显式地指定属性类型，并使用一个可以对这个属性进行赋值的语句来在首次访问属性时运行。如果我们多次访问这个实例的 str 属性的话，可以看到只有一次输出。
    }()
    
    // 2.懒加载方法2
    lazy var name2 : String = "小小小!"
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
        
        print(name2)
        
    }


    
}

