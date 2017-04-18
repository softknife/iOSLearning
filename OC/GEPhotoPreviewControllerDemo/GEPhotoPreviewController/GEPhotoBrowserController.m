//
//  GEPhotoBrowserController.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEPhotoBrowserController.h"
#import "GEPhotoBrowserCell.h"
#import "UIView+Extension.h"
#import "UIScreen+Extension.h"
#import "PhotoBrowserObject.h"
//#import "GEUIManager+Album.h"
#import "GEOrderMenuView.h"

#import "UIImage+GESDImageCache.h"

@interface GEPhotoBrowserController ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
GEPhotoBrowserCellDelegate,
UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeightConstraint;

/** collectionView 顶部高度*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConsTop;
/** collectionView 底部高度*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConsBottom;

@end

@implementation GEPhotoBrowserController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.frame = [UIScreen bounds];
    self.view.GE_w += 15;

    self.titleLabel.GE_w = [UIScreen screenWidth];
    self.pageControl.GE_w = self.titleLabel.GE_w;
    
    self.topViewTopConstraint.constant = 0;
    self.collectionViewConsTop.constant  = 0;
    self.collectionViewConsBottom.constant = 0;
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GEPhotoBrowserCell class]) bundle:nil] forCellWithReuseIdentifier:photoBrowserCellId];
    
    if (self.topViewConfigBlock) {
        
        self.titleLabel.hidden = YES;
        self.topViewConfigBlock(self.topView,self.topViewHeightConstraint);
    }else{
        
        self.titleLabel.hidden = self.photoObjects.count == 1?YES:NO;
        
        self.topViewHeightConstraint.constant = self.photoObjects.count == 1?0:self.topViewHeightConstraint.constant;
        
        self.titleLabel.text = [NSString stringWithFormat:@"%zd/%zd",self.selectIndexPath.selectPage + 1,self.photoObjects.count];
    }
    
    
    if (self.bottomViewConfigBlock) {
        
        self.pageControl.hidden = YES;
        self.bottomViewConfigBlock(self.bottomView,self.bottomViewHeightConstraint);

    }else{
        
        self.pageControl.hidden = self.photoObjects.count == 1 || self.photoObjects.count > 10  ? YES:NO;
        
        self.bottomViewHeightConstraint.constant = self.photoObjects.count == 1?0:self.bottomViewHeightConstraint.constant;
        
        self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageControl.numberOfPages = self.photoObjects.count;
        self.pageControl.currentPage = self.selectIndexPath.selectPage;
    }
    

}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.collectionView scrollToItemAtIndexPath:self.selectIndexPath.indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

}

- (void)dealloc
{
    self.collectionView.delegate = nil;
    self.collectionView.dataSource = nil;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

    // 复原1.0缩放比例
    GEPhotoBrowserCell *phCell = (GEPhotoBrowserCell *)cell;
    phCell.imageScrollView.zoomScale = 1.0;

}
#pragma mark - DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.photoObjects.count?1:0;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.photoObjects.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GEPhotoBrowserCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoBrowserCellId forIndexPath:indexPath];
    cell.delegate = self;
    cell.photoObject = self.photoObjects[indexPath.row];
    
    return cell;
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
     [self relocateCurrentPage];

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     [self relocateCurrentPage];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self relocateCurrentPage];
}

- (void)relocateCurrentPage
{
    CGFloat offsetX = self.collectionView.contentOffset.x;
    NSInteger currentPage = offsetX / self.collectionView.GE_w;
    self.pageControl.currentPage = currentPage;
    self.selectIndexPath.selectPage = currentPage;
    self.titleLabel.text = [NSString stringWithFormat:@"%zd/%zd",currentPage + 1,self.photoObjects.count];
}


#pragma mark - GEPhotoBrowserCellDelegate
- (BOOL)photoBrowserCell:(GEPhotoBrowserCell *)cell triggerGesture:(GEPhotoBrowserCellGesture)gesture
{
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];

    switch (gesture) {
            
        case GEPhotoBrowserCellGestureTapOne:
        {
           
            if ([self.delegate respondsToSelector:@selector(photoBrowser:tapImageView:item:)]) {
                [self.delegate photoBrowser:self tapImageView:cell.photoObject item:indexPath.item];
            }
            return YES;
        }
            break;
            
        case GEPhotoBrowserCellGestureTapTwo:
        {
            
            return YES;
        }
            break;
        case GEPhotoBrowserCellGestureLongPress:
        {
            // 原图不存在的时候就不让长按保存
            UIImage *image = [UIImage GE_getSDCacheDiskImageByUrlString:cell.photoObject.orignalUrl];
            image = image?:[UIImage imageWithContentsOfFile:cell.photoObject.origalLocalPath];
            
            
            if (image) {
                
                if ([self.delegate respondsToSelector:@selector(photoBrowser:longPressImageViewObject:image:item:)]) {
                    [self.delegate photoBrowser:self longPressImageViewObject:cell.photoObject image:cell.imageView.image item:indexPath.item];
                }
                
            }
            
            return YES;
            
        }
            break;
        default:
            
            return YES;
            break;
    }
    
}

#pragma mark - GEPhotoBrowserAnimationDismissDataSource
- (UIImageView *)imageViewForPhotoBrowserAnimationDismiss
{
    return [self imageViewForPhotoBrowserAnimationPresent];
}

- (UIImageView *)imageViewForPhotoBrowserAnimationPresent
{
    PhotoBrowserObject *photoObject = self.photoObjects[self.selectIndexPath.selectPage];

    return [GEPhotoBrowserCell imageViewForPhotoBrowserAnimationPresent:photoObject];
}

- (CGRect)startRectForPhotoBrowserAnimationDismiss
{
    return [self endRectForPhotoBrowserAnimationPresent];
}

- (CGRect)endRectForPhotoBrowserAnimationPresent
{
    PhotoBrowserObject *photoObject = self.photoObjects[self.selectIndexPath.selectPage];

    CGRect originalRect = CGRectZero;
    originalRect.origin.x = 0;
    originalRect.origin.y = self.collectionViewConsTop.constant;
    originalRect.size.width = [UIScreen screenWidth];
    originalRect.size.height = [UIScreen screenHeight] - self.collectionViewConsTop.constant - self.collectionViewConsBottom.constant;
    return [GEPhotoBrowserCell getBigImageRectWithImage:photoObject originalImageRect:originalRect thumImageYMargin:self.collectionViewConsTop.constant];
}




























//更新图片
- (void)updateImage:(RKCloudChatBaseMessage *)messageObject
{

    GEPhotoBrowserCell *cell = [self.collectionView visibleCells].firstObject;

    [cell updateImage:messageObject];

}



//隐藏旋转框
- (void)hideProgress:(RKCloudChatBaseMessage *)messageObject{

    GEPhotoBrowserCell *cell = [self.collectionView visibleCells].firstObject;

    [cell hideProgress:messageObject];

}





@end

