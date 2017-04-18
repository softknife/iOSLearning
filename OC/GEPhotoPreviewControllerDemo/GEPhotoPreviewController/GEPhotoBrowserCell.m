//
//  GEPhotoBrowserCell.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEPhotoBrowserCell.h"
#import "PhotoBrowserObject.h"
#import "UIImage+GESDImageCache.h"
#import "UIImageView+GEWebCache.h"
#import "NSString+GESDCache.h"
#import "UIScreen+Extension.h"
#import "UIView+Extension.h"
#import "AlbumInfoTable.h"

#import "RKCloudChat.h"
#import "RKCloudChatMessageManager.h"

#import "GETabBarController.h"
NSString *const photoBrowserCellId = @"PhotoBrowserCellID";

@interface GEPhotoBrowserCell ()<UIScrollViewDelegate>
@property (weak, nonatomic)  UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic)  UILongPressGestureRecognizer *longPressGesture;


@property (weak, nonatomic) UIActivityIndicatorView *activityView;
/** activity*/
//@property (nonatomic , weak) UIActivityIndicatorView *activity;

@end
@implementation GEPhotoBrowserCell


- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.tapGesture.numberOfTapsRequired = 2;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.clipsToBounds = YES;

    [self.imageScrollView addSubview:imageView];
    _imageView = imageView;


    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.frame = CGRectMake([UIScreen screenWidth]/2 - 16, [UIScreen screenHeight]/2 - 16, 32, 32);
    _activityView = activityView;

    activityView.hidesWhenStopped = YES;
    [self.imageScrollView addSubview:activityView];

    
    self.imageScrollView.maximumZoomScale = 2.0;
    self.imageScrollView.bouncesZoom = YES;
    self.imageScrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    //设置最小伸缩比例
    self.imageScrollView.minimumZoomScale = 1.0;
    self.imageScrollView.delegate = self;
    self.imageScrollView.showsVerticalScrollIndicator = NO;
    self.imageScrollView.showsHorizontalScrollIndicator = NO;
    

    // 手势
    UITapGestureRecognizer *tapOneGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOne:)];
    [self addGestureRecognizer:tapOneGesture];
    
    UITapGestureRecognizer *tapTwoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwo:)];
    tapTwoGesture.numberOfTapsRequired = 2;
    [self.contentView addGestureRecognizer:tapTwoGesture];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.contentView addGestureRecognizer:longPress];
    
    [tapOneGesture requireGestureRecognizerToFail:tapTwoGesture];



    [iOSNotificationCenter addObserver:self
                              selector:@selector(updataMmsProgressNotification:)
                                  name:kRKCloudUpdateMMSProgressNotification
                                object:nil];

}

-(void)dealloc {

    [iOSNotificationCenter removeObserver:self name:kRKCloudUpdateMMSProgressNotification object:nil];
}


- (void)layoutSubviews
{
    [super layoutSubviews];

//    if (self.activity && ![self.activity isAnimating]) {
//        
//        [self.activity startAnimating];
//    }
    
  
    self.imageScrollView.contentSize = CGSizeMake(self.GE_w, self.GE_h);
    self.imageView.frame = self.bounds;
    self.imageView.GE_w = [UIScreen screenWidth];
}

#pragma mark - Data
- (void)setPhotoObject:(PhotoBrowserObject *)photoObject
{
    _photoObject = photoObject;
    
  
    self.imageScrollView.zoomScale = 1.0;

    if (![UIImage imageExistAtPath:photoObject.orignalUrl]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
    }

    [self.activityView stopAnimating];

    switch (photoObject.photoType) {
        case PhotoBrowserObjectTypeNet:
        {
            getWeakSelf;
            [self.imageView GE_setOrignalImageViewWithThumbURLString:photoObject.thumbnailUrl orignalUrlString:photoObject.orignalUrl completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                
                weakSelf.imageView.contentMode = UIViewContentModeScaleAspectFit;
                
            }];
            
        }
            break;
        case PhotoBrowserObjectTypeLocal:
        {
            self.imageView.image = [[UIImage alloc]initWithContentsOfFile:photoObject.origalLocalPath];
            self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        }
            break;

        case PhotoBrowserObjectTypeSession:
        {
            UIImage *thumbnailImage = [UIImage imageWithContentsOfFile:photoObject.thumbLocalPath];
            UIImage *localImage = [UIImage imageWithContentsOfFile:photoObject.origalLocalPath];

            if (!localImage) {
                self.imageView.contentMode = UIViewContentModeCenter;
                self.imageView.image = thumbnailImage;

                [self.activityView startAnimating];
               [RKCloudChatMessageManager downMediaFile:photoObject.extention];

            }else{

                self.imageView.image = localImage;
                self.imageView.contentMode = UIViewContentModeScaleAspectFit;
            }

        }
            break;

        default:
            break;
    }
    
