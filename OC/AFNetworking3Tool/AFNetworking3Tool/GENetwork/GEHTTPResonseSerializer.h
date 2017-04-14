//
//  GEHTTPResonseSerializer.h
//  ExcellentLearning
//
//  Created by 黄继平 on 2016/10/13.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <AFURLResponseSerialization.h>

NS_ASSUME_NONNULL_BEGIN


FOUNDATION_EXTERN NSString *const GEURLResponseSerializationErrorDomain;



@interface GEHTTPResonseSerializer : AFJSONResponseSerializer

/**
 解析返回结果
 */
+ (void)parseResponse:(id)response
                 task:(NSURLSessionDataTask *)task
              success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
              failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

/**
 检查网络
 */
+ (nullable NSError *)checkCanReachability;


@end

NS_ASSUME_NONNULL_END
