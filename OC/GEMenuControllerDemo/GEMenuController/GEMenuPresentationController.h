//
//  CustomPresentationController.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/19.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GEMenuTransition;
@interface GEMenuPresentationController : UIPresentationController
/** transition*/
@property (nonatomic , strong) GEMenuTransition *transition;
@end
