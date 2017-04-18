//
//  UIView+GEAdd.m
//  DiscoverDemo
//
//  Created by Eric on 15/12/3.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "UIView+GEAdd.h"

@implementation UIView (GEAdd)
- (void)setGe_x:(CGFloat)ge_x
{
    CGRect frame = self.frame;
    frame.origin.x = ge_x;
    self.frame = frame;
}

- (void)setGe_y:(CGFloat)ge_y
{
    CGRect frame = self.frame;
    frame.origin.y = ge_y;
    self.frame = frame;
}


- (void)setGe_centerX:(CGFloat)ge_centerX
{
    CGPoint center = self.center;
    center.x = ge_centerX;
    self.center = center;
}

- (CGFloat)ge_centerX {
    return self.center.x;
}

- (void)setGe_centerY:(CGFloat)ge_centerY{
    CGPoint center = self.center;
    center.y = ge_centerY;
    self.center = center;
}

- (CGFloat)ge_centerY {
    return self.center.y;
}

- (CGFloat)ge_x
{
    return self.frame.origin.x;
}


- (CGFloat)ge_maxX
{
    return self.ge_x + self.ge_w;
}


- (CGFloat)ge_y
{
    return self.frame.origin.y;
}

- (CGFloat)ge_maxY
{
    return self.ge_y + self.ge_h;
}

- (void)setGe_w:(CGFloat)ge_w
{
    CGRect frame = self.frame;
    frame.size.width = ge_w;
    self.frame = frame;
}
- (void)setGe_h:(CGFloat)ge_h
{
    CGRect frame = self.frame;
    frame.size.height = ge_h;
    self.frame = frame;
}

- (CGFloat)ge_h
{
    return self.frame.size.height;
}

- (CGFloat)ge_w
{
    return self.frame.size.width;
}
- (void)setGe_size:(CGSize)ge_size
{
    CGRect frame = self.frame;
    frame.size = ge_size;
    self.frame = frame;
}

- (CGSize)ge_size
{
    return self.frame.size;
}

- (void)setGe_origin:(CGPoint)ge_origin
{
    CGRect frame = self.frame;
    frame.origin = ge_origin;
    self.frame = frame;
}

- (CGPoint)ge_origin
{
    return self.frame.origin;
}

- (CGFloat)ge_boundsW
{
    return self.bounds.size.width;
}
- (CGFloat)ge_boundsH
{
    return self.bounds.size.height;
}
@end
