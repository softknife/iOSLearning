//
//  UIDevice+GEExtension.m
//  ExcellentLearning
//
//  Created by liwenxiang on 2017/1/13.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIDevice+GEExtension.h"
#import <sys/utsname.h>


NSString *const GEDeviceNameiPhone          = @"iPhone";
NSString *const GEDeviceNameiPhone3G        = @"iPhone3G";
NSString *const GEDeviceNameiPhone3GS       = @"iPhone3GS";
NSString *const GEDeviceNameiPhone4         = @"iPhone4";
NSString *const GEDeviceNameiPhone4S        = @"iPhone4S";
NSString *const GEDeviceNameiPhone5         = @"iPhone5";
NSString *const GEDeviceNameiPhone5C        = @"iPhone5C";
NSString *const GEDeviceNameiPhone5S        = @"iPhone5S";
NSString *const GEDeviceNameiPhone6Plus     = @"iPhone6 Plus";
NSString *const GEDeviceNameiPhone6         = @"iPhone6";
NSString *const GEDeviceNameiPhone6S        = @"iPhone6S";
NSString *const GEDeviceNameiPhone6SPlus    = @"iPhone6SPlus";
NSString *const GEDeviceNameiPhone6SE       = @"iPhone6SE";
NSString *const GEDeviceNameiPhone7         = @"iPhone7";
NSString *const GEDeviceNameiPhone7Plus     = @"iPhone7Plus";
NSString *const GEDeviceNameiPad1           = @"iPad1";
NSString *const GEDeviceNameiPad2           = @"iPad2";
NSString *const GEDeviceNameiPad3           = @"iPad3";
NSString *const GEDeviceNameiPad4           = @"iPad4";
NSString *const GEDeviceNameiPadMini        = @"iPadMini";
NSString *const GEDeviceNameiPod1           = @"iPod1";
NSString *const GEDeviceNameiPod2           = @"iPod2";
NSString *const GEDeviceNameiPod3           = @"iPod3";
NSString *const GEDeviceNameiPod4           = @"iPod4";
NSString *const GEDeviceNameiPod5           = @"iPod5";
NSString *const GEDeviceNameSimulator       = @"ios simulator";

@implementation UIDevice (GEExtension)

