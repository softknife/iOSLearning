//
//  GEPhotoBrowserTransition.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/27.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEPhotoBrowserTransition.h"
#import "GEPhotoBrowserPresentation.h"
#import "GEPhotoBrowserAnimation.h"


@implementation GEPhotoBrowserTransition

- (NSTimeInterval)duration
{
    return _duration?:1.0;
}

// presentationController ios8
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    
    return [[GEPhotoBrowserPresentation alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}



// animationControllerForPresent
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    GEPhotoBrowserAnimation *animation = [self animationController];
    animation.dismiss = NO;
    return animation;
}
// animationControllerForDismiss
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    GEPhotoBrowserAnimation *animation = [self animationController];
    animation.dismiss = YES;

    return animation;
}

- (GEPhotoBrowserAnimation *)animationController
{
    GEPhotoBrowserAnimation *animation = [[GEPhotoBrowserAnimation alloc] init];
    animation.presentDataSource = self.presentDataSource;
    animation.dismissDataSource = self.dismissDataSource;
    animation.duration = self.duration;
    animation.animateIndexPath = self.animateIndexPath;
    
    return animation;
}


@end
