//
//  ViewController.m
//  OCCallSwift
//
//  Created by 黄继平 on 2016/11/20.
//  Copyright © 2016年 PJStudio. All rights reserved.
//

#import "ViewController.h"
#import "OCCallSwift-Swift.h"


/*
    注意事项:
    1.项目名称不可以乱起;
    2.Swift中所有类/属性/方法都必须使用public或者open修饰;
    3.OC中导入"项目名-Swift.h"
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CustomButton *button = [[CustomButton alloc] init];
    button.customTitle = @"octitle";
    
    button.backgroundColor = [UIColor redColor];
    [button sizeToFit];
    
    [self.view addSubview:button];
    
    
}

@end
