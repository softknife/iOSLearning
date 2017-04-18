//
//  GEPhotoBrowserAnimation.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/27.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEIndexPath.h"


/** 弹出*/
@protocol  GEPhotoBrowserAnimationPresentDataSource <NSObject>

- (CGRect)startRectForPhotoBrowserAnimationPresent:(NSIndexPath *)animateIndexPath;

@end

/** 销毁*/
@protocol GEPhotoBrowserAnimationDismissDataSource <NSObject>

- (UIImageView *)imageViewForPhotoBrowserAnimationPresent;
- (UIImageView *)imageViewForPhotoBrowserAnimationDismiss;
- (CGRect)startRectForPhotoBrowserAnimationDismiss;
- (CGRect)endRectForPhotoBrowserAnimationPresent;
@end

@interface GEPhotoBrowserAnimation : NSObject<UIViewControllerAnimatedTransitioning>
/** presentDelegate*/
@property (nonatomic , weak) id<GEPhotoBrowserAnimationPresentDataSource> presentDataSource;
/** dismissDelegate*/
@property (nonatomic , weak) id<GEPhotoBrowserAnimationDismissDataSource> dismissDataSource;

/** dismiss*/
@property (nonatomic , assign , getter = isDismiss) BOOL dismiss;

/** duration*/
@property (nonatomic , assign) NSTimeInterval duration;
/** animatonIndexPath*/
@property (nonatomic , strong) GEIndexPath *animateIndexPath;

@end
