//
//  GEHTTPResonseSerializer.m
//  ExcellentLearning
//
//  Created by 黄继平 on 2016/10/13.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEHTTPResonseSerializer.h"
#import "GEHTTPConst.h"

#import <Reachability.h>
#import "GEHTTPErrorParser.h"
#import "GELogger.h"


@implementation GEHTTPResonseSerializer


#pragma mark - Override 

#pragma mark initial
+ (instancetype)serializer
{
    
    GEHTTPResonseSerializer *serializer = [super serializer];
    
    serializer.acceptableContentTypes = [NSSet setWithObjects:
                                                                     @"application/json",
                                                                     //                                                              @"application/json; charset=UTF-8",
                                                                     //                                                              @"application/json;charset=utf-8",
                                                                     //                                                              @"application/json; charset=utf-8",
                                                                     @"text/json",
                                                                     @"text/javascript",
                                                                     @"text/html",
                                                                     @"text/xml",
                                                                     @"image/jpeg",
                                                                     @"image/png",
                                                                     @"application/octet-stream", nil];
    
    return serializer;
    
}

#pragma mark parse
- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing  _Nullable *)error
{
    
    NSHTTPURLResponse *realResponse = (NSHTTPURLResponse *)response;

    NSDictionary *headers = realResponse.allHeaderFields;

    if ([headers[@"Content-Type"] isEqualToString:@"text/html"]) {

        NSString *string = [[NSString alloc] initWithData:data encoding:(NSUTF8StringEncoding)];

        GEHTTPLogDebug(@"dataString = %@",string);

        // 特殊处理QQ OpenAPI接口返回数据
        if ([string hasPrefix:@"callback("]) {

           NSRange range = [string rangeOfString:@"{"];
           NSRange range2 = [string rangeOfString:@"}"];

            string = [string substringWithRange:NSMakeRange(range.location, range2.location -range.location +1)];
            data = [string dataUsingEncoding:NSUTF8StringEncoding];

        }

    }
    
    
    return [super responseObjectForResponse:response data:data error:error];
}




#pragma mark - 解析错误码
+ (void)parseResponse:(id)response
                 task:(NSURLSessionDataTask *)task
              success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
              failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSError *responseError = nil;
    
   
    id errorcode = response[GEResponseErrorCode];
    
    if (errorcode && [response isKindOfClass:[NSDictionary class]]) { // 标准JSON结果
        
        NSInteger errCode = [errorcode integerValue];
        
        // 解析账号异常,不能继续工作的异常错误码
//        [serverLayer() didRKCloudFatalException:(int)errCode];

        // 成功
        if (errCode == 0) {
            
            NSDictionary *responseDict = (NSDictionary *)response;
            
            GEHTTPLogDebug(@"GENetworkTool-responseDict【%@】",[responseDict description]);
            
            NSMutableDictionary *values = nil;
            
            if (responseDict.allKeys.count) { // 成功
            
                values = [NSMutableDictionary dictionaryWithCapacity:responseDict.allKeys.count -2];
                for (NSString *key in responseDict.allKeys) {
                    if (![key isEqualToString:GEResponseErrorCode] && ![key isEqualToString:GEResponseErrorMessage]) {
                        values[key] = responseDict[key];
                    }
                }
                
            }
            
            
            if (success) {
                success(task,values);
            }
            
            
        }else{ // 失败
            
            NSString *errorMessage = [GEHTTPErrorParser parseResponseErrorCode:errCode];
            
            GEHTTPLogDebug(@"GENetworkTool-response-errorMessage【%@】",errorMessage);

            
            NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: errorMessage};
            
            responseError = [[NSError alloc] initWithDomain:GEURLResponseSerializationErrorDomain code:errCode userInfo:userInfo];
            
            if (failure) {
                failure(task,responseError);
            }
            
        }
        
    }else{ // 非标准
        
        GEHTTPLogDebug(@"GENetworkTool-Response-not standard json【%@】",response);
        
        if (success) {
            success(task,response);
        }
    }
    
    
}


/**
 检查网络
 */
+ (nullable NSError *)checkCanReachability
{
    Reachability *reacher = [Reachability reachabilityForInternetConnection];
    [reacher startNotifier];
    BOOL result = [reacher currentReachabilityStatus] != NotReachable;
    [reacher stopNotifier];
    
    NSError *responseError = nil;
    if (result == NO) {
        NSString *errorMsg = [GEHTTPErrorParser parseResponseErrorCode:GEResponseErrorCantReachability];
        NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: errorMsg};
        GEHTTPLogDebug(@"GENetworkTool-checkReachability-errorMessage【%@】",errorMsg);
        responseError = [[NSError alloc] initWithDomain:GEURLResponseSerializationErrorDomain code:GEResponseErrorCantReachability userInfo:userInfo];

    }
    
    
    return responseError;
}

@end
