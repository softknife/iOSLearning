//
//  UIDevice+GEExtension.h
//  ExcellentLearning
//
//  Created by liwenxiang on 2017/1/13.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 * @brief iOS设备硬件类型枚举
 */
typedef NS_ENUM(NSUInteger,GEDeviceType) {
    
    // 未知的设备
    GEDeviceTypeUnknow,  // unknown device
    
    // 模拟器
    GEDeviceTypeSimulator, // on the simulator
    
    // iPod Touch
    GEDeviceTypeiPod1G,  // on iPod Touch
    GEDeviceTypeiPod2G ,  // on iPod Touch Second Generation
    GEDeviceTypeiPod3G,  // on iPod Touch Third Generation
    GEDeviceTypeiPod4G,  // on iPod Touch Fourth Generation
    GEDeviceTypeiPod5G,  // on iPod Touch Five Generation
    
    // iPhone
    GEDeviceTypeiPhone1G,  // on iPhone
    GEDeviceTypeiPhone3G,  // on iPhone 3G
    GEDeviceTypeiPhone3GS, // on iPhone 3GS
    GEDeviceTypeiPhone4,   // on iPhone 4
    GEDeviceTypeiPhone4S,  // on iPhone 4S
    GEDeviceTypeiPhone5,   // on iPhone 5  @"iPhone5,1"-model A1428, AT&T/Canada; @"iPhone5,2"-model A1429
    GEDeviceTypeiPhone5C,  // on iPhone 5C @"iPhone5,3"-iPhone5c-GSM-A1526; @"iPhone5,4"-iPhone5c-CDMA-A1532
    GEDeviceTypeiPhone5S,  // on iPhone 5S @"iPhone6,1"-iPhone5s-GSM-A1528; @"iPhone6,2"-iPhone5s-CDMA-A1533
    GEDeviceTypeiPhone6,   // on iPhone 6
    GEDeviceTypeiPhone6P,  // on iPhone 6 Plus
    GEDeviceTypeiPhone6S,   // on iPhone 6s
    GEDeviceTypeiPhone6SPlus,   // on iPhone 6sp
    GEDeviceTypeiPhone6SE,   // on iPhone 6se
    GEDeviceTypeiPhone7,   // on iPhone 7
    GEDeviceTypeiPhone7Plus,   // on iPhone 7p
    
    // iPad
    GEDeviceTypeiPad1G,   // on iPad 1rd, WiFi and 3G
    GEDeviceTypeiPad2G,   // on iPad 2rd, iPad2,1->WiFi, iPad2,2->GSM 3G, iPad2,3->CDMA 3G
    GEDeviceTypeiPad3G,   // on iPad 3rd, iPad3,1->WiFi, iPad3,2->GSM, iPad3,3->CDMA
    GEDeviceTypeiPad4G,   // on iPad 4th Generation iPad @"iPad3,4"
    GEDeviceTypeiPadMini, // on iPad Mini
};


//typedef NS_ENUM(NSUInteger,GEOSVersion) {
//    
//    // 不包括7
//    GEOSVersionOS7Earlier,
//    GEOSVersionOS8Earlier,
//    GEOSVersionOS9Earlier,
//    GEOSVersionOS10Earlier,
//    GEOSVersionOS11Earlier,
//    
//    GEOSVersionOSUnKnown,
//    
//};


@interface UIDevice (GEExtension)

#pragma mark - 设备信息

/**
 设备名字: iPhone6/iPadMini
 */
+ (NSString *)deviceName;

/**
设备型号枚举值
 */
+ (GEDeviceType)deviceType;
/**
 *  判断是否为小屏手机
 */
+ (BOOL)deviceIsSmallOne;
// 判断是否为iphone4或以下系列设备
+ (BOOL)deviceIsIphone4;
// 判断是否为iphone5系列设备
+ (BOOL)deviceIsIphone5;



/**
 是否是iPhone设备
 */
+ (BOOL)iPhone;

#pragma mark - 系统版本
/**
 返回iOS系统的主版本(4/5/6)
 */
+ (NSInteger)iOSMajorVersion;

/**
 返回iOS系统的全版本号(如：6.1.4)
 */
+ (NSString *)iOSDetailVersion;

/**
 *  判断是否为iosXXX之前的版本
 */
//+ (GEOSVersion)iOSVersionJudge;

/**
 当前系统版本是否大于某个版本
 
 @param version 对比的系统版本
 @return 是大于吗???
 */
+ (BOOL)iOSVersionLargeThan:(NSUInteger)version;

/**
 当前系统版本是否小于某个版本
 
 @param version 对比的系统版本
 @return 是小于吗???
 */
+ (BOOL)iOSVersionLessThan:(NSUInteger)version;


/*
 *  判断是否为ios7之前的版本
 */
//+ (BOOL)iSiOS7Earlier;

/*
 *  判断是否为ios8之前的版本
 */
//+ (BOOL)iSiOS8Earlier;

/*
 *  判断是否为ios9之前的版本
 */
//+ (BOOL)iSiOS9Earlier;



/* Get Local iOS language
 zh-Hans = 简体中文
 zh-Hant = 繁体中文
 en = 英文（其他国家默认语言）
 ja = 日语
 ar = 阿拉伯语言
 */
+ (NSString *)getLocaliOSLanguage;





@end
