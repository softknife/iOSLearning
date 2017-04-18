//
//  GEPhotoBrowserController.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEIndexPath.h"
#import "GECustomTransition.h"
#import "GEPreviewInnerObject.h"

NS_ASSUME_NONNULL_BEGIN

@class GEPhotoPreviewController;

/**
 代理
 */
@protocol GEPhotoPreviewControllerDelegate <NSObject>

@required

- (void)photoPreview:(GEPhotoPreviewController *)photoBrowser longPressImageViewObject:(GEPreviewInnerObject *)photoObject image:(UIImage *)image item:(NSInteger)item;

@optional
- (void)photoPreview:(GEPhotoPreviewController *)photoBrowser tapImageView:(GEPreviewInnerObject *)photoObject item:(NSInteger)item;


@end


/** 数据源*/
@protocol  GEPhotoPreviewControllerAnimationDataSource <NSObject>

@required
- (CGRect)startRectForPhotoPreviewAnimation:(NSIndexPath *)animateIndexPath;

@end

@interface GEPhotoPreviewController : UIViewController

/** 模型数组*/
@property (nonatomic , strong ,readonly) NSArray<GEPreviewInnerObject *> *photoObjects;

/** 选中indexpath*/
@property (nonatomic , strong ,readonly) GEIndexPath *selectIndexPath;

/** transitionStyle*/
@property (nonatomic , weak,readonly) GECustomTransitionStyle *style;

/** 代理*/
@property (nonatomic , weak) id<GEPhotoPreviewControllerDelegate> delegate;
/** 数据源*/
@property (nonatomic , weak) id<GEPhotoPreviewControllerAnimationDataSource> dataSource;

/** 配置顶部view block*/
@property (nonatomic , copy,nullable) void(^topViewConfigBlock)(UIView *topView,NSLayoutConstraint *heightCons);
/** 配置底部view block*/
@property (nonatomic , copy,nullable) void(^bottomViewConfigBlock)(UIView *bottomView,NSLayoutConstraint *heightCons);



+ (instancetype)previewByPhotoObjects:(NSArray<GEPreviewInnerObject *> *)photoObjects selectIndex:(NSInteger)selectIndex;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
@end

NS_ASSUME_NONNULL_END
