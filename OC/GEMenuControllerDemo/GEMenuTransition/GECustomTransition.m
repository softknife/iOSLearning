//
//  CustomTransition.m
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GECustomTransition.h"
#import "GEAnimatedTransitioning.h"
#import "GETransitionPresentationController.h"

@interface GECustomTransition ()<GETransitionPresentationControllerDelegate>
/** animationTranstion*/
@property (nonatomic , strong) GEAnimatedTransitioning *animation;
@end
@implementation GECustomTransition

+ (instancetype)transition
{
    return [[self alloc] __init__];
}
#pragma mark - UIViewControllerTransitioningDelegate

- (instancetype)__init__
{
    if (self = [super init]) {
        
        self.animation = [GEAnimatedTransitioning new];
    
    }
    
    return self;
}



// presentationController
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    GETransitionPresentationController *presentation = [[GETransitionPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    presentation.transition = self; // 保持transition
    presentation.transitionDelegate = self;
    
    return presentation;
}
// present animation
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{

    self.animation.transionStyle = self.transitionStyle;
    self.animation.animateType = AnimationTypeToPresented;
    
    return self.animation;
}

// dismiss animation
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    
    self.animation.animateType = AnimationTypeToDismiss;
    return self.animation;
    
}

#pragma mark - GECustomPresentationControllerDelegate
- (void)transitionPresentationControllerDidMaskViewAdd:(UIView *)maskView
{
    if ([self.delegate respondsToSelector:@selector(customTransitionDidMaskViewAdd:)]) {
        [self.delegate customTransitionDidMaskViewAdd:maskView];
    }
}

- (void)transitionPresentationControllerDidMaskViewWillClick:(UIView *)maskView
{
    if ([self.delegate respondsToSelector:@selector(customTransitionDidMaskViewWillClick:)]) {
        [self.delegate customTransitionDidMaskViewWillClick:maskView];
    }
}
- (void)transitionPresentationControllerDidMaskViewDidClick:(UIView *)maskView
{
    if ([self.delegate respondsToSelector:@selector(customTransitionDidMaskViewDidClick:)]) {
        [self.delegate customTransitionDidMaskViewDidClick:maskView];
    }
}

@end
