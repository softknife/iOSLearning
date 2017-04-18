//
//  UIImageView+GEWebCache.h
//  ExcellentLearning
//
//  Created by Eric on 16/7/29.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

typedef NS_ENUM(NSInteger,GEImageViewProgressValueType) {
    GEImageViewProgressValueTypeNone        = 0,
    /// 百分比
    GEImageViewProgressValueTypeDefault     = 1,
    
    
    
};

/** 附件图片占位图*/
UIKIT_EXTERN NSString *const GEImageDefaultAttachPlaceholder;
/** 个人头像图片占位图*/
UIKIT_EXTERN NSString *const GEImageDefaultUserPlaceholder;



@interface UIImageView (GEWebCache)

/**  头像缩略图  */
- (void)ge_setAvatarThumbImageViewWithURLString:(NSString *)urlString;

/**  头像缩略图   回调  */
- (void)ge_setAvatarThumbImageViewWithURLString:(NSString *)urlString completed:(SDExternalCompletionBlock)completedBlock;




#pragma mark - 大图预览


/**   随笔/班级圈附件/个人头像   原始图  回调 */
- (void)ge_setOrignalImageViewWithThumbURLString:(NSString *)thumbUrlString
                                orignalUrlString:(NSString *)orignalUrlString
                                       completed:(SDExternalCompletionBlock)completedBlock;

/**   随笔/班级圈附件/个人头像   原始图  回调  进度条 */
- (void)ge_setOrignalImageViewWithThumbURLString:(NSString *)thumbUrlString
                                orignalUrlString:(NSString *)orignalUrlString
                                    progressType:(GEImageViewProgressValueType)type
                                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                                       completed:(SDExternalCompletionBlock)completedBlock;





@end
