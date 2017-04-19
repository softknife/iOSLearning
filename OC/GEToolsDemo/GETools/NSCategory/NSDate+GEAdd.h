//
//  NSDate+GEAdd.h
//
//  Created by Eric on 15/12/16.
//  Copyright © 2015年 ExcellentLearning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GEAdd)

- (BOOL)isThisYear;
- (BOOL)isYesterday;
- (BOOL)isToday;
- (BOOL)isTomorrow;

/**
 *  判断这个时间是否为xx天前  也就是距离当前时间的间隔  
 *  dayNum:第几天以前  传多少,就可以判断是否为多少天前
 */
- (BOOL)isSevenDaysAgo:(NSInteger)dayNum;

/**
 判断两天是否为同一天

 @param dataOne day 1
 @param dataTwo day 2
 */
- (BOOL)isSameDay:(NSDate *)dataOne DataTwo:(NSDate *)dataTwo;

/**
 *  将时间戳转换为时间
 *
 *  @param timeStamp 时间戳
 *  @return 时间
 */
+ (NSDate *)dateWithTimeStamp:(NSInteger)timeStamp;

/**
 根据NSDate获取x年x月x日
 
 @param isZh 是否转为中文
 */
- (NSString *)getYearMonthDay:(BOOL)isZh;



@end
