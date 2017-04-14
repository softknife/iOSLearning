//
//  GENetworkTool.h
//  ExcellentLearning
//
//  Created by hjp on 16/7/12.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

/*
 // 上传
 GEHTTPRequest *request = [[GEHTTPRequest alloc] init];
 
 request.requstURLStr = @"uploadHeadimg.do";
 
 [request.params setValue:appDelegate.userProfilesInfo.userSession forKey:MSG_JSON_KEY_SESSION];
 
 
 // 如果上传的是文件则赋值文件路径
 request.upload.fileLocalPath = fileLocalPath;
 
 request.shouldCompressRequestBody = YES;
 request.shouldEncryptRequest = YES;
 
 [GENetworkTool upload:request progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 
    NSString *errDes = [HttpClientKit parseAPIResult:[responseObject[GEAPI_errcode] intValue]];
    NSLog(@"%@",errDes);
 
 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 
 }];
 
 NSLog(@"测试串行");
 
 
 // 一般请求
 GEHTTPRequest *request = [[GEHTTPRequest alloc] init];
 MomentTable *momentTable = [[AppDelegate appDelegate].databaseManager getMomentTableBysmId:momentId];
 
 NSString *timeStr = momentId;
 if (momentTable) {
    timeStr = [NSString stringWithFormat:@"%lld",momentTable.publishTime];
 }
 
 NSString *momentType = @"1";
 if (classId) {
    momentType = @"2";
    [request.params setValue:classId forKey: @"classid"];
    [request.params setValue:timeStr forKey:@"time"];
 }
 else{
    [request.params setValue:timeStr forKey:@"time"];
 }
 [request.params setValue:[AppDelegate appDelegate].userProfilesInfo.userSession forKey:MSG_JSON_KEY_SESSION];//session
 [request.params setValue:momentType forKey:@"mt"];
 
 request.shouldEncryptRequest = YES;
 request.shouldCompressRequestBody = YES;
 request.requstURLStr = @"getMomentList.do";
 
 [GENetworkTool request:request success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 
    if (callBack) {
    callBack(responseObject);
 }
 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 
 }];
 
 */

#import <Foundation/Foundation.h>
#import "GEHTTPRequest.h"
#import "GEHTTPErrorParser.h"

NS_ASSUME_NONNULL_BEGIN

@class GEHTTPRequest;
@interface GENetworkTool: NSObject


#pragma mark - Normal Request
/// POST-NormalRequest
+ (nullable NSURLSessionDataTask *)request:(GEHTTPRequest *)GERequest
                          success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                          failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;


#pragma mark - POST-Upload
/// POST-Upload
+ (nullable NSURLSessionDataTask *)upload:(GEHTTPRequest *)GERequest
                        progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                         success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;




#pragma mark - Download
/// GET-Download
+ (nullable NSURLSessionDownloadTask *)download:(GEHTTPRequest *)GERequest
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                     completionHandler:(nullable void (^)(NSURLResponse *_Nullable response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler;


#pragma mark - Cancel Operation
+ (void)cancelAllOperations;

NS_ASSUME_NONNULL_END

@end

