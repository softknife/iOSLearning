//
//  UITabBar+Badge.m
//  ExcellentLearning
//
//  Created by Jacob on 16/2/24.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UITabBar+Badge.h"

//#import "HQHTTPAPI.h"

#define TabbarItemNums 4.0    //tabbar的数量

@implementation UITabBar (Badge)

//显示小红点
- (void)showBadgeOnItemIndex:(int)index{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;

    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
    float percentX = (index +0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width) - 2;
    CGFloat y = ceilf(0.1 * tabFrame.size.height) - 2;
    
    badgeView.frame = CGRectMake(x, y, 10, 10);//圆形大小为10
    
    badgeView.layer.cornerRadius = 5;//圆形
    [badgeView setClipsToBounds:YES];
    
    [self addSubview:badgeView];
}
//隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index{
    //移除小红点
    [self removeBadgeOnItemIndex:index];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(int)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
