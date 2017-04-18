//
//  GEIndexPath.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/28.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEIndexPath.h"

@implementation GEIndexPath
- (void)setSelectPage:(NSInteger)selectPage
{
    _selectPage = selectPage;
    _indexPath = [NSIndexPath indexPathForItem:selectPage inSection:0];

}
@end
