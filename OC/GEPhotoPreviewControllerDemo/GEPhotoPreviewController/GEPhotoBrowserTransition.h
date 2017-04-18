//
//  GEPhotoBrowserTransition.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/27.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEIndexPath.h"

@protocol GEPhotoBrowserAnimationPresentDataSource,GEPhotoBrowserAnimationDismissDataSource;

@interface GEPhotoBrowserTransition : NSObject<UIViewControllerTransitioningDelegate>

/** indexPath*/
@property (nonatomic , strong) GEIndexPath *animateIndexPath;

/** presentDelegate*/
@property (nonatomic , weak) id<GEPhotoBrowserAnimationPresentDataSource> presentDataSource;
/** dismissDelegate*/
@property (nonatomic , weak) id<GEPhotoBrowserAnimationDismissDataSource> dismissDataSource;

/** 时间差*/
@property (nonatomic , assign) NSTimeInterval duration;
@end