//    self.imageScrollView.zoomScale = photoObject.zoomScale;
    
}



#pragma mark -  UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    self.photoObject.zoomScale = scale;
}

#pragma mark - Event
- (void)tapOne:(UITapGestureRecognizer *)sender{
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        if ([self.delegate respondsToSelector:@selector(photoBrowserCell:triggerGesture:)]) {
            
            [self.delegate photoBrowserCell:self triggerGesture:GEPhotoBrowserCellGestureTapOne];
           
        }
    }
}
- (void)tapTwo:(UITapGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        
        if ([self.delegate respondsToSelector:@selector(photoBrowserCell:triggerGesture:)]) {
            
            BOOL result = [self.delegate photoBrowserCell:self triggerGesture:GEPhotoBrowserCellGestureTapTwo];

            if (result) {
                
                if (self.imageScrollView.zoomScale == self.imageScrollView.maximumZoomScale) {
                    
                    [self zoomImageView:self.imageScrollView.minimumZoomScale];
                }else{
                    [self zoomImageView:self.imageScrollView.maximumZoomScale];

                }
            }
        }
    }
}
- (void)longPress:(UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        if ([self.delegate respondsToSelector:@selector(photoBrowserCell:triggerGesture:)]) {
            
            [self.delegate photoBrowserCell:self triggerGesture:GEPhotoBrowserCellGestureLongPress];
        }
    }
}


- (void)zoomImageView:(CGFloat)scale
{
    [self.imageScrollView setZoomScale:scale animated:YES];
}

#pragma mark - Public
+ (CGRect)getBigImageRectWithImage:(PhotoBrowserObject *)photoObject originalImageRect:(CGRect)origImageRect thumImageYMargin:(CGFloat)yMargin
{
//    UIImage *image = [UIImage GE_getSDCacheDiskImageByUrlString:photoObject.orignalUrl];
//    
//    BOOL hasBigImage = image?YES:NO;
//    image = image?:[UIImage GE_getSDCacheDiskImageByUrlString:photoObject.thumbnailUrl];
//    image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];
    
    UIImage *image = nil;
    
    BOOL hasBigImage = NO;
    
    switch (photoObject.photoType) {
        case PhotoBrowserObjectTypeNet:
        {
            image = [UIImage GE_getSDCacheDiskImageByUrlString:photoObject.orignalUrl];
            hasBigImage = image?YES:NO;
            image = image?:[UIImage GE_getSDCacheDiskImageByUrlString:photoObject.thumbnailUrl];
            image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];
            
        }
            break;
        case PhotoBrowserObjectTypeLocal:
        {
            image = [[UIImage alloc]initWithContentsOfFile:photoObject.origalLocalPath];
            hasBigImage = image?YES:NO;
            image = image?:[[UIImage alloc] initWithContentsOfFile:photoObject.thumbLocalPath];
            image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];

        }
            break;
        case PhotoBrowserObjectTypeSession:
        {
            image = [UIImage imageWithContentsOfFile:photoObject.origalLocalPath];
            
            hasBigImage = image?YES:NO;
            
            image = image?:[UIImage imageWithContentsOfFile:photoObject.thumbLocalPath];
            image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];

        }
            break;
        default:
            break;
    }
    
    CGRect imageRect = CGRectZero;
    if (hasBigImage) {
        imageRect = origImageRect;

    }else{
        imageRect.origin.x = ([UIScreen screenWidth] - image.size.width ) * .5;
        imageRect.origin.y =  yMargin + ([UIScreen screenHeight] - yMargin - image.size.height ) * .5;
        imageRect.size = image.size;
    }

    
    return imageRect;
}

