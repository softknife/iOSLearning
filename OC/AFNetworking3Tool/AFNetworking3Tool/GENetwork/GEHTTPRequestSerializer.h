//
//  GEHTTPRequestSerializer.h
//  ExcellentLearning
//
//  Created by hjp on 16/10/12.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <AFURLRequestSerialization.h>

NS_ASSUME_NONNULL_BEGIN
@class GEHTTPRequest;
@interface GEHTTPRequestSerializer : AFHTTPRequestSerializer

/** 请求*/
@property (nonatomic , weak) GEHTTPRequest *GERequest;

// 构建加密参数
- (NSDictionary *)constructPostRequestParameterEncry;

+ (nullable NSURL *)configRequestURL:(NSString * _Nullable )path  error:(NSError *__autoreleasing *)error;

/*
 * 检查请求序列化是否存在
 */
+ (BOOL)checkHasRequestSerializer:(id)serializer
                          failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;
@end
NS_ASSUME_NONNULL_END
