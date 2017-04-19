//
//  UIImage+Other.h
//  GEToolsDemo
//
//  Created by hjp on 17/4/19.
//  Copyright © 2017年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Other)

/**
 *  进行图片掩码
 *
 *  @param maskImage 需要掩码的图片
 *  @return 掩码图片
 */
- (UIImage *)maskWithImage:(const UIImage *) maskImage;
- (UIImage *)maskWithColor:(UIColor *) color;


/**
 根据颜色生成纯色的图片
 
 @param color 颜色
 @param size 大小
 @return 生成的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  从照片中直接识别二维码
 *
 *  @param completion    二维码包含的内容
 *  @param fail 扫描失败结果
 */
- (void)readQRCodeCompletion:(void(^)(NSString *message))completion
                        fail:(void(^)(NSString *errorMsg))fail;
@end
