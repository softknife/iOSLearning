//
//  CustomAnimatedTranstioning.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GECustomTransitionStyle.h"

typedef NS_ENUM(NSInteger,AnimationType) {
    
    AnimationTypeToPresented     = 0, // some viewController will be presented
    AnimationTypeToDismiss      = 1, // some viewController will dismiss
};





@interface GEAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

/** animatedFeature*/
@property (nonatomic , strong)  GECustomTransitionStyle *transionStyle;

/** present/dismiss*/
@property (nonatomic , assign) AnimationType animateType;
@end
