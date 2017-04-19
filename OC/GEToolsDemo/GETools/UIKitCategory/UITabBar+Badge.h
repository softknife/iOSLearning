//
//  UITabBar+Badge.h
//  ExcellentLearning
//
//  Created by Jacob on 16/2/24.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index;  //隐藏小红点

@end
