//
//  Manager.m
//  testYap
//
//  Created by hjp on 16/10/26.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "Manager.h"

#import "SessionTable.h"
#import "HQDBHelper.h"

static Manager *instance_;
@implementation Manager

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}

// 得到当前的系统UINX时间戳(秒)
+ (long long)getCurrentSystemDateSecond
{
    // 得到当前的系统时间(秒)
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970];
    NSString *strTimeInterval = [NSString stringWithFormat:@"%zd", (long long)timeInterval];
    
    long long timeSecond = [strTimeInterval longLongValue];
    
    return timeSecond;
}

// 得到当前的系统UINX时间戳(毫秒)
+ (double)getCurrentSystemDateMillisecond
{
    // 得到当前的系统时间(毫秒)
    //UInt64 timeMillisecond = [[NSDate date] timeIntervalSince1970]*1000;
    
    // 得到当前的系统时间(毫秒)
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970];
    NSString *strTimeInterval = [NSString stringWithFormat:@"%.3lf", timeInterval];
    
    double timeMillisecond = [strTimeInterval doubleValue];
    
    return timeMillisecond;
}
// 得到当前的系统UINX时间戳(毫秒)
+ (double)getCurrentSystemDateMicrosecond
{
    // 得到当前的系统时间(毫秒)
    //UInt64 timeMillisecond = [[NSDate date] timeIntervalSince1970]*1000;
    
    // 得到当前的系统时间(毫秒)
    NSDate *currentDate = [[NSDate alloc] init];
    NSTimeInterval timeInterval = [currentDate timeIntervalSince1970];
    NSString *strTimeInterval = [NSString stringWithFormat:@"%.6lf", timeInterval];
    
    double timeMillisecond = [strTimeInterval doubleValue];
    
    return timeMillisecond;
}


// 显示“时:分” -> "H:M"
+ (NSString *)getTimeString:(NSTimeInterval)time
{
    if (time == 0) {
        return nil;
    }
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    
    NSString *comingDate = nil;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *weekdayComponents = [gregorian components:(NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate: date];
    NSInteger hour = [weekdayComponents hour];
    NSInteger minute = [weekdayComponents minute];
    
    // 显示“时:分” -> "H:M"
    comingDate = [NSString stringWithFormat:@"%ld:%02ld", (long)hour, (long)minute];
    return comingDate;
}



@end
