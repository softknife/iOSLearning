//
//  EASearchMaskView.m
//  EAppleNFB
//
//  Created by apple on 2017/5/17.
//  Copyright © 2017年 Eapple. All rights reserved.
//

#import "EASearchMaskView.h"

@implementation EASearchMaskView

+ (instancetype)maskView
{
    EASearchMaskView *mask = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EASearchMaskView class]) owner:nil options:nil].firstObject;
    return mask;
}

@end
