//
//  GEHTTPRequest.m
//  ExcellentLearning
//
//  Created by hjp on 16/9/8.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEHTTPRequest.h"



@implementation GEUploader @end


@implementation GEHTTPRequest
- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        self.params = [[NSMutableDictionary alloc] init];
        self.upload = [[GEUploader alloc] init];
        self.encryKey = nil; //serverLayer().userProfilesInfo.publicKey;
        
        self.allowsCellularAccess = YES;
        self.shouldEncryptRequest = NO; // 加密关掉,使用https请求
        self.method = GERequestMethodPOST;
        self.sync = NO;
    }
    return self;
}
- (NSTimeInterval)timeoutInterval
{
    if (!_timeoutInterval) {
        // 默认的超时时间
        _timeoutInterval = (_upload.fileLocalPath.length || _downloadFilePath.length) ? 120:30;
    }
    
    return _timeoutInterval;
}



@end