//
+ (NSString *)deviceName
{
    // 获取设备信息
    struct utsname systemInfo = {0};
    uname(&systemInfo);
    
    NSString * strMachine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    NSString * strMachineType = nil;
    
    // 判断设备类型
    if ([strMachine hasPrefix:@"iPhone1,1"]) {
        strMachineType = GEDeviceNameiPhone;
    }
    else if ([strMachine hasPrefix:@"iPhone1,2"])
    {
        strMachineType = GEDeviceNameiPhone3G;
    }
    else if ([strMachine hasPrefix:@"iPhone2,1"])
    {
        strMachineType = GEDeviceNameiPhone3GS;
    }
    else if ([strMachine hasPrefix:@"iPhone3"])
    {
        strMachineType = GEDeviceNameiPhone4;
    }
    else if ([strMachine hasPrefix:@"iPhone4"])
    {
        strMachineType = GEDeviceNameiPhone4S;
    }
    else if ([strMachine hasPrefix:@"iPhone5,1"] ||
             [strMachine hasPrefix:@"iPhone5,2"])
    {
        strMachineType = GEDeviceNameiPhone5;
    }
    else if ([strMachine hasPrefix:@"iPhone5,3"] ||
             [strMachine hasPrefix:@"iPhone5,4"])
    {
        strMachineType = GEDeviceNameiPhone5C;
    }
    else if ([strMachine hasPrefix:@"iPhone6,1"] ||
             [strMachine hasPrefix:@"iPhone6,2"])
    {
        strMachineType = GEDeviceNameiPhone5S;
    }
    else if ([strMachine hasPrefix:@"iPhone7,1"])
    {
        strMachineType = GEDeviceNameiPhone6Plus;
    }
    else if ([strMachine hasPrefix:@"iPhone7,2"])
    {
        strMachineType = GEDeviceNameiPhone6;
    }
    
    else if ([strMachine isEqualToString:@"iPhone8,1"])
    {
        strMachineType = GEDeviceNameiPhone6S;
    }
    else if ([strMachine isEqualToString:@"iPhone8,2"])
    {
        strMachineType = GEDeviceNameiPhone6SPlus;
    }
    else if ([strMachine isEqualToString:@"iPhone8,4"])
    {
        strMachineType = GEDeviceNameiPhone6SE;
    }
    else if ([strMachine isEqualToString:@"iPhone9,1"])
    {
        strMachineType = GEDeviceNameiPhone7;
    }
    else if ([strMachineType isEqualToString:@"iPhone9,2"])
    {
        strMachineType = GEDeviceNameiPhone7Plus;
    }
    else if ([strMachine hasPrefix:@"iPad1"])
    {
        strMachineType = GEDeviceNameiPad1;
    }
    else if ([strMachine hasPrefix:@"iPad2"])
    {
        strMachineType = GEDeviceNameiPad2;
    }
    else if ([strMachine isEqualToString:@"iPad3,1"] ||
             [strMachine isEqualToString:@"iPad3,2"] ||
             [strMachine isEqualToString:@"iPad3,3"])
    {
        strMachineType = GEDeviceNameiPad3;
    }
    else if ([strMachine hasPrefix:@"iPad3,4"])
    {
        strMachineType = GEDeviceNameiPad4;
    }
    else if ([strMachine hasPrefix:@"iPad2,5"])
    {
        strMachineType = GEDeviceNameiPadMini;
    }
    else if ([strMachine hasPrefix:@"iPod1,1"])
    {
        strMachineType = GEDeviceNameiPod1;
    }
    else if ([strMachine hasPrefix:@"iPod2,1"])
    {
        strMachineType = GEDeviceNameiPod2;
    }
    else if ([strMachine hasPrefix:@"iPod3,1"])
    {
        strMachineType = GEDeviceNameiPod3;
    }
    else if ([strMachine hasPrefix:@"iPod4,1"])
    {
        strMachineType = GEDeviceNameiPod4;
    }
    else if ([strMachine hasPrefix:@"iPod5,1"])
    {
        strMachineType = GEDeviceNameiPod5;
    }
    else if ([strMachine hasSuffix:@"86"] || [strMachine isEqual:@"x86_64"])
    {
        strMachineType = GEDeviceNameSimulator;
    }
    
    NSLog(@"TOOLS: iOSMachineHardwareType - strMachine = %@, strMachineType = %@", strMachine, strMachineType);
    
    return strMachineType;
}


// 获取iOS设备硬件类型，返回枚举型（iPhone3GS、iPhone4、iPhone4S、iPhone5）
+ (GEDeviceType)deviceType
{
    // 获取设备信息
    NSString * strMachineType = [self deviceName];
    
    GEDeviceType deviceType = GEDeviceTypeUnknow;
    // 判断设备类型
    if ([strMachineType isEqualToString:GEDeviceNameiPhone]) {
        deviceType = GEDeviceTypeiPhone1G;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone3G])
    {
        deviceType = GEDeviceTypeiPhone3G;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone3GS])
    {
        deviceType = GEDeviceTypeiPhone3GS;

    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone4])
    {
        deviceType = GEDeviceTypeiPhone4;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone4S])
    {
        deviceType = GEDeviceTypeiPhone4S;

    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone5])
    {
        deviceType = GEDeviceTypeiPhone5;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone5C])
    {
        deviceType = GEDeviceTypeiPhone5C;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone5S] )
    {
        deviceType = GEDeviceTypeiPhone5S;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone6Plus])
    {
        deviceType = GEDeviceTypeiPhone6P;

    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone6])
    {
        deviceType = GEDeviceTypeiPhone6;  

    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone6S])
    {
        deviceType = GEDeviceTypeiPhone6S;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone6SPlus])
    {
        deviceType = GEDeviceTypeiPhone6SPlus;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone6SE])
    {
        deviceType = GEDeviceTypeiPhone6SE;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone7])
    {
        deviceType = GEDeviceTypeiPhone7;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPhone7Plus])
    {
        deviceType = GEDeviceTypeiPhone7Plus;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPad1])
    {
        deviceType = GEDeviceTypeiPad1G;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPad2])
    {
        deviceType = GEDeviceTypeiPad2G;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPad3])
    {
        deviceType = GEDeviceTypeiPad3G;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPad4])
    {
        deviceType = GEDeviceTypeiPad4G;
    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPadMini])
    {
        deviceType = GEDeviceTypeiPadMini;

    }
    else if ([strMachineType isEqualToString:GEDeviceNameiPod1])
    {
        deviceType = GEDeviceTypeiPod1G;

    }
    else if ([strMachineType hasPrefix:GEDeviceNameiPod2])
    {
        deviceType = GEDeviceTypeiPod2G;

    }
    else if ([strMachineType hasPrefix:GEDeviceNameiPod3])
    {
        deviceType = GEDeviceTypeiPod3G;
    }
    else if ([strMachineType hasPrefix:GEDeviceNameiPod4])
    {
        deviceType = GEDeviceTypeiPod4G;
    }
    else if ([strMachineType hasPrefix:GEDeviceNameiPod5])
    {
        deviceType = GEDeviceTypeiPod5G;
    }
    else if ([strMachineType hasSuffix:GEDeviceNameSimulator])
    {
        deviceType = GEDeviceTypeSimulator;
    }
    
    
    return deviceType;
}




