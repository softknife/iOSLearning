//
//  CustomButton.m
//  SwiftCallOC
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

#import "CustomButton.h"
#import "SwiftCallOC-Swift.h"

@implementation CustomButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    ViewController *vc = [[ViewController alloc] init];
    vc.view.backgroundColor = [UIColor greenColor];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
    
}

@end
