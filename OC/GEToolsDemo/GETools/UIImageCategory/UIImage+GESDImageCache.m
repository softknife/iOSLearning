//
//  UIImage+GESDImageCache.m
//
//
//  Created by Eric on 16/8/9.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIImage+GESDImageCache.h"
#import <SDImageCache.h>


@implementation UIImage (GESDImageCache)


+ (UIImage *)ge_getSDCacheDiskImageByUrlString:(NSString *)urlString
{
    return  [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:urlString];
}

+ (UIImage *)ge_getSDCacheMemoryImageByUrlString:(NSString *)urlString
{
    return  [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:urlString];
}


/**
 * 存储image到sdwebCache中,硬盘.
 *
 * @param key   The unique image cache key, usually it's image absolute URL
 */
- (void)ge_syncStoreImageForKey:(NSString *)key
{
    if (self && key.length) {
        
        NSData *imageData = UIImageJPEGRepresentation(self, (CGFloat)1.0);
        
        if (imageData == nil) {
            imageData = UIImagePNGRepresentation(self);
        }
        
        NSAssert(imageData != nil, @"将image存储到SDWebCache过程失败,imageData为空");
        
        [[SDImageCache sharedImageCache] storeImageDataToDisk:imageData forKey:key];
    }
}


@end
