//
//  UIView+GEAdd.h
//  DiscoverDemo
//
//  Created by Eric on 15/12/3.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GEAdd)
@property (nonatomic, assign) CGFloat ge_x;
@property (nonatomic, assign, readonly) CGFloat ge_maxX;

@property (nonatomic, assign) CGFloat ge_y;
@property (nonatomic, assign , readonly) CGFloat ge_maxY;

@property (nonatomic, assign) CGFloat ge_w;
@property (nonatomic, assign) CGFloat ge_h;
@property (nonatomic, assign) CGSize ge_size;
@property (nonatomic, assign) CGPoint ge_origin;
@property (nonatomic, assign) CGFloat ge_centerX;
@property (nonatomic, assign) CGFloat ge_centerY;
/** boundsWidth*/
@property (nonatomic , assign, readonly) CGFloat ge_boundsW;
/** boundsHeight*/
@property (nonatomic , assign, readonly) CGFloat ge_boundsH;
@end
