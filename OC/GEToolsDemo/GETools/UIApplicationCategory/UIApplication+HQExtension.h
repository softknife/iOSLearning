//
//  UIApplication+HQExtension.h
//  ExcellentLearning
//
//  Created by hjp on 17/4/14.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (HQExtension)


/**
 使用原生的电话切换到GSM呼叫

 @param phoneNumber 号码
 */
+ (void)telTo:(NSString *)phoneNumber;


/**
 使用发短信功能

 @param phoneNumber 号码
 */
+ (void)messageTo:(NSString *)phoneNumber;


/**
 注册APNS Push通知
 */
+ (void)registerAPNsNotifications;


/**
 是否关闭了系统的APNS通知（YES-关闭了，NO-没有关闭）
 */
+ (BOOL)isDisableAPNsNotifications;
@end
