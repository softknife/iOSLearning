//
//  UIImage(GEFile).h
//
//
//  Created by hjp on 16/8/11.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GEFile)


    
/**
 转换为NSData后,写入路径

 @param filePath 路径
 */
- (void)writeToFileByPath:(NSString *)filePath;

/**
 转换为NSData后,写入路径,默认压缩0.8
 
 @param filePath 路径
 */
- (void)writeToFileDefaultCompressByPath:(NSString *)filePath ;
/**
 转换为NSData后,写入路径,压缩quality
 
 @param filePath 路径
 */
- (void)writeToFileByPath:(NSString *)filePath compressQuality:(float)quality;

/**
 转换为NSData后,写入路径,<= 1M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo1MByPath:(NSString *)filePath;

/**
 转换为NSData后,写入路径,<= 4M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo4MByPath:(NSString *)filePath;
/**
 转换为NSData
 */
- (NSData *)convertToData;

/**
 *  压缩图片到指定文件大小
 *  @param size  目标大小（最大值）kb
 *  @return 返回的图片文件
 */
- (NSData *)compressToMaxDataSizeKBytes:(CGFloat)size;

/**
 转换为NSData
 */
- (NSData *)convertToDataCompressQuality:(float)quality;
    
@end
