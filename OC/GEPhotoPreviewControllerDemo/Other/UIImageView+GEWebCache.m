//
//  UIImageView+GEWebCache.m
//  ExcellentLearning
//
//  Created by Eric on 16/7/29.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIImageView+GEWebCache.h"
#import <SDWebImageManager.h>
#import <UIView+WebCache.h>
#import <objc/runtime.h>

#import "UIImage+GESDImageCache.h"

#import "UIView+GEAdd.h"



NSString *const GEProgressValueViewKey = @"GEProgressValueViewKey";

@implementation UIImageView (GEProgressValueView)

- (UILabel *)progressValueLabel
{
    return objc_getAssociatedObject(self, &GEProgressValueViewKey);
}

- (void)setProgressValueLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.ge_h * .5 + 20, self.ge_w, 20)];
    label.backgroundColor = [UIColor clearColor];
    objc_setAssociatedObject(self, &GEProgressValueViewKey, label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

/** 附件图片占位图*/
NSString *const GEImageDefaultAttachPlaceholder = @"yx_ss_default_photo";
/** 个人头像图片占位图*/
NSString *const GEImageDefaultUserPlaceholder = @"yx_ss_user_avatar";




@implementation UIImageView (GEWebCache)


#pragma mark - Thumb Picture



/**  头像缩略图  */
- (void)ge_setAvatarThumbImageViewWithURLString:(NSString *)urlString
{
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:GEImageDefaultUserPlaceholder]];
    
}

/**  头像缩略图   回调  */
- (void)ge_setAvatarThumbImageViewWithURLString:(NSString *)urlString completed:(SDExternalCompletionBlock)completedBlock{
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:GEImageDefaultUserPlaceholder] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (completedBlock) {
            
            completedBlock(image, error, cacheType, imageURL);
        }
    }];
}










#pragma mark - Orignal Picture


/**   随笔/班级圈附件/个人头像   原始图  回调  */
- (void)ge_setOrignalImageViewWithThumbURLString:(NSString *)thumbUrlString
                                orignalUrlString:(NSString *)orignalUrlString
                                       completed:(SDExternalCompletionBlock)completedBlock
{
    
    
    [[SDImageCache sharedImageCache] diskImageExistsWithKey:thumbUrlString completion:^(BOOL isInCache) {
        
        UIImage *placeholderImg;
        if (isInCache) {
            placeholderImg = [UIImage ge_getSDCacheDiskImageByUrlString:thumbUrlString];
            
        }else{
            
            placeholderImg = [UIImage imageNamed:GEImageDefaultAttachPlaceholder];
        }
        
        [self sd_setShowActivityIndicatorView:YES];
        
        [self sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        [self sd_setImageWithURL:[NSURL URLWithString:orignalUrlString] placeholderImage:placeholderImg completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            if (completedBlock) {
                completedBlock(image, error, cacheType, imageURL);
            }
        }];
        
    }];
    
        

    

   

}

/**   随笔/班级圈附件/个人头像   原始图  回调  进度条 */
- (void)ge_setOrignalImageViewWithThumbURLString:(NSString *)thumbUrlString
                                orignalUrlString:(NSString *)orignalUrlString
                                    progressType:(GEImageViewProgressValueType)type
                                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(SDExternalCompletionBlock)completedBlock
{
    
    [[SDImageCache sharedImageCache] diskImageExistsWithKey:thumbUrlString completion:^(BOOL isInCache) {
        
        UIImage *placeholderImg;
        if (isInCache) {
            
            placeholderImg = [UIImage ge_getSDCacheDiskImageByUrlString:thumbUrlString];
            
        }else{
            placeholderImg = [UIImage imageNamed:GEImageDefaultAttachPlaceholder];
        }
        
        [self sd_setShowActivityIndicatorView:YES];
        [self sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        [self sd_setImageWithURL:[NSURL URLWithString:orignalUrlString] placeholderImage:placeholderImg options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
            
            
            if (progressBlock) {
                progressBlock(receivedSize, expectedSize,targetURL);
            }
            
            switch (type) {
                    
                case GEImageViewProgressValueTypeNone:
                {}
                    break;
                case GEImageViewProgressValueTypeDefault:
                {
                    if (receivedSize > 0 && [self progressValueLabel] == nil) {
                        [self setProgressValueLabel];
                    }
                    [self progressValueLabel].text = [NSString stringWithFormat:@"%lf%%",receivedSize * 1.0 / expectedSize * 100 ];
                }
                    break;
                default:
                    break;
            }
            
            
           
        } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            if ([self progressValueLabel]) {
                [[self progressValueLabel] removeFromSuperview];
            }
            
            if (completedBlock) {
                completedBlock(image, error, cacheType, imageURL);
            }
        }];

        
    }];

}


- (UIImage *)createImageWithColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
