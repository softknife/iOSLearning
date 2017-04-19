//
//  NSString+GESDCache.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/28.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "NSString+GESDCache.h"
#import <SDImageCache.h>
#import <SDImageCacheConfig.h>

@implementation NSString (GESDCache)

- (NSString *)getSDCachePath
{
    return [[SDImageCache sharedImageCache] defaultCachePathForKey:self];
}

- (void)ge_removeSDCacheMemoryDiskImageCompletion:(void(^)())completion
{
    [[SDImageCache sharedImageCache] removeImageForKey:self withCompletion:^{
        
        if (completion) {
            completion();
        }
    }];
}
- (void)ge_removeSDCacheImageOptionalDiskImage:(BOOL)diskRemove completion:(void(^)())completion
{
    [[SDImageCache sharedImageCache] removeImageForKey:self fromDisk:diskRemove withCompletion:completion];
}

- (void)ge_removeSDCacheImageMemoryDisk
{
    [[SDImageCache sharedImageCache] clearMemory];
    [[NSFileManager defaultManager] removeItemAtPath:[[SDImageCache sharedImageCache] defaultCachePathForKey:self] error:nil];
}

/**
 判断某个路径下是否存在图片

 */
- (void)ge_imageExist:(void(^)(BOOL inCache))checkImageCache
{
    [[SDImageCache sharedImageCache] diskImageExistsWithKey:self completion:checkImageCache];
}

@end
