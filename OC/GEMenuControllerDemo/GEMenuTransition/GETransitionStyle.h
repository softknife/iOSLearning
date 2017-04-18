//
//  GETransitionStyle.h
//  GEMenuControllerDemo
//
//  Created by hjp on 17/4/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



typedef void(^GETransitionBlock)(UIView *,id <UIViewControllerContextTransitioning>);

@interface GETransitionStyle : NSObject
/** 初始值*/
@property (nonatomic , assign,readonly) CGRect frame;
/** 动画时间 
 时间最好不要大于1.0秒,否则,transition时间太长,会导致快速点击遮盖失效*/
@property (nonatomic , assign,readonly) NSTimeInterval transitionDuration;

/** present自定义动画*/
@property (nonatomic , copy ,nullable) GETransitionBlock customPresent;
/** dismiss自定义动画*/
@property (nonatomic , copy ,nullable) GETransitionBlock customDismiss;

/** maskViewColor*/
@property (nonatomic , strong) UIColor *maskColor;

/** 是否hideStatusBar*/
@property (nonatomic , assign ,readonly) BOOL hideStatusBar;
/** hideStatusBar时是否需要动画*/
@property (nonatomic , assign,readonly) UIStatusBarAnimation animation;

/** 是否需要maskview*/
@property (nonatomic , assign ,getter=isNeedMaskView) BOOL needMaskView;

/**
 当发生modal时，是否隐藏statusbar

 @param hide 隐藏与否
 @param animation 动画类型
 */
- (void)configStatusBarConditionWhenPresentationOccurWithHide:(BOOL)hide animation:(UIStatusBarAnimation)animation;
/**
 工厂方法

 @param frame 初始化的frame
 @param duration 动画时间
 @return 实例
 */
+ (instancetype)styleWithRect:(CGRect)frame transitionDuration:(NSTimeInterval)duration;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
@end

NS_ASSUME_NONNULL_END
