//
//  NSString+GETime.h
//  ExcellentLearning
//
//  Created by Eric on 16/12/9.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GETime)

/**
 时间戳比较是否同一天
 */
- (BOOL)isSameDayCompareToDate:(NSString *)dateTwoTimestamp;


/**
 比较两个时间戳

 @param dateOneTimestamp 第一个
 @param dateTwoTimestamp 第二个
 */
+ (BOOL)isDateOne:(long long)dateOneTimestamp sameToDateTwo:(long long)dateTwoTimestamp;


/**
 DateFormatter类型时间转化为NSString类型
 
 @param fomatter DateFormatter类型时间
 @return NSString类型时间
 */
- (NSString *)dateWithFormatter:(NSDateFormatter *)fomatter;
@end
