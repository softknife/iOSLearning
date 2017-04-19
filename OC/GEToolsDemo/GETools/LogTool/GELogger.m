//
//  GELogger.m
//  ExcellentLearning
//
//  Created by yao on 17/3/2.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GELogger.h"

// ===========cocoalumberjack

#import <CocoaLumberjack/DDLog.h>
#import <CocoaLumberjack/DDTTYLogger.h>
#import <CocoaLumberjack/DDASLLogger.h>
#import <CocoaLumberjack/DDFileLogger.h>

// ===========cocoalumberjack


#import "NSBundle+GEVersion.h"
#import "UIDevice+GEExtension.h"

@interface GELogger()<DDLogFormatter>

@end

static int ddLogLevel;

@implementation GELogger

+ (instancetype)sharedInstance
{
    static GELogger *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[GELogger alloc] init];
    });
    return _instance;
}


+ (void)startWithLogLevel:(GELogLevel)logLevel
{
    [[self sharedInstance] setLogLevel:logLevel];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // sends log statements to Xcode console - if available
//        [[DDTTYLogger sharedInstance] setLogFormatter:self];
//        [DDLog addLogger:[DDTTYLogger sharedInstance]];
        
        // sends log statements to Apple System Logger, so they show up on Console.app
        [[DDASLLogger sharedInstance] setLogFormatter:self];
        [DDLog addLogger:[DDASLLogger sharedInstance]];
        
        //文件输出
        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
        
        //根据回滚频率和日志文件大小决定是否需要创建新的日志文件
        fileLogger.maximumFileSize = kDDDefaultLogMaxFileSize * 2;  //单个文件大小 :1M
        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
        
        fileLogger.logFileManager.maximumNumberOfLogFiles = 5; //最大文件数
        [fileLogger setLogFormatter:self];
        [DDLog addLogger:fileLogger];
        
        //保存手机&app信息
        if(fileLogger.currentLogFileInfo.fileSize == 0){
            ddLogLevel = DDLogLevelVerbose;
            NSString *deviceName = [UIDevice deviceName];
            NSString *iosVersion = [UIDevice iOSDetailVersion];
            NSString *appVersion = [NSBundle appWholeVersion];
            
            DDLogVerbose(@"***********************系统&app信息***********************");
            DDLogVerbose(@"*    deviceName      =            %@",deviceName);
            DDLogVerbose(@"*    iosVersion      =            %@",iosVersion);
            DDLogVerbose(@"*    appVersion      =            %@",appVersion);
            
#ifdef DEBUG
            DDLogVerbose(@"*************************DEBUG***************************");
#else
            DDLogVerbose(@"************************RELEASE***************************");
#endif
        }
 
        // And then enable colors
        char *xcode_colors = getenv("XcodeColors");
        if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
        {
            [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
            [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor greenColor]
                                             backgroundColor:nil
                                                     forFlag:LOG_FLAG_INFO];
            [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor]
                                             backgroundColor:nil
                                                     forFlag:LOG_FLAG_DEBUG];
        }
    }
    return self;
}


- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel = nil;
    switch (logMessage->_flag)
    {
        case LOG_FLAG_ERROR:
            logLevel = @"[ERROR] > ";
            break;
        case LOG_FLAG_WARN:
            logLevel = @"[WARN]  > ";
            break;
        case LOG_FLAG_INFO:
            logLevel = @"[INFO]  > ";
            break;
        case LOG_FLAG_DEBUG:
            logLevel = @"[DEBUG] > ";
            break;
        default:
            logLevel = @"[VBOSE] > ";
            break;
    }

    NSString *formatStr = [NSString stringWithFormat:@"%@%@",
                          logLevel, logMessage->_message];
    return formatStr;
}


- (void)setLogLevel:(GELogLevel)logLevel
{
    _logLevel = logLevel;
    switch (_logLevel) {
        case GELogLevelDEBUG:
            ddLogLevel = LOG_LEVEL_DEBUG;
            break;
        case GELogLevelINFO:
            ddLogLevel = LOG_LEVEL_INFO;
            break;
        case GELogLevelWARN:
            ddLogLevel = LOG_LEVEL_WARN;
            break;
        case GELogLevelERROR:
            ddLogLevel = LOG_LEVEL_ERROR;
            break;
        case GELogLevelOFF:
            ddLogLevel = LOG_LEVEL_OFF;
            break;
        default:
            break;
    }
}




//! 记录日志(有格式)
- (void)logLevel:(GELogLevel)level modelType:(GELogModelType)type format:(NSString *)format, ...
{
    //过滤close的log
    if (type & self.closeType) {
        return;
    }
    
    if (format)
    {
        va_list args;
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        [self logLevel:level modelType:type message:message];
    }
}

//! 记录日志(无格式)
- (void)logLevel:(GELogLevel)level modelType:(GELogModelType)type message:(NSString *)message
{
    //添加log所属模块
    switch (type) {
        case GELogModelTypeDefault:
            message = [NSString stringWithFormat:@"%@%@",@"[Default]    > ",message];
            break;
        case GELogModelTypeUI:
            message = [NSString stringWithFormat:@"%@%@",@"[UI]         > ",message];
            break;
        case GELogModelTypeDataBase:
            message = [NSString stringWithFormat:@"%@%@",@"[DataBase]   > ",message];
            break;
        case GELogModelTypeHTTP:
            message = [NSString stringWithFormat:@"%@%@",@"[HTTP]       > ",message];
            break;
        case GELogModelTypeDataServer:
            message = [NSString stringWithFormat:@"%@%@",@"[DataServer] > ",message];
            break;
        default:
            message = [NSString stringWithFormat:@"%@%@",@"[Undefined]  > ",message];
            break;
    }
    
    if (message.length > 0)
    {
        switch (level)
        {
            case GELogLevelERROR:
                DDLogError(@"%@", message);
                break;
                
            case GELogLevelWARN:
                DDLogWarn(@"%@", message);
                break;
                
            case GELogLevelINFO:
                DDLogInfo(@"%@", message);
                break;
                
            case GELogLevelDEBUG:
                DDLogDebug(@"%@", message);
                break;

            default:
                DDLogVerbose(@"%@", message);
                break;
        }
    }
}



@end
