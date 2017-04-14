//
//  GEHTTPConst.h
//  ExcellentLearning
//
//  Created by hjp on 16/9/8.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 访问API返回的错误码字段-errcode*/
FOUNDATION_EXTERN NSString *const GEResponseErrorCode;
/** 访问API返回的错误描述-errmsg*/
FOUNDATION_EXTERN NSString *const GEResponseErrorMessage;

/** https*/
FOUNDATION_EXTERN NSString *const GEURLHttps;

/** http*/
FOUNDATION_EXTERN NSString *const GEURLHttp;

/** GENetworkDomain*/
FOUNDATION_EXTERN NSString *const GEURLResponseSerializationErrorDomain;

FOUNDATION_EXTERN NSString* const GENetworkRequestErrorDomain;

/** 图片*/
FOUNDATION_EXTERN NSString *const GEUploaderContentDispositionNameTypeImage;
/** 文件*/
FOUNDATION_EXTERN NSString *const GEUploaderContentDispositionNameTypeFile;

/** 语音*/
FOUNDATION_EXTERN NSString *const GEUploaderContentDispositionNameTypeVoice;





 typedef NS_ENUM(NSInteger,GEServerType) {
 
     /// 内网
     GEServerType_LAN_SERVER                  = 0,
     

     /// 线下测试
     GEServerType_WLAN_SERVER_1               = 7,
     
     /// 线上2.0
     GEServerType_ONLINE_SERVER_2_0           = 8,
     
     /// 线下测试https
     GEServerType_WLAN_SERVER_HTTPS           = 9,
     
     /// 线上https
     GEServerType_ONLINE_SERVER_HTTPS         = 10,
 };

typedef NS_ENUM(NSInteger,GEServerPath) {
    /// 移动端服务器地址
    GEServerPathMobile      = 0,
    /// BS服务器地址
    GEServerPathBrowser     = 1,
    /// 融科服务器地址
    GEServerPathVendor      = 2,
    
};

typedef NS_ENUM(NSInteger,GEServerPort) {
    /// 移动端服务器端口
    GEServerPortMobile      = 0,
    /// 融科服务器端口
    GEServerPortVendor      = 1,
};




/** 设置网络环境*/

static const GEServerType serverType = GEServerType_WLAN_SERVER_HTTPS;  //线下

//static const GEServerType serverType = GEServerType_ONLINE_SERVER_HTTPS;  //线上https


/**

 */

FOUNDATION_STATIC_INLINE NSString *GE_server_path(GEServerPath path){
 
     NSString *serverPath = nil;
     
     switch (serverType) {
         case GEServerType_LAN_SERVER:  /// 内网
         {
             switch (path) {
                 case GEServerPathMobile:
                 {
                     serverPath =  @"xxxx:8080";// 内网API入口地址
                 }
                     break;
                 case GEServerPathBrowser:
                 {
                     serverPath = @"yyyy.35";// 扫描登录API入口地址
                     
                 }
                     break;
                 case GEServerPathVendor:
                 {
                     serverPath = @"zzzzzz.18";// 内网聊天组件Root服务器地址
                 }
                     break;
                 default:
                     break;
             }

         }
             break;
         case GEServerType_ONLINE_SERVER_2_0:
         case GEServerType_ONLINE_SERVER_HTTPS:
         {
             
             switch (path) {
                 case GEServerPathMobile:// 公网API入口地址
                 case GEServerPathVendor:// 真实环境测试聊天组件Root服务器地址

                 {
                     serverPath = @"xxxx.net";
                 }
                     break;
                 
                 case GEServerPathBrowser:
                 {
                     serverPath = @"xxxx.net";// 真实环境扫描登录API入口地址
                     
                 }
                     break;
                 
                 default:
                     break;
             }
             
         }
             break;
             
        
             
         
         case GEServerType_WLAN_SERVER_1:
         {
             switch (path) {
                 case GEServerPathMobile:
                 {
                     serverPath = @"180xxxxxx080";// 公网API入口地址
                 }
                     break;
                 case GEServerPathBrowser:
                 {
                     serverPath = @"1xxxx35";// 扫描登录API入口地址
                     
                 }
                     break;
                 case GEServerPathVendor:
                 {
                     serverPath =   @"xxx";// 公网聊天组件Root服务器地址
                 }
                     break;
                 default:
                     break;
             }
             
         }
             break;
         case GEServerType_WLAN_SERVER_HTTPS:
         {
             switch (path) {
                     
                 /// 公网聊天组件Root服务器地址
                 /// 公网API入口地址
                 case GEServerPathVendor:
                 case GEServerPathMobile:
                 {
                     serverPath = @"xxxxt.cn";
                 }
                     break;
                 case GEServerPathBrowser:
                 {
                     serverPath = @"xxxx";// 扫描登录API入口地址
                     
                 }
                     break;
             
                 default:
                     break;
             }
             
         }
             break;
       
             
         default:
             break;
     }
 
     return serverPath;
}




/**
 获得恒谦api地址subpath
  内网/外网/线上...
 */
FOUNDATION_STATIC_INLINE NSString *GE_server_subpath(){
    
    NSString *subPath = nil;
    
    switch (serverType) {
        case GEServerType_LAN_SERVER:
        {
            subPath = @"";
        }
            break;
        case GEServerType_WLAN_SERVER_HTTPS:
        {
            subPath = @"/GE/2.0/";
        }
            break;
      

        case GEServerType_WLAN_SERVER_1:
        {
            subPath = @"/2.0/";
            
        }
            break;
        case GEServerType_ONLINE_SERVER_2_0:
        case GEServerType_ONLINE_SERVER_HTTPS:

        {
            subPath = @"/GE/2.0/";
            
        }
            break;
      
        default:
            break;
    }
    
    return subPath;
}


FOUNDATION_STATIC_INLINE NSString *httpOrHttps(){
    
    
    // 确定是http请求还是https请求
    NSString *GEURLProtocol = GEURLHttp;
    
    switch (serverType) {
        case GEServerType_WLAN_SERVER_HTTPS:
        case GEServerType_ONLINE_SERVER_HTTPS:
        {
            GEURLProtocol = GEURLHttps;

        }
            break;
            
        default:
            break;
    }
    
    return GEURLProtocol;
    
}

FOUNDATION_STATIC_INLINE NSString * GE_APNs_certificate_name(){

    // 发布版本证书名称
    NSString *strAPNsCerName = @"pro_xxx";
#ifdef DEBUG
    // 开发版本证书名称
    strAPNsCerName = @"dev_xxxxxx";
#endif
    
    return strAPNsCerName;
}



