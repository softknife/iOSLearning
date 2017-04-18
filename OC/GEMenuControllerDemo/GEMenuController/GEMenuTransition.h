//
//  CustomTransition.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMenuAnimation.h"


@protocol GEMenuTransitionDelegate <NSObject>

@optional
- (void)menuTransitionDidMaskViewAdd:(UIView *)maskView;
- (void)menuTransitionDidMaskViewWillClick:(UIView *)maskView;
- (void)menuTransitionDidMaskViewDidClick:(UIView *)maskView;
@end

@interface GEMenuTransition : NSObject<UIViewControllerTransitioningDelegate>

+ (instancetype)transition;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/** transition*/
@property (nonatomic , strong) GETransitionStyle *transitionStyle;

/** 代理*/
@property (nonatomic , weak) id<GEMenuTransitionDelegate> delegate;

@end
