//
//  GEPhotoBrowserLayout.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEPhotoBrowserLayout.h"
#import "UIScreen+Extension.h"

@implementation GEPhotoBrowserLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = self.collectionView.bounds.size;
}
@end
