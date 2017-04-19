//
//  NSDate+GEAdd.m
//  ExcellentLearning
//
//  Created by Eric on 15/12/16.
//  Copyright © 2015年 ExcellentLearning. All rights reserved.
//

#import "NSDate+GEAdd.h"

@implementation NSDate (GEAdd)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *someDateStr = [fmt stringFromDate:self];
    NSDate *someDate = [fmt dateFromString:someDateStr];
    NSString *currentStr = [fmt stringFromDate:[NSDate date]];
    NSDate *current = [fmt dateFromString:currentStr];
    
    // 注意:上面一定要转换为yyyy-MM-dd,这样,下面components计算才会以day为单位计算,否则以秒为单位计算
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:someDate toDate:current options:0];
    
    // 注意:这里两个date之间的计算,不是我们常识上的某一天-某一天,而是日历天相减.
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *someDateCmps = [calendar components:unit fromDate:self ];
    NSDateComponents *currentDateCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return someDateCmps.year == currentDateCmps.year &&
    someDateCmps.month == currentDateCmps.month &&
    someDateCmps.day == currentDateCmps.day;
    
    
}

- (BOOL)isTomorrow
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *someDateStr = [fmt stringFromDate:self];
    NSDate *someDate = [fmt dateFromString:someDateStr];
    NSString *currentStr = [fmt stringFromDate:[NSDate date]];
    NSDate *current = [fmt dateFromString:currentStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:someDate toDate:current options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == -1;
}

- (BOOL)isSameDay:(NSDate *)dataOne DataTwo:( NSDate *)dataTwo {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"yyyyMMdd"];
    
    NSString *data1 = [formatter stringFromDate:dataOne];
    NSString *data2 = [formatter stringFromDate:dataTwo];
    
    return [data1 isEqualToString:data2];
}



/**
 判断这个时间是否为xx天前  也就是距离当前时间的间隔

 @param dayNum 第几天以前
 */
- (BOOL)isSevenDaysAgo:(NSInteger)dayNum
{
    NSDate *nowDate = [NSDate date];
    // 时间转化
    NSDate *nowTime = [NSDate dateWithTimeIntervalSince1970:[nowDate timeIntervalSince1970]];
    
    NSTimeInterval time = [nowTime timeIntervalSinceDate:self];
//    NSLog(@"time:%f",time/60/60/24);
    
    return time/60/60/24 > dayNum ? YES : NO;
}





/**
 将时间戳转换为时间

 @param timeStamp 时间戳
 */
+ (NSDate *)dateWithTimeStamp:(NSInteger)timeStamp{
    NSString *str= [NSString stringWithFormat:@"%ld",(long)timeStamp]; //时间戳
    NSTimeInterval time=[str doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //得到日期
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    NSDate *date=[dateFormatter dateFromString:currentDateStr];
    return date;
}



/**
 根据NSDate获取x年x月x日

 @param isZh 是否转为中文
 */
- (NSString *)getYearMonthDay:(BOOL)isZh
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *currentDateCmps = [calendar components:unit fromDate:self];
    if (isZh) {
        return [NSString stringWithFormat:@"%zd年%zd月%zd日",currentDateCmps.year,currentDateCmps.month,currentDateCmps.day];
    }
    return [NSString stringWithFormat:@"%zd-%zd-%zd",currentDateCmps.year,currentDateCmps.month,currentDateCmps.day];
}



@end
