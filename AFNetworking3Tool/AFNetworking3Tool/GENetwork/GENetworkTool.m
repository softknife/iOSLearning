
//
//  GENetworkTool.m
//  ExcellentLearning
//
//  Created by hjp on 16/7/12.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GENetworkTool.h"

#import <AFHTTPSessionManager.h>
#import "GEHTTPRequest.h"
#import "GEHTTPRequestSerializer.h"
#import "GEHTTPResonseSerializer.h"
#import "GEHTTPConst.h"
#import "GELogger.h"


//      请求头&请求体格式:
//      客户端发送内容构造
//      假设接受文件的网页程序位于 http://192.168.29.65/upload_file/UploadFile.
//      假设我们要发送一个二进制文件、一个文本框表单项、一个密码框表单项。文件名为 E:\s ，其内容如下：（其中的XXX代表二进制数据，如 01 02 03）
//      a
//      bb
//      XXX
//      ccc
//      客户端应该向 192.168.29.65 发送如下内容：


//      POST /upload_file/UploadFile HTTP/1.1
//      Accept: text/plain, */*
//      Accept-Language: zh-cn
//      Host: 192.168.29.65:80
//      Content-Type:multipart/form-data;boundary=---------------------------7d33a816d302b6
//      User-Agent: Mozilla/4.0 (compatible; OpenOffice.org)
//      Content-Length: 424
//      Connection: Keep-Alive
//      -----------------------------7d33a816d302b6
//      Content-Disposition: form-data; name="userfile1"; filename="E:\s"
//      Content-Type: application/octet-stream
//      a
//      bb
//      XXX
//      ccc
//      -----------------------------7d33a816d302b6
//      Content-Disposition: form-data; name="text1"
//      今天马上下班
//      -----------------------------7d33a816d302b6
//      Content-Disposition: form-data; name="password1"
//      bar
//      -----------------------------7d33a816d302b6--
//      此内容必须一字不差，包括最后的回车。



/** 并发度*/
NSInteger const GENetworkToolRequestConcurrencyValue = 2;

// 获得资源的mimeType
FOUNDATION_STATIC_INLINE NSString *GEContentTypeForPathExtension(NSString *extension) {
    
    NSString *UTI = (__bridge_transfer NSString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)extension, NULL);
    NSString *contentType = (__bridge_transfer NSString *)UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType);
    if (!contentType) {
        return @"application/octet-stream";
    } else {
        return contentType;
    }
}

static dispatch_queue_t url_serializer_manager_creation_queue() {
    static dispatch_queue_t GE_url_session_manager_creation_queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        GE_url_session_manager_creation_queue = dispatch_queue_create(GEURLResponseSerializationErrorDomain.UTF8String, DISPATCH_QUEUE_SERIAL);
    });
    
    return GE_url_session_manager_creation_queue;
}

static void GE_url_manager_create_serializer_safely(dispatch_block_t block) {
    
    dispatch_sync(url_serializer_manager_creation_queue(), block);
}

static GENetworkTool *networkInstance_;


@interface GENetworkTool ()

/** json请求*/
@property (nonatomic , strong) AFHTTPSessionManager *manager;


@end
@implementation GENetworkTool


#pragma mark - Init

