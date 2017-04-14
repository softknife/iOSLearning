//
//  HomeCCLayout.swift
//  PhotoBrowser
//
//  Created by 黄继平 on 2016/11/28.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit

class HomeCCLayout: UICollectionViewFlowLayout {

    override func prepare() {
        super.prepare()
        
        minimumLineSpacing = 20
        minimumInteritemSpacing = 15
        
        itemSize = CGSize(width: 30, height: 30)
        
        collectionView?.contentInset = UIEdgeInsetsMake(64 + 10, 10, 0, 10)
        
    }
}
