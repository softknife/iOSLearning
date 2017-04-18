//
//  GETransitionStyle.m
//  GEMenuControllerDemo
//
//  Created by hjp on 17/4/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "GECustomTransitionStyle.h"

@implementation GECustomTransitionStyle

- (UIColor *)maskColor
{
    if (!_maskColor) {
        _maskColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:0.5];
    }
    
    return _maskColor;
}

/**
 当发生modal时，是否隐藏statusbar
 
 @param hide 隐藏与否
 @param animation 动画类型
 */
- (void)configStatusBarConditionWhenPresentationOccurWithHide:(BOOL)hide animation:(UIStatusBarAnimation)animation
{
    _hideStatusBar = hide;
    _animation = animation;
    
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;

    id statusBarStatus = infoDict[@"UIViewControllerBasedStatusBarAppearance"];

    NSAssert(statusBarStatus, @"如果想使用hideStatusBar属性请在info.plist中,增加 View controller-based status bar appearance 一行,选择为 NO");
    
    BOOL statusBaseVC = [statusBarStatus boolValue];
    
    NSAssert( !statusBaseVC, @"当前应用StatusBar更新是基于ViewController的，该属性设置无效");
   
}

/**
 工厂方法
 
 @param frame 初始化的frame
 @param duration 动画时间
 @return 实例
 */
+ (instancetype)styleWithRect:(CGRect)frame transitionDuration:(NSTimeInterval)duration
{

    return  [[self alloc] initWithRect:frame transitionDuration:duration];
    
}

- (instancetype)initWithRect:(CGRect)frame transitionDuration:(NSTimeInterval)duration
{
    if (self = [super  init]) {
        _frame = frame;
        _transitionDuration = duration;
        self.needMaskView = YES;
    }
    
    return self;
}
@end
