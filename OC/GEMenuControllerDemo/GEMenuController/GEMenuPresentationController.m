//
//  CustomPresentationController.m
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEMenuPresentationController.h"
#import "GEMenuTransition.h"

@implementation GEMenuPresentationController



- (void)presentationTransitionWillBegin
{
    [super presentationTransitionWillBegin];
    
    UIView *containerView = self.containerView;
    
    UIButton *maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
    maskButton.frame = containerView.bounds;
    
    maskButton.backgroundColor = self.transition.transitionStyle.maskColor;

    [containerView insertSubview:maskButton belowSubview:self.presentedView];
    
    [maskButton addTarget:self action:@selector(maskButtonTouch) forControlEvents:UIControlEventTouchUpInside];
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

- (void)maskButtonTouch
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
