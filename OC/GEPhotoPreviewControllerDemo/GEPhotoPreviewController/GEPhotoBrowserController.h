//
//  GEPhotoBrowserController.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GEPhotoBrowserAnimation.h"
#import "GEIndexPath.h"
#import "RKCloudChatMessageManager.h"
@class PhotoBrowserObject,GEPhotoBrowserController;


@protocol GEPhotoBrowserControllerDelegate <NSObject>

@required

- (void)photoBrowser:(GEPhotoBrowserController *)photoBrowser longPressImageViewObject:(PhotoBrowserObject *)photoObject image:(UIImage *)image item:(NSInteger)item;

@optional
- (void)photoBrowser:(GEPhotoBrowserController *)photoBrowser tapImageView:(PhotoBrowserObject *)photoObject item:(NSInteger)item;


@end

@interface GEPhotoBrowserController : UIViewController<GEPhotoBrowserAnimationDismissDataSource>

/** 模型数组*/
@property (nonatomic , strong) NSArray<PhotoBrowserObject *> *photoObjects;

/** 选中indexpath*/
@property (nonatomic , strong) GEIndexPath *selectIndexPath;
/** 代理*/
@property (nonatomic , weak) id<GEPhotoBrowserControllerDelegate> delegate;

/** 配置顶部view block*/
@property (nonatomic , copy) void(^topViewConfigBlock)(UIView *topView,NSLayoutConstraint *heightCons);
/** 配置底部view block*/
@property (nonatomic , copy) void(^bottomViewConfigBlock)(UIView *bottomView,NSLayoutConstraint *heightCons);





@property (nonatomic, copy) NSString *userId;









//更新图片
- (void)updateImage:(RKCloudChatBaseMessage *)messageObject;


//隐藏旋转框
- (void)hideProgress:(RKCloudChatBaseMessage *)messageObject;


@end
