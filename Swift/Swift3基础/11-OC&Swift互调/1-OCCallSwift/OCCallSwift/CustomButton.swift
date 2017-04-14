//
//  CustomButton.swift
//  OCCallSwift
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

open class CustomButton: UIButton {

    open var customTitle : String = "" {
    
        didSet{
            setTitle(customTitle, for: .normal)
        }
    }
    
    open func test(){
        print("oc调用swift中的方法")
    }

}