+ (GENetworkTool *)shareSession
{

    GENetworkTool *networkTool = [[self alloc] init];
    
    if (!networkTool.manager) {
        
        // 确定是http请求还是https请求
        NSString *GEURLProtocol = httpOrHttps();
        
        NSString *baseUrlString = [NSString stringWithFormat:@"%@://%@%@", GEURLProtocol, GE_server_path(GEServerPathMobile), GE_server_subpath()];
        NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
        
        networkTool.manager = //[AFHTTPSessionManager manager];
        [[AFHTTPSessionManager alloc] initWithBaseURL:baseUrl];
       
        
        networkTool.manager.operationQueue.maxConcurrentOperationCount = GENetworkToolRequestConcurrencyValue;

        dispatch_queue_t complecationQueue = dispatch_queue_create("GENetworkManager-complecationQueue", DISPATCH_QUEUE_CONCURRENT);
        
        networkTool.manager.completionQueue = complecationQueue;
        networkTool.manager.responseSerializer = [GEHTTPResonseSerializer serializer];
        
        
//        // 安全传输设置---->自签名证书使用,可以双向认证!如果使用认证的证书,那么只需要单向认证,本地不需要导入证书
//        NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"https" ofType:@"cer"];
//        NSData * certData =[NSData dataWithContentsOfFile:cerPath];
//        NSSet * certSet = [[NSSet alloc] initWithObjects:certData, nil];
//        AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//        // 是否允许,NO-- 不允许无效的证书
//        securityPolicy.allowInvalidCertificates = YES;
//        // 设置证书
//        [securityPolicy setPinnedCertificates:certSet];
//        networkTool.manager.securityPolicy = securityPolicy;
        
        
    }
    
    return networkTool;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkInstance_ = [super allocWithZone:zone];

    });
    return networkInstance_;
}
#pragma mark - AFHTTPSessionManager 方法重载
+ (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                         baseURL:(NSURL *) baseURL
                                      parameters:(id)parameters
                                      serializer:(GEHTTPRequestSerializer *)serializer
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSError *serializationError = nil;
    
    NSURL *relativeURL = baseURL?:[self shareSession].manager.baseURL;
    
    GEHTTPLogDebug(@"request【%@】-begin", [[NSURL URLWithString:URLString relativeToURL:relativeURL] absoluteString]);
    
    NSMutableURLRequest *request = [serializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:relativeURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (failure) {
            dispatch_async([self shareSession].manager.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
        }
        
        return nil;
    }
    
    __block NSURLSessionDataTask *dataTask = nil;
    dataTask = [[self shareSession].manager dataTaskWithRequest:request
                          uploadProgress:uploadProgress
                        downloadProgress:downloadProgress
                       completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
                           if (error) {
                               if (failure) {
                                   failure(dataTask, error);
                               }
                               
                               GEHTTPLogDebug(@"request:[%@],error:[%@]",[[NSURL URLWithString:URLString relativeToURL:relativeURL] absoluteString],error.localizedDescription);

                           } else {
                               if (success) {
                                   success(dataTask, responseObject);
                               }
                               
                               GEHTTPLogDebug(@"request:[%@],success:[%@]",[[NSURL URLWithString:URLString relativeToURL:relativeURL] absoluteString],responseObject);

                           }
                       }];
    
    return dataTask;
}

+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    serializer:(GEHTTPRequestSerializer *)serializer
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [serializer multipartFormRequestWithMethod:@"POST" URLString:[[NSURL URLWithString:URLString relativeToURL:[self shareSession].manager.baseURL] absoluteString] parameters:parameters constructingBodyWithBlock:block error:&serializationError];
    if (serializationError) {
        if (failure) {
            dispatch_async([self shareSession].manager.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
        }
        
        return nil;
    }
    
    __block NSURLSessionDataTask *task = [[self shareSession].manager uploadTaskWithStreamedRequest:request progress:uploadProgress completionHandler:^(NSURLResponse * __unused response, id responseObject, NSError *error) {
        if (error) {
            if (failure) {
                failure(task, error);
            }
        } else {
            if (success) {
                success(task, responseObject);
            }
        }
    }];
    [task resume];
    
    return task;
}

#pragma mark - Request

