//
//  ViewController.m
//  GEMenuControllerDemo
//
//  Created by hjp on 17/4/17.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ViewController.h"
#import "GEMenuController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [GEMenuController showMenu];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