// 判断是否为小屏手机
+ (BOOL)deviceIsSmallOne
{
    BOOL isSmallDevice = NO;
    switch ([UIDevice deviceType]) {
        case GEDeviceTypeiPhone1G:
        case GEDeviceTypeiPhone3G:  // on iPhone 3G
        case GEDeviceTypeiPhone3GS: // on iPhone 3GS
        case GEDeviceTypeiPhone4:   // on iPhone 4
        case GEDeviceTypeiPhone4S:  // on iPhone 4S
        case GEDeviceTypeiPhone5:   // on iPhone 5  @"iPhone5,1"-model A1428, AT&T/Canada; @"iPhone5,2"-model A1429
        case GEDeviceTypeiPhone5C: // on iPhone 5C @"iPhone5,3"-iPhone5c-GSM-A1526; @"iPhone5,4"-iPhone5c-CDMA-A1532
        case GEDeviceTypeiPhone5S:  // on iPhone 5S @"iPhone:
        {
            isSmallDevice = YES;
        }
            break;
            
        default:
            break;
    }
    
    return isSmallDevice;
}

// 判断是否为iphone4或以下系列设备
+ (BOOL)deviceIsIphone4
{
    BOOL isSmallDevice = NO;
    switch ([UIDevice deviceType]) {
        case GEDeviceTypeiPhone1G:
        case GEDeviceTypeiPhone3G:  // on iPhone 3G
        case GEDeviceTypeiPhone3GS: // on iPhone 3GS
        case GEDeviceTypeiPhone4:   // on iPhone 4
        case GEDeviceTypeiPhone4S:  // on iPhone 4S
        {
            isSmallDevice = YES;
        }
            break;
            
        default:
            break;
    }
    
    return isSmallDevice;
}

// 判断是否为iphone5系列设备
+ (BOOL)deviceIsIphone5
{
    BOOL isSmallDevice = NO;
    switch ([UIDevice deviceType]) {
        case GEDeviceTypeiPhone5:   // on iPhone 5  @"iPhone5,1"-model A1428, AT&T/Canada; @"iPhone5,2"-model A1429
        case GEDeviceTypeiPhone5C: // on iPhone 5C @"iPhone5,3"-iPhone5c-GSM-A1526; @"iPhone5,4"-iPhone5c-CDMA-A1532
        case GEDeviceTypeiPhone5S:  // on iPhone 5S @"iPhone:
        {
            isSmallDevice = YES;
        }
            break;
            
        default:
            break;
    }
    
    return isSmallDevice;
}



// 是否是iPhone设备
+ (BOOL)iPhone
{
    // 获取设备信息
    UIDevice* deviceInfo = [UIDevice currentDevice];
    
    return [deviceInfo.model isEqualToString:@"iPhone"];
}


#pragma mark - 系统版本
/**
 返回iOS系统的主版本(4/5/6)
 */
