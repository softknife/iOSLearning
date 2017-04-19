//
//  UIImage+GESDImageCache.h
//
//
//  Created by Eric on 16/8/9.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GESDImageCache)

/**
 *  通过url缓存路径获得SDWeb存储的image
 */
+ (UIImage *)ge_getSDCacheDiskImageByUrlString:(NSString *)urlString;
/**
 *  内存缓存iamge
 */
+ (UIImage *)ge_getSDCacheMemoryImageByUrlString:(NSString *)urlString;


/**
 * 存储image到sdwebCache中,硬盘中,没有内存.
 *
 * @param key   The unique image cache key, usually it's image absolute URL
 */
- (void)ge_syncStoreImageForKey:(NSString *)key;



@end
