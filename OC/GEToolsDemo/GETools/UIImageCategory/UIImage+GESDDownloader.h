//
//  UIImage(GESDDownloader).h
//  
//
//  Created by hjp on 16/8/11.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "SDWebImageManager.h"



@interface UIImage(GESDDownloader)

+ (void)ge_syncDownloadByUrlString:(NSString *)string;

+ (void)ge_downloadImageByUrlString:(NSString *)string;

+ (void)ge_downloadImageByUrlString:(NSString *)string
                         options:(SDWebImageOptions)options
                        progress:(SDWebImageDownloaderProgressBlock)progressBlock
                       completed:(SDWebImageDownloaderCompletedBlock)completedBlock;
@end