+ (UIImageView *)imageViewForPhotoBrowserAnimationPresent:(PhotoBrowserObject *)photoObject
{
    UIImage *image = nil;
    
    BOOL hasBigImage = NO;
    
    switch (photoObject.photoType) {
        case PhotoBrowserObjectTypeNet:
        {
            image = [UIImage GE_getSDCacheDiskImageByUrlString:photoObject.orignalUrl];
            hasBigImage = image?YES:NO;
            image = image?:[UIImage GE_getSDCacheDiskImageByUrlString:photoObject.thumbnailUrl];
            image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];
            
        }
            break;
        case PhotoBrowserObjectTypeLocal:
        {
            image = [[UIImage alloc]initWithContentsOfFile:photoObject.origalLocalPath];
            hasBigImage = image? YES:NO;
            image = image?:[[UIImage alloc] initWithContentsOfFile:photoObject.thumbLocalPath];
            image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];

        }
            break;
        case PhotoBrowserObjectTypeSession:
        {
            image = [UIImage imageWithContentsOfFile:photoObject.origalLocalPath];
            hasBigImage = image?YES:NO;
            image = image?:[UIImage imageWithContentsOfFile:photoObject.thumbLocalPath];
            image = image?:[UIImage imageNamed:GEImageDefaultAttachPlaceholder];

        }
            break;
        default:
            break;
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = hasBigImage? UIViewContentModeScaleAspectFit:UIViewContentModeCenter;
    imageView.clipsToBounds = YES;
    
    return imageView;
}
















#pragma mark - GEChatSession


#pragma mark -kRKCloudUpdateMMSProgressNotification 更新下载进度
- (void)updataMmsProgressNotification:(NSNotification *)note {

    /*
     NSConcreteNotification 0x188f94e0 {name = UpdateMMSProgress; object = 0.0550585; userInfo = {
     id = "2100130201-1484012787-004";
     }}

     **/
    if ([note object] && [note userInfo])
    {
        // 得到此消息的MessageID
        NSDictionary *progressMsidDict = [[NSDictionary alloc] initWithDictionary:[note userInfo]];
        NSString *msgID = [progressMsidDict objectForKey:@"id"];

        // 若通知消息的ID与当前消息的ID相同则修改百分比值
        if ([self.photoObject.extention isEqualToString:msgID])
        {
            // 得到的百分比值
            float progressValue = [[note object] floatValue];

            // 保存进度值，当下载中退出该页面再进入该页面时读取progressDic中对应的进度数据 普通会话
            if ([GETabBarController sessionListController].messageSessionViewController)
            {
                [[GETabBarController sessionListController].progressDic setObject:[NSString stringWithFormat:@"%0.f", progressValue*100] forKey:msgID];
            }
        }
    }
}


//更新图片显示
- (void)updateImage:(RKCloudChatBaseMessage *)message {

    if ([self.photoObject.extention isEqual:message.messageID])
    {
        // 获取消息对象中完整的文件保存路径（非略缩图）
        NSString * imageFilePath = ((ImageMessage *)message).fileLocalPath;
        // 获取显示图片
        UIImage *displayImage = [[UIImage alloc] initWithContentsOfFile:imageFilePath];
        // 设置显示图片
        self.imageView.image = displayImage;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;

        [self.activityView stopAnimating];

        if ([self.photoObject.extention isEqualToString:message.messageID]) {
            [RKCloudChatMessageManager updateMsgStatusHasReaded:message.messageID];
        }
    }

    [self setNeedsDisplay];
}


//隐藏旋转框
- (void)hideProgress:(RKCloudChatBaseMessage *)messageObject {

    if ([self.photoObject.extention isEqual:messageObject.messageID])
    {
        // 停止下载旋转等待提示
        [self.activityView stopAnimating];
    }
    [self setNeedsDisplay];
    
}



@end
