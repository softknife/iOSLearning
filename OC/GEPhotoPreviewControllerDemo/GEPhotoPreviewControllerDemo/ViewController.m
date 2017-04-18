//
//  ViewController.m
//  GEPhotoPreviewControllerDemo
//
//  Created by hjp on 17/4/18.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ViewController.h"
#import "GEPhotoPreviewController.h"
#import "UIScreen+GEAdd.h"

@interface ViewController ()<GEPhotoPreviewControllerDelegate,GEPhotoPreviewControllerAnimationDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    GEPreviewInnerObject *photoObject = [[GEPreviewInnerObject alloc] init];
    
    photoObject.praceholder = @"yx_mm_gpres";
    
    photoObject.photoType = GEPreviewInnerObjectTypeLocal;
    
    GEPhotoPreviewController *photoPreview = [GEPhotoPreviewController previewByPhotoObjects:@[photoObject] selectIndex:0];
    
    photoPreview.delegate = self;
    photoPreview.dataSource = self;
    
    [self.navigationController presentViewController:photoPreview animated:YES completion:nil];
}

#pragma mark - GEPhotoPreviewControllerAnimationDataSource
- (CGRect)startRectForPhotoPreviewAnimation:(NSIndexPath *)animateIndexPath
{
    CGRect bounds = [UIScreen bounds];
    return CGRectMake(bounds.size.width * 0.4, bounds.size.height * 0.4, 50, 50);
}

- (void)photoPreview:(GEPhotoPreviewController *)photoBrowser longPressImageViewObject:(GEPreviewInnerObject *)photoObject image:(UIImage *)image item:(NSInteger)item
{
    NSLog(@"长按");
}


@end
