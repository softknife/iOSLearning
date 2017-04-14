//
//  GEHTTPRequest.h
//  ExcellentLearning
//
//  Created by hjp on 16/9/8.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GEHTTPConst.h"


NS_ASSUME_NONNULL_BEGIN




typedef NS_ENUM(NSInteger,GERequestMethod) {
    
    /// POST
    GERequestMethodPOST  = 0,
    /// GET
    GERequestMethodGET  = 1,

};


@interface GEUploader : NSObject
/** fileName
 服务端向客户端游览器发送文件时，如果是浏览器支持的文件类型，一般会默认使用浏览器打开，比如txt、jpg等，会直接在浏览器中显示，如果需要提示用户保存，就要利用Content-Disposition进行一下处理，关键在于一定要加上attachment：
 
 Response.AppendHeader("Content-Disposition","attachment;filename=FileName.txt");
 
 备注：这样浏览器会提示保存还是打开，即使选择打开，也会使用相关联的程序比如记事本打开，而不是IE直接打开了。
 
 Content-Disposition就是当用户想把请求所得的内容存为一个文件的时候提供一个默认的文件名。
 当然filename参数可以包含路径信息，但User-Agnet会忽略掉这些信息，只会把路径信息的最后一部分做为文件名。
 */

@property (nonatomic , copy , nullable) NSString *fileName;
/** name*/
@property (nonatomic , copy , nullable) NSString *name;
/** mimeType*/
@property (nonatomic , copy , nullable) NSString *mimeType;

/** fileLocalPath*/
@property (nonatomic , copy) NSString *fileLocalPath;

@end

@interface GEHTTPRequest : NSObject

/** 请求方法*/
@property (nonatomic , assign) GERequestMethod method;
/** 是否为同步请求*/
@property (nonatomic , assign , getter = isSync) BOOL sync;
/** 请求API的URL地址*/
@property (nonatomic, copy) NSString *URLString;
/** baseUrlString , 如果不填,使用默认值*/
@property (nonatomic , copy , nullable) NSString *baseUrlString;
/** API所需要的参数字典*/
@property (nonatomic, strong , nullable ) NSMutableDictionary *params;
/** 上传文件路径*/
@property (nonatomic, strong , nullable ) GEUploader *upload;
/** 下载到本地的文件路径*/
@property (nonatomic, copy , nullable ) NSString *downloadFilePath;


/** 请求API的超时时间*/
@property (nonatomic, assign) NSTimeInterval timeoutInterval;
/** shouldCompressRequestBody*/
@property (nonatomic , assign) BOOL shouldCompressRequestBody;
/** shouldEncryptRequest*/
@property (nonatomic , assign) BOOL shouldEncryptRequest;
/** EncyKeyString*/
@property (nonatomic , copy , nullable ) NSString *encryKey;

/** 是否允许蜂窝网请求*/
@property (nonatomic , assign) BOOL allowsCellularAccess;

@end

NS_ASSUME_NONNULL_END
