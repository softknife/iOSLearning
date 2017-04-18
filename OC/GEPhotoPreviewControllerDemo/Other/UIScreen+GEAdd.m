//
//  UIScreen+GEAdd.m
//  
//
//  Created by hjp on 16/11/3.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "UIScreen+GEAdd.h"

@implementation UIScreen (GEAdd)

+ (CGFloat)screenWidth
{
    return [self size].width;

}
+ (CGFloat)screenHeight
{
    
    return [self size].height;

}
+ (CGRect)bounds
{
    return [UIScreen mainScreen].bounds;
}
+ (CGSize)size
{
    return [self bounds].size;
}
+ (CGFloat)scale
{
    return [UIScreen mainScreen].scale;
}

+ (BOOL)isRetina
{
    return [[UIScreen mainScreen] scale] >= 2.0 ? YES:NO;
}
+ (BOOL)isIPAD
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? YES:NO;
}
+ (BOOL)isIPHONE
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone?YES:NO;
}
@end
