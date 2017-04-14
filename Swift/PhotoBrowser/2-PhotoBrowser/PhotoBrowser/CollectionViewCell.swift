//
//  CollectionViewCell.swift
//  PhotoBrowser
//
//  Created by 黄继平 on 2016/12/1.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewCell: UICollectionViewCell {

    var shop : Shop? {
        didSet {
            
            if let imageUrlStr = shop?.cdn_img {
                
                imageButton.sd_setImage(with: URL(string:imageUrlStr)!, for: .normal)
            }
            
        }
    }
    
    
    @IBOutlet private weak var imageButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}
