//
//  GEMenuController.m
//  ExcellentLearning
//
//  Created by hjp on 17/1/16.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEMenuController.h"
#import "GEMenuTransition.h"

@interface GEMenuController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GEMenuController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (BOOL)prefersStatusBarHidden{
    return  YES;
}


+ (void)showMenu
{
    CGRect bounds = [UIScreen mainScreen].bounds;

    GEMenuTransition *transition = [GEMenuTransition transition];
    
    CGFloat width = 200;
    CGFloat height = 300;
    CGFloat x = bounds.size.width - width - 20 ;
    CGFloat y = 64 +1;
    
    GETransitionStyle *style = [GETransitionStyle styleWithRect:CGRectMake(x, y, width, height) transitionDuration:0.4];
    
    style.maskColor = [UIColor greenColor];
    [style configStatusBarConditionWhenPresentationOccurWithHide:YES animation:UIStatusBarAnimationFade];
    
    transition.transitionStyle = style;
    
    style.customDismiss = ^(UIView *animateView,id<UIViewControllerContextTransitioning> transitionContext){
    
        
        [UIView animateWithDuration:0.8 animations:^{
            
            animateView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];

        }];
        
    };
    
    GEMenuController *menu = [[GEMenuController alloc] init];

    menu.modalPresentationStyle = UIModalPresentationCustom;
    menu.transitioningDelegate = transition;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:menu animated:YES completion:nil];
}

@end
