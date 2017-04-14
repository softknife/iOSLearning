//
//  ViewController.swift
//  3-抛出异常2
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        do {

            let result = try FileTool.getFileTextContentWithName("text.txt")
            
            // 注意,能走到这里,只是表示不会抛出异常,但是还是可选类型
            print(result ?? "空")
            
        } catch  {
            
            print(error)
            
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let result = try? FileTool.getFileTextContentWithName("text.txt") else {
            return
        }
        
        print(result ?? "空")
        
    }

}

