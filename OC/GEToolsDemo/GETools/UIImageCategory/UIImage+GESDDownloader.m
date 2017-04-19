//
//  UIImage(GESDDownloader) .m
//
//
//  Created by hjp on 16/8/11.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIImage+GESDDownloader.h"



@implementation UIImage(GESDDownloader)

// 同步下载图片
+ (void)ge_syncDownloadByUrlString:(NSString *)string
{
    if (string.length == 0) {
        return;
    }
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    [self ge_downloadImageByUrlString:string options:0 progress:nil completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        dispatch_semaphore_signal(sema);
    }];
   
    // 十秒
    dispatch_semaphore_wait(sema, NSEC_PER_SEC * 10);
}

+ (void)ge_downloadImageByUrlString:(NSString *)string
{
    
    [self ge_downloadImageByUrlString:string options:0 progress:nil completed:nil];
    
}


+ (void)ge_downloadImageByUrlString:(NSString *)string
                         options:(SDWebImageOptions)options
                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                       completed:(SDWebImageDownloaderCompletedBlock)completedBlock
{
    
    NSURL *url = [NSURL URLWithString:string];
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        if (progressBlock) {
            progressBlock(receivedSize,expectedSize,targetURL);
        }
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        
        if (completedBlock) {
            completedBlock(image,data,error,finished);
        }

    }];
    

}

@end
