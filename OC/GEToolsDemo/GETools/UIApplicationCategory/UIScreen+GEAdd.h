//
//  UIScreen+GEAdd.h
//  
//
//  Created by hjp on 16/11/3.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (GEAdd)
+ (CGFloat)screenWidth;
+ (CGFloat)screenHeight;
+ (CGRect)bounds;
+ (CGSize)size;
+ (CGFloat)scale;

+ (BOOL)isRetina;
+ (BOOL)isIPAD;
+ (BOOL)isIPHONE;
@end
