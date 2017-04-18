//
//  GEPhotoBrowserCell.h
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const photoBrowserCellId;

typedef NS_ENUM(NSUInteger,GEPhotoBrowserCellGesture) {
    
    /// 单击
    GEPhotoBrowserCellGestureTapOne,
    /// 双击
    GEPhotoBrowserCellGestureTapTwo,
    
    /// 长按
    GEPhotoBrowserCellGestureLongPress
};

@class GEPhotoBrowserCell,PhotoBrowserObject,RKCloudChatBaseMessage;
@protocol GEPhotoBrowserCellDelegate <NSObject>

@required
- (BOOL)photoBrowserCell:(GEPhotoBrowserCell *)cell triggerGesture:(GEPhotoBrowserCellGesture)gesture;

@end
@interface GEPhotoBrowserCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

@property (weak, nonatomic,readonly) UIImageView *imageView;
/** 模型*/
@property (nonatomic , strong) PhotoBrowserObject *photoObject;
/** 代理*/
@property (nonatomic , weak) id<GEPhotoBrowserCellDelegate> delegate;

#pragma mark - Public
+ (CGRect)getBigImageRectWithImage:(PhotoBrowserObject *)photoObject originalImageRect:(CGRect)origImageRect thumImageYMargin:(CGFloat)yMargin;
+ (UIImageView *)imageViewForPhotoBrowserAnimationPresent:(PhotoBrowserObject *)photoObject;

//更新图片显示
- (void)updateImage:(RKCloudChatBaseMessage *)message;

//隐藏旋转框
- (void)hideProgress:(RKCloudChatBaseMessage *)messageObject;
@end
