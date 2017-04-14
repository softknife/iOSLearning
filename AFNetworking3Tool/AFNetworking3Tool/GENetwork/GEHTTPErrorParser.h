//
//  GEHTTPErrorParser.h
//  ExcellentLearning
//
//  Created by hjp on 16/10/31.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 错误码

typedef NS_ENUM(NSInteger,GEResponseError)
{
    /// 服务器端Api返回的基本错误码值
    
    /// 没网
    GEResponseErrorCantReachability        = -1,
    /// URLString无效
    GEResponseErrorURLStringInvalid        = -2,
    /// 服务器返回结果异常
    GEResponseErrorServerDataIsNil         = -3,
    
    
    
    
#pragma mark - Error Code 0
    
    /// 成功
    GEResponseErrorSuccess                 = 0,
    
    
    GEConnectionFailureErrorType            =   1,
    GERequestTimedOutErrorType              =   2,
    GEAuthenticationErrorType               =   3,
    GERequestCancelledErrorType             =   4,
    GEUnableToCreateRequestErrorType        =   5,
    GEInternalErrorWhileBuildingRequestType  =  6,
    GEInternalErrorWhileApplyingCredentialsType  = 7,
    GEFileManagementError                   =       8,
    GETooMuchRedirectionErrorType           =       9,
    GEUnhandledExceptionError               =     10,
    GECompressionError                      =   11,
    
#pragma mark - Error Code 6001-6004
    
    /// 系统错误
    GEResponseErrorSystemError             = 6001,
    /** 参数错误*/
    GEResponseErrorParamsError             = 6002,
    /** session错误*/
    GEResponseErrorSessionError            = 6003,
    /** 上传文件到fastdfs失败*/
    GEResponseErrorUploadError             = 6004,
    /** 文件太大*/
    GEResponseErrorFileBeyondLimit         = 6005,
    /** 文件不存在*/
    GEResponseErrorFileNotExist            = 6006,
    /** 身份证号错误*/
    GEResponseErrorUserIDCARDError         = 6007,
    


};


//


@interface GEHTTPErrorParser : NSObject

//// 解析服务器服务器API返回值为多语言提示的字符串
+ (NSString *)parseResponseErrorCode:(GEResponseError)errorCode;


@end
