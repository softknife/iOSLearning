//
//  CustomTransition.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEAnimatedTransitioning.h"


@protocol GECustomTransitionDelegate <NSObject>

@optional
- (void)customTransitionDidMaskViewAdd:(UIView *)maskView;
- (void)customTransitionDidMaskViewWillClick:(UIView *)maskView;
- (void)customTransitionDidMaskViewDidClick:(UIView *)maskView;
@end

@interface GECustomTransition : NSObject<UIViewControllerTransitioningDelegate>

+ (instancetype)transition;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/** transition*/
@property (nonatomic , strong) GECustomTransitionStyle *transitionStyle;

/** 代理*/
@property (nonatomic , weak) id<GECustomTransitionDelegate> delegate;

@end
