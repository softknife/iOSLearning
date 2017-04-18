//
//  GEPhotoBrowserAnimation.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/27.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEPhotoBrowserAnimation.h"
#import "UIView+Extension.h"


@implementation GEPhotoBrowserAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *container = [transitionContext containerView];
    
    
    if (self.isDismiss == NO) {
        
        
        if (self.presentDataSource == nil) {
            return;
        }
        if (self.dismissDataSource == nil) {
            return;
        }
        
        [container addSubview:toVC.view];

        UIImageView *imageView = [self.dismissDataSource imageViewForPhotoBrowserAnimationPresent];
        
        CGRect beginRect = [self.presentDataSource startRectForPhotoBrowserAnimationPresent:self.animateIndexPath.indexPath];
//        DebugLog(@"present-begin:%@",NSStringFromCGRect(imageView.frame));

        imageView.frame = beginRect;

        [container addSubview:imageView];
   
        
        container.backgroundColor = [UIColor blackColor];
        toVC.view.hidden = YES;
        

        [UIView animateWithDuration:duration animations:^{
            
            imageView.frame = [self.dismissDataSource endRectForPhotoBrowserAnimationPresent];
            
//            DebugLog(@"present-end:%@",NSStringFromCGRect(imageView.frame));
            
        } completion:^(BOOL finished) {
            
            toVC.view.hidden = NO;

            container.backgroundColor = GEClearColor;
            [imageView removeFromSuperview];
            [transitionContext completeTransition:YES];

        }];
//
    }else{
       
        if (self.dismissDataSource == nil) {
            return;
        }
        
        if (self.presentDataSource == nil) {
            return;
        }
        
        fromVC.view.hidden = YES;
        
        
        UIImageView *imageView = [self.dismissDataSource imageViewForPhotoBrowserAnimationDismiss];

        imageView.frame = [self.dismissDataSource startRectForPhotoBrowserAnimationDismiss];
//        DebugLog(@"dismiss-begin:%@",NSStringFromCGRect(imageView.frame));

        [container addSubview:imageView];
        
        CGRect endRect = [self.presentDataSource startRectForPhotoBrowserAnimationPresent:self.animateIndexPath.indexPath];
        
        [UIView animateWithDuration:duration animations:^{
            
            imageView.alpha = 0;
            
            if (!CGRectEqualToRect(endRect, CGRectZero) && !CGRectEqualToRect(endRect, CGRectNull)) {
                imageView.frame = endRect;

            }else{
                imageView.transform = CGAffineTransformMakeScale(1.5, imageView.image.size.width / imageView.image.size.height * 1.5);

            }
            
        } completion:^(BOOL finished) {
            
            [imageView removeFromSuperview];
            
            [transitionContext completeTransition:YES];
        }];
        

       
    }
    
    

}


@end
