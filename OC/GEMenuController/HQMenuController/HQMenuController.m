//
//  HQMenuController.m
//  ExcellentLearning
//
//  Created by hjp on 17/1/16.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "HQMenuController.h"
#import "HQMenuTransition.h"

@interface HQMenuController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HQMenuController

- (void)viewDidLoad {
    [super viewDidLoad];

}



+ (void)showMenu
{
    CGRect bounds = [UIScreen mainScreen].bounds;

    HQMenuTransition *transition = [HQMenuTransition shareTransition];
    
    CGFloat width = 200;
    CGFloat height = 300;
    CGFloat x = bounds.size.width - width - 20 ;
    CGFloat y = 64;
    TransitionFeature feature = {
                                    x,
                                    y,
                                    width,
                                    height,
                                    0.4
                                };
    transition.transitionFeature = feature;
    
    HQMenuController *menu = [[HQMenuController alloc] init];

    menu.modalPresentationStyle = UIModalPresentationCustom;
    menu.transitioningDelegate = transition;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:menu animated:YES completion:nil];
}

@end
