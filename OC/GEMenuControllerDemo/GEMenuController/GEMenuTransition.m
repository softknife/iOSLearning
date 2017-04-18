//
//  CustomTransition.m
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEMenuTransition.h"
#import "GEMenuAnimation.h"
#import "GEMenuPresentationController.h"

@interface GEMenuTransition ()
/** animationTranstion*/
@property (nonatomic , strong) GEMenuAnimation *animation;
@end
@implementation GEMenuTransition

+ (instancetype)shareTransition
{
    return [[self alloc] __init__];
}
#pragma mark - UIViewControllerTransitioningDelegate

- (instancetype)__init__
{
    if (self = [super init]) {
        
        self.animation = [GEMenuAnimation new];
    
    }
    
    return self;
}



// presentationController
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    GEMenuPresentationController *presentation = [[GEMenuPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    presentation.transition = self; // 保持transition
    
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
@end
