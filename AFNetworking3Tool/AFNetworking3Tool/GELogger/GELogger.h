//
//  GELogger.h
//  ExcellentLearning
//
//  Created by yao on 17/3/2.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(UInt8, GELogLevel) {
    GELogLevelDEBUG         = 1,
    GELogLevelINFO          = 2,
    GELogLevelWARN          = 3,
    GELogLevelERROR         = 4,
    GELogLevelOFF           = 5,
};

//log所属模块
typedef NS_OPTIONS(NSInteger, GELogModelType) {
    
    GELogModelType_START,
    
    GELogModelTypeUI            = 1<<0,
    GELogModelTypeDataBase      = 1<<1,
    GELogModelTypeHTTP          = 1<<2,
    GELogModelTypeDataServer    = 1<<3,
    GELogModelTypeDefault       = 1<<4,
    
    GELogModelType_END,
};


#define GE_LOG_MACRO(level, type, fmt, ...)     [[GELogger sharedInstance] logLevel:level modelType:type format:(fmt), ##__VA_ARGS__]
#define GE_LOG_PRETTY(level, type, fmt, ...)    \
do {GE_LOG_MACRO(level, type, @"%s #%d " fmt, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);} while(0)


//***************************        UI           **********************
#define GEUILogError(frmt, ...)   GE_LOG_PRETTY(GELogLevelERROR, GELogModelTypeUI, frmt, ##__VA_ARGS__)
#define GEUILogWarn(frmt, ...)    GE_LOG_PRETTY(GELogLevelWARN,  GELogModelTypeUI, frmt, ##__VA_ARGS__)
#define GEUILogInfo(frmt, ...)    GE_LOG_PRETTY(GELogLevelINFO,  GELogModelTypeUI, frmt, ##__VA_ARGS__)
#define GEUILogDebug(frmt, ...)   GE_LOG_PRETTY(GELogLevelDEBUG, GELogModelTypeUI, frmt, ##__VA_ARGS__)

//***************************        DataBase     **********************
#define GEDBLogError(frmt, ...)   GE_LOG_PRETTY(GELogLevelERROR, GELogModelTypeDataBase, frmt, ##__VA_ARGS__)
#define GEDBLogWarn(frmt, ...)    GE_LOG_PRETTY(GELogLevelWARN,  GELogModelTypeDataBase, frmt, ##__VA_ARGS__)
#define GEDBLogInfo(frmt, ...)    GE_LOG_PRETTY(GELogLevelINFO,  GELogModelTypeDataBase, frmt, ##__VA_ARGS__)
#define GEDBLogDebug(frmt, ...)   GE_LOG_PRETTY(GELogLevelDEBUG, GELogModelTypeDataBase, frmt, ##__VA_ARGS__)

//***************************        HTTP         **********************
#define GEHTTPLogError(frmt, ...)   GE_LOG_PRETTY(GELogLevelERROR, GELogModelTypeHTTP, frmt, ##__VA_ARGS__)
#define GEHTTPLogWarn(frmt, ...)    GE_LOG_PRETTY(GELogLevelWARN,  GELogModelTypeHTTP, frmt, ##__VA_ARGS__)
#define GEHTTPLogInfo(frmt, ...)    GE_LOG_PRETTY(GELogLevelINFO,  GELogModelTypeHTTP, frmt, ##__VA_ARGS__)
#define GEHTTPLogDebug(frmt, ...)   GE_LOG_PRETTY(GELogLevelDEBUG, GELogModelTypeHTTP, frmt, ##__VA_ARGS__)

//***************************        DataServer   **********************
#define GEDSLogError(frmt, ...)   GE_LOG_PRETTY(GELogLevelERROR, GELogModelTypeDataServer, frmt, ##__VA_ARGS__)
#define GEDSLogWarn(frmt, ...)    GE_LOG_PRETTY(GELogLevelWARN,  GELogModelTypeDataServer, frmt, ##__VA_ARGS__)
#define GEDSLogInfo(frmt, ...)    GE_LOG_PRETTY(GELogLevelINFO,  GELogModelTypeDataServer, frmt, ##__VA_ARGS__)
#define GEDSLogDebug(frmt, ...)   GE_LOG_PRETTY(GELogLevelDEBUG, GELogModelTypeDataServer, frmt, ##__VA_ARGS__)

//***************************        Default      **********************
#define GELogError(frmt, ...)     GE_LOG_PRETTY(GELogLevelERROR, GELogModelTypeDefault, frmt, ##__VA_ARGS__)
#define GELogWarn(frmt, ...)      GE_LOG_PRETTY(GELogLevelWARN,  GELogModelTypeDefault, frmt, ##__VA_ARGS__)
#define GELogInfo(frmt, ...)      GE_LOG_PRETTY(GELogLevelINFO,  GELogModelTypeDefault, frmt, ##__VA_ARGS__)
#define GELogDebug(frmt, ...)     GE_LOG_PRETTY(GELogLevelDEBUG, GELogModelTypeDefault, frmt, ##__VA_ARGS__)


@interface GELogger : NSObject

@property (nonatomic, assign) GELogLevel logLevel;

/** 需要屏蔽的log类型 :GELogModelType ,多个时用 “|” 隔开*/
@property (nonatomic, assign) GELogModelType closeType;

+ (instancetype)sharedInstance;
+ (void)startWithLogLevel:(GELogLevel)logLevel;

- (void)logLevel:(GELogLevel)level modelType:(GELogModelType)type format:(NSString *)format, ...;
- (void)logLevel:(GELogLevel)level modelType:(GELogModelType)type message:(NSString *)message;

@end
