//
//  CustomTransition.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEMenuAnimation.h"



@interface GEMenuTransition : NSObject<UIViewControllerTransitioningDelegate>

+ (instancetype)shareTransition;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

/** transition*/
@property (nonatomic , strong) GETransitionStyle *transitionStyle;
@end
