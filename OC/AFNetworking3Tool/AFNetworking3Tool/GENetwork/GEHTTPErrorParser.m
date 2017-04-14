//
//  GEHTTPErrorParser.m
//  ExcellentLearning
//
//  Created by hjp on 16/10/31.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEHTTPErrorParser.h"
#import "GEHTTPConst.h"

@implementation GEHTTPErrorParser
//// 解析服务器服务器API返回值为多语言提示的字符串
+ (NSString *)parseResponseErrorCode:(GEResponseError)errorCode {
    NSString* message = nil;
    
    switch (errorCode) {
            // 以下为客户端定义的错误代码
            //        case GE_NO_NETWORK:
            //            message = @"无网络，请检查您的网络连接...";
            //            break;
            //        case GE_ERROR_API_TIMEROUT: // API访问超时
            //        case GE_ERROR_API_WARNING: // API返回值错误(脚本有报错) Notice & Warning
            //            message = @"服务器无响应，请稍候再试";
            //            break;
            //        case GE_ERROR_API_VALUE_NULL: // API返回值为空(请求成功，服务器返回值不正确)
            //            message = @"连接失败，请重试";
            //            break;
            
            // 以下为服务器定义的错误码
            
            // Error Code 0
        case GEResponseErrorCantReachability:
        {
            message = @"没有网络";
            
        }
            break;
            
        case GEResponseErrorURLStringInvalid:
        {
            message = @"URLString无效";
        }
            break;
        case GEResponseErrorServerDataIsNil:
        {
            message = @"服务器返回数据异常";
        }
            break;
        case GEResponseErrorSuccess:
            message = @"成功";
            break;
            
            
            // Error Code 6001-6006
        case GEResponseErrorSystemError: // 系统错误
            message = @"系统繁忙,请稍后再试";
            break;
            
        case GEResponseErrorParamsError:
            message = @"系统繁忙,请稍后再试"; // 参数错误
            break;
            
        case GEResponseErrorSessionError:
            message = @"系统繁忙,请稍后再试"; // session错误
            break;
            
        case GEResponseErrorUploadError:
            message = @"上传文件失败,请稍后再试";
            break;
            
        case GEResponseErrorFileBeyondLimit:
            message = @"文件太大";
            break;
            
        case GEResponseErrorFileNotExist:
            message = @"文件不存在";
            break;
        case GEResponseErrorUserIDCARDError:
            message = @"身份证号错误";
            break;
            
     
        default: // 连接失败，请重试
            message = @"连接失败,请重试";
            break;
    }
    
    return message;
}


@end
