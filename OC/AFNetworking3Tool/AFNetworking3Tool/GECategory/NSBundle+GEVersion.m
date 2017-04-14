//
//  NSBundle+GEExtension.m
//  ExcellentLearning
//
//  Created by hjp on 17/2/24.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "NSBundle+GEVersion.h"

@implementation NSBundle (GEVersion)

/**
 应用程序显示的名字-version
 */
+ (NSString *)appShortVersion
{
   
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

/**
 应用程序构建版本-build
 */
+ (NSString *)appBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

/**
 应用程序显示的名字
 */
+ (NSString *)appDisplayName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];

}


/**
 App完整三段版本号，带build号（主.次.build）
 */
+ (NSString *)appWholeVersion{
    
    return [NSString stringWithFormat:@"%@.%@", [self appShortVersion], [self appBuildVersion]];
}
@end