+ (NSInteger)iOSMajorVersion
{
    NSInteger nMaxVersion =  [[[[self iOSDetailVersion] componentsSeparatedByString:@"."] firstObject] integerValue];
    
    return nMaxVersion;
}


// 返回iOS系统的全版本号(如：6.1.4)
+ (NSString *)iOSDetailVersion
{
    
//    NSInteger version = -1;
//    
//    if ([self iOS8Earlier]) {
//        // 获取设备信息
//        UIDevice* deviceInfo = [UIDevice currentDevice];
//        //NSLog(@"TOOLS: getCurrentiOSMajorVersion = %@", deviceInfo.systemVersion);
//        
//        // systemVersion方法ios8后就失效了,需要使用NSProcessInfo方法,
//        version = [deviceInfo.systemVersion integerValue]; // 7.1.1/7-1-1
//    }else{
//        
//        // FIXME:这个方法不能适配7系统 只能是8以后的系统可以用
//        version = [NSProcessInfo processInfo].operatingSystemVersion.majorVersion;
//        
//    }
    
    // 这个方法现在是任何版本通用的
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    
    return phoneVersion;
}



/**
 *  判断是否为iosXXX之前的版本
 */
//+ (GEOSVersion)iOSVersionJudge
//{
//    
//    double versionNumber = floor(NSFoundationVersionNumber);
//    
//    if (versionNumber < NSFoundationVersionNumber_iOS_6_1) {
//        return GEOSVersionOS7Earlier; // 不包括7
//    }else if(versionNumber < NSFoundationVersionNumber_iOS_8_0){
//        return GEOSVersionOS8Earlier;
//    }else if(versionNumber <= NSFoundationVersionNumber_iOS_8_4){
//        return GEOSVersionOS9Earlier;
//    }else if(versionNumber <= NSFoundationVersionNumber_iOS_9_x_Max){
//        return GEOSVersionOS10Earlier;
//    }
//    else if (versionNumber > NSFoundationVersionNumber_iOS_9_x_Max)
//    {
//        return GEOSVersionOS11Earlier;
//        
//    }
//    else
//    {
//        return GEOSVersionOSUnKnown;
//        
//    }
//}


/**
 当前系统版本是否大于某个版本

 @param version 对比的系统版本
 @return 是大于吗???
 */
+ (BOOL)iOSVersionLargeThan:(NSUInteger)version
{

    NSAssert(version >= 7, @"请填写有效版本,系统适配版本为>=7");
    
    return [self iOSMajorVersion] > version;
    
}

/**
 当前系统版本是否小于某个版本
 
 @param version 对比的系统版本
 @return 是小于吗???
 */
+ (BOOL)iOSVersionLessThan:(NSUInteger)version
{
    NSAssert(version >= 7, @"请填写有效版本,系统适配版本为>=7");
    
    return [self iOSMajorVersion] < version;
}


/*
 *  判断是否为ios7之前的版本
 */
//+ (BOOL)iSiOS7Earlier
//{
//    
//    return floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1;
//}


/*
 *  判断是否为ios8之前的版本
 */
//+ (BOOL)iSiOS8Earlier
//{
//    // UIDevice方法效率低,苹果官方建议使用宏定义
//    //    UIDevice *device = [UIDevice currentDevice];
//    //    float sysVersion = [device.systemVersion floatValue];
//    //
//    //    if (sysVersion < 8.0f) {
//    //        return YES;
//    //    }
//    
//    //    if ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){7,1,0}]) {
//    //        NSLog(@"Hello from > iOS 7.1");
//    //    }
//    
//    return floor(NSFoundationVersionNumber) < NSFoundationVersionNumber_iOS_8_0;
//}

/*
 *  判断是否为ios9之前的版本
 */
//+ (BOOL)iSiOS9Earlier
//{
//    
//    return floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_8_4;
//}


/* Get Local iOS language
 zh-Hans = 简体中文
 zh-Hant = 繁体中文
 en = 英文（其他国家默认语言）
 ja = 日语
 ar = 阿拉伯语言
 */
+ (NSString *)getLocaliOSLanguage
{
    NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString *systemlanguage = nil;
    
    if (languages)
    {
        systemlanguage = [languages objectAtIndex:0];
    }
    
    return systemlanguage;
}



@end
