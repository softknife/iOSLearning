//
//  NSString+GESDCache.h
//  
//
//  Created by hjp on 16/11/28.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GESDCache)
- (NSString *)getSDCachePath;

/**
 *  清除内存和磁盘image
 *  异步
 */
- (void)ge_removeSDCacheMemoryDiskImageCompletion:(void(^)())completion;
/**
 *  清除内存和磁盘image
 *  异步
 */
- (void)ge_removeSDCacheImageOptionalDiskImage:(BOOL)diskRemove completion:(void(^)())completion;

/**
 同步删除图片从内存和磁盘，不过该方法需要清理内存缓存
 */
- (void)ge_removeSDCacheImageMemoryDisk;

/**
 判断某个路径下是否存在图片
 
 */
- (void)ge_imageExist:(void(^)(BOOL inCache))checkImageCache;
@end
