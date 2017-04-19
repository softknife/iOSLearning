//
//  UIImage(GEResize).h
//
//
//  Created by hjp on 16/8/11.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//
#import <UIKit/UIKit.h>


@interface UIImage (GEResize)


/**
 *  进行图片缩放
 *
 *  @param size 需要缩放的尺寸
 *
 *  @return 返回的图片
 */
- (UIImage *)renderAtSize:(const CGSize) size;

/**
 裁剪图片
 
 @param bounds 区域
 */
- (UIImage *)croppedImage:(CGRect)bounds;

/**
 将图片裁剪成头像
 */
- (UIImage *)getScaleAvatarImage;
/**
 将图片裁剪获得一般缩略图
 */
- (UIImage *)getDefaultScaleToThumbnailImage;

/**
 获得新图片根据目标size,可能会拉伸
 */
- (UIImage *)imageResizeToSize:(CGSize)size;
/**
 根据contentMode获取新图片
 */
- (UIImage *)imageResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

/**
 获得裁剪后的图片
 @param rect 裁剪范围
 */
- (UIImage *)imageCropToRect:(CGRect)rect;
@end
  