+ (nullable NSURLSessionDataTask *)request:(GEHTTPRequest *)GERequest
                                   success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                   failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSURLSessionDataTask *dataTask = nil;
    
    
    GEHTTPLogDebug(@"GERequest:URL:【%@】,Parameter:【%@】,Type:【%zd】",GERequest.URLString,GERequest.params,GERequest.method);
    
    // 检查网络
    NSError *cantReach = [GEHTTPResonseSerializer checkCanReachability];
    if (cantReach) {
        if (failure) {
            failure(nil,cantReach);
        }
        GEHTTPLogDebug(@"GERequest:没有网络");

        return nil;
    };
    
    NSString *urlString = GERequest.URLString;
    NSString *httpMethod = nil;
    long value = GERequest.isSync?0:GENetworkToolRequestConcurrencyValue;
    
    __block NSDictionary *requestParameter = nil;
    __block GEHTTPRequestSerializer *serializer = nil;
   
    GE_url_manager_create_serializer_safely(^{
      
        serializer = [self constructRequestSerializer:GERequest];
        
        // 加密
        requestParameter =  [serializer constructPostRequestParameterEncry];

    });
    
    BOOL hasSerializer = [GEHTTPRequestSerializer checkHasRequestSerializer:serializer failure:failure];
    
    // 判断是否创建解析器成功
    if (hasSerializer == NO) {
        return nil;
    }
    
    
    
    switch (GERequest.method) {
        case GERequestMethodGET:
        {
            httpMethod = @"GET";
        }
            break;
        case GERequestMethodPOST:
        {
            
            httpMethod = @"POST";
        }
            break;
        default:
            break;
    }

    
    dataTask = [self dataTaskWithHTTPMethod:httpMethod URLString:urlString  baseURLString:GERequest.baseUrlString parameters:requestParameter semaphoreValue:value serializer:serializer success:success failure:failure];
   
    return dataTask;
}

