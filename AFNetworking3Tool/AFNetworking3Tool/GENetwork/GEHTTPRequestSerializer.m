//
//  GEHTTPRequestSerializer.m
//  ExcellentLearning
//
//  Created by hjp on 16/10/12.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEHTTPRequestSerializer.h"
#import "GEDataCompressor.h"
#import "GEHTTPErrorParser.h"
#import "GEHTTPConst.h"
#import "GEHTTPRequest.h"
#import "RSA.h"

@implementation GEHTTPRequestSerializer

- (void)setGERequest:(GEHTTPRequest *)GERequest
{
    _GERequest = GERequest;
    
    NSTimeInterval timeoutInterval = GERequest.timeoutInterval;
    BOOL shouldCompressRequestBody = GERequest.shouldCompressRequestBody;
    BOOL allowsCellularAccess = GERequest.allowsCellularAccess;
    
    // 压缩
    if (shouldCompressRequestBody) {
        
        // NSURLSession中默认支持压缩/解压,不需要再单独的压缩解压
        [self setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
        [self setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
        
    }
    
    
    // 超时
    self.timeoutInterval = timeoutInterval;
    self.allowsCellularAccess = allowsCellularAccess;
    
    
}

// 构建加密参数
- (NSDictionary *)constructPostRequestParameterEncry
{
    NSDictionary *dictParams = self.GERequest.params;
    if (dictParams == nil || [dictParams count] <= 0) {
        return nil;
    }
    
    NSMutableDictionary *mutableParaDict = [NSMutableDictionary new];
    
    
    BOOL shouldEncrypt = self.GERequest.shouldEncryptRequest && self.GERequest.encryKey.length;
    
    
    // 解析参数并添加到请求中
    if (shouldEncrypt)
    {
        
        [self setValue:@"true" forHTTPHeaderField:@"Content-encrypt"];
        
        // 循环取出Key和Value
        NSArray *arrayParamKey = [dictParams allKeys];
        for (int i = 0; i < [arrayParamKey count]; i++)
        {
            // 得到每行的key和value并保存到字典中
            NSString * paramKey = [arrayParamKey objectAtIndex:i];
            
            
            if (paramKey)
            {
                NSString * paramValue = [dictParams objectForKey:paramKey];
                
                if (paramValue) {
                    
                    //RSA加密
                    if (shouldEncrypt) {
                        NSString * encryptParamKey =[RSA encryptString:paramKey publicKey:self.GERequest.encryKey];
                        
                        NSString * encryptParamValue =[RSA encryptString:paramValue publicKey:self.GERequest.encryKey];
                        
                        //出现加密后，字段丢失的情况时
                        if (encryptParamKey.length == 0 || encryptParamValue == nil) {
                            
                            self.GERequest.shouldEncryptRequest = NO;
                            
                            return  [self constructPostRequestParameterEncry];
                        }
                        
                        // 赋值请求的参数 加密
                        [mutableParaDict setValue:encryptParamValue forKey:encryptParamKey];
                    }
                    
                }
            }
        }
    }else{
        
       // [self setValue:@"false" forHTTPHeaderField:@"Content-encrypt"];
        
        mutableParaDict = [self.GERequest.params mutableCopy];
    }
    
    
    
    return mutableParaDict;
}

- (NSMutableURLRequest *)multipartFormRequestWithMethod:(NSString *)method URLString:(NSString *)URLString parameters:(NSDictionary<NSString *,id> *)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> _Nonnull))block error:(NSError *__autoreleasing  _Nullable *)error
{
    NSMutableURLRequest *request = [super multipartFormRequestWithMethod:method URLString:URLString parameters:parameters constructingBodyWithBlock:block error:error];
    
    if (self.GERequest.shouldCompressRequestBody) {
       
        NSInputStream *inputStream = request.HTTPBodyStream;
        
        [inputStream open];
        
        NSUInteger bytesRead;
        
        NSMutableData *rawData = [NSMutableData data];
        
        while ([inputStream hasBytesAvailable]) {
            
            unsigned char buffer[1024*256];
            bytesRead = [inputStream read:buffer maxLength:sizeof(buffer)];
            
            if (bytesRead == 0) {
                break;
            }
            
            NSData *partData = [NSData dataWithBytes:buffer length:bytesRead];
            [rawData appendData:partData];
        }
        
        [inputStream close];
        
        
        NSData *compressData = [GEDataCompressor compressData:rawData error:error];
        
        request.HTTPBodyStream = [NSInputStream inputStreamWithData:compressData];
    }
    
    
    return request;
}


+ (nullable NSURL *)configRequestURL:(NSString * _Nullable )path error:(NSError *__autoreleasing *)error
{
    NSURL *url = nil;
    if (path.length == 0 ) {
        
        NSString *errorMsg = [GEHTTPErrorParser parseResponseErrorCode:GEResponseErrorURLStringInvalid];
        NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: errorMsg};
        NSLog(@"GENetworkTool-checkURL-errorMessage【%@】",errorMsg);
        
        *error = [NSError errorWithDomain:GEURLResponseSerializationErrorDomain code:GEResponseErrorURLStringInvalid userInfo:userInfo];
        return url;
    }
    
    if ([path isKindOfClass:[NSURL class]]) {
        url = (NSURL *)path;
    }else{
       
        url = [path hasPrefix:@"http"]?[NSURL URLWithString:path]:[NSURL fileURLWithPath:path];
    }
    
    if (url == nil) {

        *error = [self creatError:GEResponseErrorURLStringInvalid];
    }
    
    return url;
}

/*
 * 检查请求序列化是否存在
 */
+ (BOOL)checkHasRequestSerializer:(id)serializer
                          failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSError *responseError = nil;
    
    if (serializer == nil) {
    
        responseError = [self creatError:GEResponseErrorURLStringInvalid];
        if (failure) {
            failure(nil,responseError);
        }
    }
    
    return serializer == nil?NO:YES;
}

+ (NSError *)creatError:(NSInteger)code
{
    NSString *errorMsg = [GEHTTPErrorParser parseResponseErrorCode:code];
    NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: errorMsg};
    NSLog(@"GENetworkTool-errorMessage【%@】",errorMsg);
    NSError *responseError = [[NSError alloc] initWithDomain:GEURLResponseSerializationErrorDomain code:code userInfo:userInfo];
    
    return responseError;
}
@end
