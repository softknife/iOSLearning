//
//  GEHTTPConst.m
//  ExcellentLearning
//
//  Created by hjp on 16/9/13.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 访问API返回的错误码字段*/
NSString *const GEResponseErrorCode = @"errcode";
/** 访问API返回的错误描述*/
NSString *const GEResponseErrorMessage = @"errmsg";

/** https*/
NSString *const GEURLHttps = @"https";

/** http*/
NSString *const GEURLHttp = @"http";

/** GENetworkDomain*/
NSString *const GEURLResponseSerializationErrorDomain = @"com.gloria.eric.response.serializer.error.domain";

NSString* const GENetworkRequestErrorDomain = @"com.gloria.eric.request.error.domain";


/** 图片*/
NSString *const GEUploaderContentDispositionNameTypeImage = @"image";

/** 文件*/
NSString *const GEUploaderContentDispositionNameTypeFile = @"file";

/** 语音*/
NSString *const GEUploaderContentDispositionNameTypeVoice = @"voice";


