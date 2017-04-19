//
//  UIImage(GEResize) .m
//
//
//  Created by hjp on 16/8/11.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIImage+GEFile.h"

@implementation UIImage (GEFile)


    
- (void)writeToFileByPath:(NSString *)filePath
{
    [self writeToFileByPath:filePath compressQuality:1.0];

}

/**
 转换为NSData后,写入路径,默认压缩0.8
 
 @param filePath 路径
 */
- (void)writeToFileDefaultCompressByPath:(NSString *)filePath
{
    [self writeToFileByPath:filePath compressQuality:0.8];
}


/**
 转换为NSData后,写入路径,压缩quality
 
 @param filePath 路径
 */
- (void)writeToFileByPath:(NSString *)filePath compressQuality:(float)quality
{
    if (filePath.length == 0) {
        @throw [NSException exceptionWithName:@"error" reason:@"图片写入路径为空" userInfo:nil];
        
        return;
    }
    // 转换JPEG图片进行质量的压缩
    NSData * imageData = [self convertToDataCompressQuality:quality];
    
    [imageData writeToFile:filePath atomically:YES];
}


/**
 转换为NSData后,写入路径,<= 1M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo1MByPath:(NSString *)filePath
{
    NSData *data = [self compressToMaxDataSizeKBytes:1000];
    
    [data writeToFile:filePath atomically:YES];
}

/**
 转换为NSData后,写入路径,<= 4M
 
 @param filePath 路径
 */
- (void)writeToFileLimitTo4MByPath:(NSString *)filePath
{
    NSData *data = [self compressToMaxDataSizeKBytes:4000];
    
    [data writeToFile:filePath atomically:YES];
}

/**
 转换为NSData
 */
- (NSData *)convertToData
{
    // 转换JPEG图片进行质量的压缩
    NSData * imageData = [self convertToDataCompressQuality:1.0];
    
    return imageData;
}


/**
 *  压缩图片到指定文件大小
 *
 *  @param size  目标大小（最大值）
 *
 *  @return 返回的图片文件
 */
- (NSData *)compressToMaxDataSizeKBytes:(CGFloat)size{

    NSData * data = [self convertToData];
    CGFloat dataKBytes = data.length/1000.0;
    CGFloat maxQuality = 0.9f;
    CGFloat lastData = dataKBytes;
    while (dataKBytes > size && maxQuality > 0.01f) {
        maxQuality -= 0.01f;
        data = UIImageJPEGRepresentation(self, maxQuality);
        dataKBytes = data.length / 1000.0;
        if (lastData == dataKBytes) {
            break;
        }else{
            lastData = dataKBytes;
        }
    }
    return data;
}



/**
 转换为NSData
 */
- (NSData *)convertToDataCompressQuality:(float)quality
{
    // 转换JPEG图片进行质量的压缩
    NSData * imageData = UIImageJPEGRepresentation(self, quality);
    
    return imageData;
}



@end
