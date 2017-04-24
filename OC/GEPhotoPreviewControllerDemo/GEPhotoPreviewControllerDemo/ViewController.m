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
    photoObject.thumbnailUrl = @"https://avatars1.githubusercontent.com/u/10254305?v=3&u=373d7bf218f00f8a3d55b4cec1c2fda40babadbd&s=400";
    photoObject.orignalUrl = @"https://avatars1.githubusercontent.com/u/10254305?v=3&u=373d7bf218f00f8a3d55b4cec1c2fda40babadbd&s=400";
    
    photoObject.photoType = GEPreviewInnerObjectTypeNet;
    
    
    GEPreviewInnerObject *photoObject1 = [[GEPreviewInnerObject alloc] init];
    
    photoObject1.praceholder = @"yx_mm_gpres";
    photoObject1.thumbnailUrl = @"https://avatars1.githubusercontent.com/u/10254305?v=3&u=373d7bf218f00f8a3d55b4cec1c2fda40babadbd&s=400";
    photoObject1.orignalUrl = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1492576419788&di=95572b657eadc0346e5935d85f34cd48&imgtype=0&src=http%3A%2F%2Fs15.sinaimg.cn%2Fmw690%2F003vNYwKgy6EdhlrawKae%26690";
    
    photoObject1.photoType = GEPreviewInnerObjectTypeNet;
    
    GEPreviewInnerObject *photoObject2 = [[GEPreviewInnerObject alloc] init];

    photoObject2.praceholder = @"yx_mm_gpres";
    photoObject2.thumbnailUrl = @"https://avatars1.githubusercontent.com/u/10254305?v=3&u=373d7bf218f00f8a3d55b4cec1c2fda40babadbd&s=400";
    photoObject2.orignalUrl = @"https://imgsa.baidu.com/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=ca5abb5b7bf0f736ccf344536b3cd87c/29381f30e924b899c83ff41c6d061d950a7bf697.jpg";
    
    photoObject2.photoType = GEPreviewInnerObjectTypeNet;
    
    
    GEPhotoPreviewController *photoPreview = [GEPhotoPreviewController previewByPhotoObjects:@[photoObject,photoObject1,photoObject2] selectIndex:1 ];
    
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
- (void)photoPreview:(GEPhotoPreviewController *)photoBrowser tapImageView:(GEPreviewInnerObject *)photoObject item:(NSInteger)item
{
//    [self dismissViewControllerAnimated:YES completion:nil];

}
- (void)photoPreview:(GEPhotoPreviewController *)photoBrowser longPressImageViewObject:(GEPreviewInnerObject *)photoObject image:(UIImage *)image item:(NSInteger)item
{
    NSLog(@"长按");
}


@end
