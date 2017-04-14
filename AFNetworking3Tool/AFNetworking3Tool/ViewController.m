//
//  ViewController.m
//  AFNetworking3Tool
//
//  Created by hjp on 17/4/13.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ViewController.h"
#import "GENetworkTool.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [GENetworkTool request:nil success:nil failure:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
