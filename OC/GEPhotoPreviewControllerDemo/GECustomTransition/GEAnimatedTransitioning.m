//
//  GEAnimatedTransitioning.m
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEAnimatedTransitioning.h"
#import <Masonry.h>

const CGFloat kDefaultDuration = 0.5;

@implementation GEAnimatedTransitioning

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    
    NSTimeInterval duration = self.transionStyle.transitionDuration;
    if (self.transionStyle.transitionDuration <= 0) {
        duration = kDefaultDuration;
    }
    return duration;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    
    UIView *container = [transitionContext containerView];

    __weak typeof (self) weakSelf = self;
    switch (self.animateType) {
        case AnimationTypeToPresented: {
            
            UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

            [container addSubview:toVC.view];

            // 自定义动画
            if (self.transionStyle.customPresent) {
                
                self.transionStyle.customPresent(toVC.view,transitionContext);

                return;
            }
            
            // 默认动画
            [toVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(container.mas_left).offset(weakSelf.transionStyle.frame.origin.x);
                make.top.equalTo(container.mas_top).offset(weakSelf.transionStyle.frame.origin.y);
                make.width.equalTo(@(weakSelf.transionStyle.frame.size.width));
                make.height.equalTo(@(0));
            }];
            
            [container layoutIfNeeded];

            
            [toVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.equalTo(@(weakSelf.transionStyle.frame.size.height));
            }];
            
            [UIView animateWithDuration:duration animations:^{
                
                [container layoutIfNeeded];
                
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
           
            
            break;
        }
        case AnimationTypeToDismiss: {
            
            UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

            // 自定义动画
            if (self.transionStyle.customDismiss) {
                self.transionStyle.customDismiss(fromVC.view,transitionContext);

                return;
            }
            
            
            // 默认动画
            [fromVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
                
                make.height.equalTo(@(0));
            }];
            
            [UIView animateWithDuration:duration animations:^{
                
                [container layoutIfNeeded];

            } completion:^(BOOL finished) {
                
                [transitionContext completeTransition:YES];
                
            }];
            
            
            break;
        }
    }
}
@end
