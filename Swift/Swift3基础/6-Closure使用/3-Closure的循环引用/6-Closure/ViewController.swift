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
        

        // 逃逸闭包会对其中的对象做强引用,这也是为什么闭包中我们使用当前控制的属性时,需要强制写self,而其他方法中我们可以省略self直接调用属性
        
        // 内存分析
        /*
                    self
                    /   ^
                   /     \
                  v       \
            httpTools      closure
         
         上图可见self强引用者httpTools(默认是强引用),而closure强引用者self,但是,并不构成"死循环",所以不存在循环引用问题;
         如果我们在httpTools中强引用一下closure,那么就构成死循环了!!!
         */
        
        
        //        httpTools?.loadData { (jsonData) in
        //            
        //            print("得到数据:\(jsonData)")
        //            self.view.backgroundColor = UIColor.red
        //            
        //        }
        
        /* 当httpTools引用这closure时,就构成死循环了,也就是所谓循环引用
         
                    self
                   /   ^
                  /     \
                 v       \
         httpTools  --> closure
         
         */
        
        /*
            为了避免循环引用,我们有几个思路:
            1.弱化self对httpTools的引用;
            2.弱化httpTools对closure的引用
            3.弱化closure对self的引用
            
            具体弱化哪个环节,需要根据具体情境!!💕
         */
        
        // 此处,由于self属于shortLived环节,所以,我们选择弱化closure对self的引用!
        /*
         方案1:
         weakSolution1()
        
         方案2:
         weakSolution2()

         方案3:
         weakSolution3()

         */
        
    }
    
   
    private func weakSolution1(){
    
        weak var weakSelf = self
        
        httpTools?.loadData({ (jsonData) in
            
            print("得到返回数据:\(String(describing: jsonData)),弱引用方案1")
            
            weakSelf?.view.backgroundColor = UIColor.green
        })
        
        /*
         请求数据,当前线程:<NSThread: 0x610000260e40>{number = 3, name = (null)}
         得到返回数据:Optional("图片一张"),弱引用方案1
         */
    }
    
    private func weakSolution2()->(){
        httpTools?.loadData{ [weak self] (jsonData) in
            
            print("得到返回数据:\(String(describing: jsonData)),弱引用方案2")
            
            // 注意,此处self已经是可选的了!
            self?.view.backgroundColor = UIColor.red
        }
        /*
         请求数据,当前线程:<NSThread: 0x600000075b80>{number = 3, name = (null)}
         得到返回数据:Optional("图片一张"),弱引用方案2
         
         */

    }
    
    private func weakSolution3()->(){
    
        httpTools?.loadData{ [unowned self] (jsonData) in
            
            print("得到返回数据:\(String(describing: jsonData)),弱引用方案3")
            
            // 注意,此处self是不可选的,此处unowned类似于OC中的__unsafe__unretain修饰符
            // 表示,closure不会对self强引用(引用计数未加1️⃣),但是,当self deinit时,closure使用self指针访问的内存不会自动转移到nil(0x0),而是继续访问被释放的内存,不安全!⚠️
            self.view.backgroundColor = UIColor.orange
        }
        /*
         请求数据,当前线程:<NSThread: 0x60000026a240>{number = 3, name = (null)}
         得到返回数据:Optional("图片一张"),弱引用方案3
         */

    }
}

