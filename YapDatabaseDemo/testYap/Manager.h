//
//  Manager.h
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YapDatabaseConnection;
@interface Manager : NSObject




+ (instancetype)shareManager;
// 得到当前的系统时间Unix时间戳(毫秒)
+ (long long)getCurrentSystemDateSecond;
// 得到当前的系统Unix时间戳(毫秒)
+ (double)getCurrentSystemDateMillisecond;
// 得到当前的系统UINX时间戳(毫秒)
+ (double)getCurrentSystemDateMicrosecond;

// 显示“时:分” -> "H:M"
+ (NSString *)getTimeString:(NSTimeInterval)time;

@end
