//
//  GETransitionPresentationController.m
//  GEMenuControllerDemo
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GETransitionPresentationController.h"
#import "GECustomTransition.h"

@implementation GETransitionPresentationController



- (void)presentationTransitionWillBegin
{
    [super presentationTransitionWillBegin];
    
    if (self.transition.transitionStyle.isNeedMaskView == NO ) {
        return;
    }
    
    
    UIView *containerView = self.containerView;
    
    UIButton *maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
    maskButton.frame = containerView.bounds;
    
    maskButton.backgroundColor = self.transition.transitionStyle.maskColor;

    [containerView insertSubview:maskButton belowSubview:self.presentedView];
    
    [maskButton addTarget:self action:@selector(maskButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.transitionDelegate transitionPresentationControllerDidMaskViewAdd:maskButton];
    
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
    if (completed) {

        if(self.transition.transitionStyle.hideStatusBar) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:self.transition.transitionStyle.animation];

        }
        
    }
    
}
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        
        if (self.transition.transitionStyle.hideStatusBar) {
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:self.transition.transitionStyle.animation];

        }

    }
}

- (void)maskButtonTouch:(UIButton *)button
{
    [self.transitionDelegate transitionPresentationControllerDidMaskViewWillClick:button];
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:^{
        
        [self.transitionDelegate transitionPresentationControllerDidMaskViewDidClick:button];
    }];
}
@end
