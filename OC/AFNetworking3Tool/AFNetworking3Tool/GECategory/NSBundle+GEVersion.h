//
//  NSBundle+GEExtension.h
//  ExcellentLearning
//
//  Created by hjp on 17/2/24.
//  Copyright © 2017年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (GEVersion)

/**
 应用程序显示的名字-version
 */
+ (NSString *)appShortVersion;

/**
 应用程序构建版本-build
 */
+ (NSString *)appBuildVersion;
/**
 应用程序显示的名字
 */
+ (NSString *)appDisplayName;
/**
 App完整三段版本号，带build号（主.次.build）
 */
+ (NSString *)appWholeVersion;
@end
