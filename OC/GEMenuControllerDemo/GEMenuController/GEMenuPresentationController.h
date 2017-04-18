//
//  CustomPresentationController.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol GEMenuPresentationControllerDelegate <NSObject>

- (void)menuPresentationControllerDidMaskViewAdd:(UIView *)maskView;
- (void)menuPresentationControllerDidMaskViewWillClick:(UIView *)maskView;
- (void)menuPresentationControllerDidMaskViewDidClick:(UIView *)maskView;
@end

@class GEMenuTransition;
@interface GEMenuPresentationController : UIPresentationController
/** transition*/
@property (nonatomic , strong) GEMenuTransition *transition;

/** 代理*/
@property (nonatomic , weak) id<GEMenuPresentationControllerDelegate> transitionDelegate;
@end
