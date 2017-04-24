//
//  GEPhotoPreviewCell.h
//
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const photoBrowserCellId;

typedef NS_ENUM(NSUInteger,GEPhotoPreviewCellGesture) {
    
    /// 单击
    GEPhotoPreviewCellGestureTapOne,
    /// 双击
    GEPhotoPreviewCellGestureTapTwo,
    
    /// 长按
    GEPhotoPreviewCellGestureLongPress,
    
 
};

@class GEPhotoPreviewCell,GEPreviewInnerObject;
@protocol GEPhotoPreviewCellDelegate <NSObject>

@required
- (BOOL)photoPreviewCell:(GEPhotoPreviewCell *)cell triggerGesture:(GEPhotoPreviewCellGesture)gesture;
- (void)photoPreviewCell:(GEPhotoPreviewCell *)cell swipeGesture:(UISwipeGestureRecognizer *)gesture;
- (void)photoPreviewCell:(GEPhotoPreviewCell *)cell panGesture:(UIPanGestureRecognizer *)gesture;

@end
@interface GEPhotoPreviewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;

//@property (weak, nonatomic,readonly) UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 模型*/
@property (nonatomic , strong) GEPreviewInnerObject *photoObject;
/** 代理*/
@property (nonatomic , weak) id<GEPhotoPreviewCellDelegate> delegate;


/** 是否为往下滑动*/
@property (nonatomic , assign ,readonly,getter=isPullDown) BOOL pullDown;
/** translation*/
@property (nonatomic , assign) CGPoint translation;

/** UIPanGes begin DistanceY*/
@property (nonatomic , assign) CGFloat distance;
//
/** flagTransform*/
@property (nonatomic , assign) CGAffineTransform flagTransform;

#pragma mark - Public
+ (CGRect)getBigImageRectWithImage:(GEPreviewInnerObject *)photoObject originalImageRect:(CGRect)origImageRect thumImageYMargin:(CGFloat)yMargin;
+ (UIImageView *)imageViewForPhotoBrowserAnimationPresent:(GEPreviewInnerObject *)photoObject;


@end