+ (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                   baseURLString:(NSString *)baseURLString
                                      parameters:(id)parameters
                                  semaphoreValue:(long)value
                                      serializer:(GEHTTPRequestSerializer *)serializer
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{

    dispatch_semaphore_t semaphore = dispatch_semaphore_create(value);
    
    NSURL *baseURL = nil;
    if (baseURLString.length) {
        baseURL = [NSURL URLWithString:baseURLString];
    }
    
  

    
    NSURLSessionDataTask *dataTask = [self dataTaskWithHTTPMethod:method URLString:URLString baseURL:baseURL  parameters:parameters serializer:serializer uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
        

        [GEHTTPResonseSerializer parseResponse:responseObject task:task success:success failure:failure];
        
        dispatch_semaphore_signal(semaphore);
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        

        if (failure) {
            failure(task,error);
        }
        
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    [dataTask resume];

     dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    return dataTask;
}






#pragma mark - POST-Upload

+ (nullable NSURLSessionDataTask *)upload:(GEHTTPRequest *)GERequest
                                 progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                  success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    // 检测网络
    NSError *cantReach = [GEHTTPResonseSerializer checkCanReachability];
    if (cantReach) {
        if (failure) {
            failure(nil,cantReach);
        }
        GEHTTPLogDebug(@"POST-Upload:没有网络");

        return nil;
    };
    
    NSAssert(GERequest.method == GERequestMethodPOST, @"上传请求不是POST请求!");
    
    long value = GERequest.isSync?0:GENetworkToolRequestConcurrencyValue;
    
    GEHTTPLogDebug(@"POST-Upload:URL:【%@】,Parameter:【%@】",GERequest.URLString,GERequest.params);

    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(value); // 同步请求线程阻塞


    __block GEHTTPRequestSerializer *serializer = nil;
    __block NSDictionary *requestPara = nil;
    GE_url_manager_create_serializer_safely(^{
        
        serializer = [self constructRequestSerializer:GERequest];
        // 加密参数
        requestPara = [serializer constructPostRequestParameterEncry];
    });
    
    BOOL hasSerializer = [GEHTTPRequestSerializer checkHasRequestSerializer:serializer failure:failure];
    
    if (hasSerializer == NO) {
        return nil;
    }

    NSURLSessionDataTask *dataTask =  [self POST:GERequest.URLString serializer:serializer parameters:requestPara constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {


        NSError *error = nil;
        NSURL *fileURL = [GEHTTPRequestSerializer configRequestURL:GERequest.upload.fileLocalPath error:&error];
        
        if (error) {
            return ;
        }
        
        NSString *fileName = GERequest.upload.fileName;
        if (fileName.length == 0) {
            fileName = [fileURL lastPathComponent];
        }
        
        NSString *mimeType = GERequest.upload.mimeType;
        if(mimeType.length == 0){
            mimeType = GEContentTypeForPathExtension([fileURL pathExtension]);
        }
        
        NSString *name = GERequest.upload.name;
        if (name.length == 0) {
            name = @"file";
        }
        
        
        [formData appendPartWithFileURL:fileURL name:name fileName:fileName mimeType:mimeType error:&error];
//        if (error && failure) {
//            failure(nil,error);
//        }
        
    } progress:uploadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

        //        if (success) {
//            success(task,responseObject);
//        }
        
        [GEHTTPResonseSerializer parseResponse:responseObject task:task success:success failure:failure];


        dispatch_semaphore_signal(semaphore);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        

        if (failure) {
            failure(task,error);
        }
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    return dataTask;
}

#pragma mark - Download
+ (nullable NSURLSessionDownloadTask *)download:(GEHTTPRequest *)GERequest
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgressBlock
                     completionHandler:(nullable void (^)(NSURLResponse *_Nullable response, NSURL * _Nullable filePath, NSError * _Nullable error))completionHandler
{
    
    NSAssert(GERequest.method == GERequestMethodGET, @"下载请求不是GET请求");
    
    // 检测网络
    NSError *cantReach = [GEHTTPResonseSerializer checkCanReachability];
    if (cantReach) {
        if (completionHandler) {
            completionHandler(nil,nil,cantReach);
        }
        
        GEHTTPLogDebug(@"POST-Upload:没有网络");

        return nil;
    };
    
    NSError *downloadError = nil;
    // 校验下载地址
    NSURL *downloadUrl = [GEHTTPRequestSerializer configRequestURL:GERequest.URLString error:&downloadError];
    
    if (downloadError) { // 校验error
        
        if (completionHandler) {
            completionHandler(nil,nil,downloadError);
        }
        
        GEHTTPLogDebug(@"POST-download:downloadUrl[%@]",downloadUrl);

        return nil;
    }
    
    // 校验转移地址
    NSError *destinationError = nil;
    NSURL *destinationUrl = [GEHTTPRequestSerializer configRequestURL:GERequest.downloadFilePath error:&destinationError];
    if (destinationError) {
        
        if (completionHandler) {
            completionHandler(nil,nil,destinationError);
        }
        
        GEHTTPLogDebug(@"POST-download:destinationUrl[%@]",destinationUrl);

        return nil;
    }
    
    long value = GERequest.isSync?0:GENetworkToolRequestConcurrencyValue;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(value);

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:downloadUrl];
    
    GEHTTPLogDebug(@"Download:URL:【%@】,Parameter:【%@】",GERequest.URLString,GERequest.params);

    NSURLSessionDownloadTask *dataTask =  [[self shareSession].manager downloadTaskWithRequest:request progress:downloadProgressBlock destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return destinationUrl;
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        
        if (completionHandler) {
            completionHandler(response,filePath,error);
        }
        dispatch_semaphore_signal(semaphore);
        
    }];
    
    [dataTask resume];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    return dataTask;
    
}



#pragma mark - GEHTTPRequestSerializer keep in

// 构建独立的requestSerializer
+ (GEHTTPRequestSerializer *)constructRequestSerializer:(GEHTTPRequest *)GERequest
{
    if (GERequest.URLString.length == 0) {
        return nil;
    }
   
    GEHTTPRequestSerializer * rqSerializer = [[GEHTTPRequestSerializer alloc] init];
    rqSerializer.GERequest = GERequest;
    return rqSerializer;
}




#pragma mark - Cancel Operation
+ (void)cancelAllOperations
{
    [[self shareSession].manager.operationQueue cancelAllOperations];
    [[self shareSession].manager invalidateSessionCancelingTasks:YES];
    [self shareSession].manager = nil;
    [self shareSession];
}





@end
