//
//  Shop.swift
//  PhotoBrowser
//
//  Created by 黄继平 on 2016/11/30.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class Shop: NSObject {

    var profile_image = ""
    var cdn_img = ""
    
    
    init(dict : [String:Any]) {
        
        super.init()

        setValuesForKeys(dict)
        
    }
    
    // 防止crash
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
}
