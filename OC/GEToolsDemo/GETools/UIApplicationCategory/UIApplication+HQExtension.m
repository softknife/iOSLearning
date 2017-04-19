//
//  UIApplication+HQExtension.m
//  ExcellentLearning
//
//  Created by hjp on 17/4/14.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIApplication+HQExtension.h"

@implementation UIApplication (HQExtension)

// 使用原生的电话切换到GSM呼叫
+ (void)telTo:(NSString *)phoneNumber
{
    // 去掉号码中的空格/-/(/)/ (ios7)
    NSString * phone = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@")" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // 使用原生的Phone打电话("tel"－电话结束后停留在原生电话页面
    // "telprompt"－电话结束后回到自己的程序(但是这种方法可能是私有的不能上app store))
    NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phone]];
    
    // 跳转到其它应用执行GSM呼叫
    NSLog(@"TOOLS: callToGSM:%@", phoneNumberURL);
    [[UIApplication sharedApplication] openURL:phoneNumberURL];
}


/**
 使用发短信功能
 */
+ (void)messageTo:(NSString *)phoneNumber
{
    // 去掉号码中的空格/-/(/)/ (ios7)
    NSString * phone = [phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@")" withString:@""];
    phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // 使用原生的Phone打电话("tel"－电话结束后停留在原生电话页面
    // "telprompt"－电话结束后回到自己的程序(但是这种方法可能是私有的不能上app store))
    NSURL *phoneNumberURL = [NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",phoneNumber]];
    
    // 跳转到其它应用执行GSM呼叫
    [[UIApplication sharedApplication] openURL:phoneNumberURL];
}



/**
 注册APNS Push通知
 */
+ (void)registerAPNsNotifications
{
    // Gray.Wang:2014.08.14:兼容iOS8系统注册APNS通知API
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerForRemoteNotifications)])
    {
        // iOS8之后注册系统Push Notification
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        // iOS8之前注册系统Push Notification
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert
                                                                               | UIRemoteNotificationTypeBadge
                                                                               | UIRemoteNotificationTypeSound)];
    }
}


/**
 是否关闭了系统的APNS通知（YES-关闭了，NO-没有关闭）
 */
+ (BOOL)isDisableAPNsNotifications
{
    BOOL bDisableApnsNotifications = NO;
    UIApplication *application = [UIApplication sharedApplication];
    
    // Gray.Wang:2014.08.14:兼容iOS8系统注册APNS通知API
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        UIUserNotificationSettings * notificationSettings = [application currentUserNotificationSettings];
        if ((notificationSettings.types & UIRemoteNotificationTypeAlert) == NO ||
            (notificationSettings.types & UIRemoteNotificationTypeBadge) == NO ||
            (notificationSettings.types & UIRemoteNotificationTypeSound) == NO)
        {
            bDisableApnsNotifications = YES;
        }
        
        // 判断Push推送功能是否开启
        NSLog(@"TOOLS: UIUserNotificationSettings notificationSettings.types = %lu", (long)notificationSettings.types);
    }
    else {
        UIRemoteNotificationType notifyType = [application enabledRemoteNotificationTypes];
        if ((notifyType & UIRemoteNotificationTypeAlert) == NO ||
            (notifyType & UIRemoteNotificationTypeBadge) == NO ||
            (notifyType & UIRemoteNotificationTypeSound) == NO)
        {
            bDisableApnsNotifications = YES;
        }
        
        // 判断Push推送功能是否开启
        NSLog(@"TOOLS: UIRemoteNotificationType notifyType = %lu", (long)notifyType);
    }
    
    return bDisableApnsNotifications;
}

@end
