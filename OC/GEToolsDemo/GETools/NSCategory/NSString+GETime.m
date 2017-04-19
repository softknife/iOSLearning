//
//  NSString+GETime.m
//  ExcellentLearning
//
//  Created by Eric on 16/12/9.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "NSString+GETime.h"

@implementation NSString (GETime)


/**
 时间戳比较是否同一天
 */
- (BOOL)isSameDayCompareToDate:(NSString *)dateTwoTimestamp{
    
    
    long long time1 = [self longLongValue];
    long long time2 = [dateTwoTimestamp longLongValue];
    
    
    return [NSString isDateOne:time1 sameToDateTwo:time2];
}


/**
 比较两个时间戳
 
 @param dateOneTimestamp 第一个
 @param dateTwoTimestamp 第二个
 */
+ (BOOL)isDateOne:(long long)dateOneTimestamp sameToDateTwo:(long long)dateTwoTimestamp
{
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:dateOneTimestamp];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:dateTwoTimestamp];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    
    NSString *timeStr1 = [formatter stringFromDate:date1];
    NSString *timeStr2 = [formatter stringFromDate:date2];
    
    return [timeStr1 isEqualToString:timeStr2];
}


/**
 DateFormatter类型时间转化为NSString类型

 @param fomatter DateFormatter类型时间
 @return NSString类型时间
 */
- (NSString *)dateWithFormatter:(NSDateFormatter *)fomatter {

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    return [fomatter stringFromDate:date];
}



@end
