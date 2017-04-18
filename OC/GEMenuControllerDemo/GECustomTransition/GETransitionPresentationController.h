//
//  GETransitionPresentationController.h
//  GEMenuControllerDemo
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol GETransitionPresentationControllerDelegate <NSObject>

- (void)transitionPresentationControllerDidMaskViewAdd:(UIView *)maskView;
- (void)transitionPresentationControllerDidMaskViewWillClick:(UIView *)maskView;
- (void)transitionPresentationControllerDidMaskViewDidClick:(UIView *)maskView;
@end

@class GECustomTransition;
@interface GETransitionPresentationController : UIPresentationController
/** transition*/
@property (nonatomic , weak) GECustomTransition *transition;

/** 代理*/
@property (nonatomic , weak) id<GETransitionPresentationControllerDelegate> transitionDelegate;
@end
