//
//  GEPhotoBrowserController.m
//  ExcellentLearning
//
//  Created by hjp on 16/11/25.
//  Copyright © 2016年 西安恒谦教育科技股份有限公司. All rights reserved.
//

#import "GEPhotoPreviewController.h"
#import "GEPhotoPreviewCell.h"
#import "GEPreviewInnerObject.h"

#import "GECustomTransition.h"

#import "UIView+GEAdd.h"
#import "UIScreen+GEAdd.h"
#import "UIImage+GESDImageCache.h"

@interface GEPhotoPreviewController ()<
UICollectionViewDelegate,
UICollectionViewDataSource,
GEPhotoPreviewCellDelegate,
UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewConsHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewConsTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewConsHeight;

/** collectionView 顶部高度*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConsTop;
/** collectionView 底部高度*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewConsBottom;

/** transition*/
@property (nonatomic , strong) GECustomTransition *transition;

/** 记录顶部提示条初始高度*/
@property (nonatomic , assign) CGFloat topViewInitialHeight;
/** 记录底部提示条初始高度*/
@property (nonatomic , assign) CGFloat bottomViewInitialHeight;

@end

@implementation GEPhotoPreviewController


#pragma mark - Init

+ (instancetype)previewByPhotoObjects:(NSArray<GEPreviewInnerObject *> *)photoObjects selectIndex:(NSInteger)selectIndex
{
    
    GEPhotoPreviewController *previewController = [[self alloc] initByObjects:photoObjects selectIndex:selectIndex];

    previewController.transition = [previewController configAnimation];
    
    previewController.modalPresentationStyle = UIModalPresentationCustom;
    previewController.transitioningDelegate = previewController.transition;
    previewController.modalPresentationCapturesStatusBarAppearance = YES;
    
    return previewController;
}

- (instancetype)initByObjects:(NSArray<GEPreviewInnerObject *> *)photoObjects selectIndex:(NSInteger)selectIndex
{
    if (self = [super init]) {
        
        _photoObjects = photoObjects;
        
        _selectIndexPath = [GEIndexPath new];
        _selectIndexPath.selectPage = selectIndex;
        
    }
    
    return self;
}

- (GECustomTransition *)configAnimation
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    
    GECustomTransition *transition = [GECustomTransition transition];
    
//    NSTimeInterval duration = 0.4;
    GECustomTransitionStyle *style = [GECustomTransitionStyle styleWithRect:bounds transitionDuration:0.4];
    
    style.needMaskView = NO;
    //    [style configStatusBarConditionWhenPresentationOccurWithHide:YES animation:UIStatusBarAnimationFade];
    
    transition.transitionStyle = style;
    _style = style;
    
    
    
    __weak typeof (self) weakSelf = self;
    style.customPresent = ^(UIView *animateView,id<UIViewControllerContextTransitioning> transitionContext){
        
        
        // 调整view的透明度，颜色
        animateView.superview.backgroundColor = [UIColor blackColor];
        animateView.hidden = YES;
        animateView.superview.alpha = 0;
        
        // 占位图，frame
        UIImageView *imageView = [weakSelf imageViewForPhotoPreviewAnimationPresent];
        CGRect beginRect = [weakSelf.dataSource startRectForPhotoPreviewAnimation:weakSelf.selectIndexPath.indexPath];
        imageView.frame = beginRect;
        [animateView.superview addSubview:imageView];
        
        
        [UIView animateWithDuration:weakSelf.style.transitionDuration animations:^{
            
            // 调整view的透明度，颜色
            animateView.superview.alpha = 1;
            imageView.frame = [weakSelf endRectForPhotoPreviewAnimationPresent];
            
        } completion:^(BOOL finished) {

            // 调整view的透明度，颜色
            animateView.hidden = NO;
            animateView.superview.backgroundColor = [UIColor clearColor];
            
            [imageView removeFromSuperview];
            [transitionContext completeTransition:YES];
            
        }];
        
    };
    
    style.customDismiss = ^(UIView *animateView,id<UIViewControllerContextTransitioning> transitionContext){
        
        // 调整view的透明度，颜色
        animateView.hidden = YES;
        animateView.superview.backgroundColor = [UIColor blackColor];
        
        
        // 占位图，frame
        UIImageView *imageView = [weakSelf imageViewForPhotoPreviewAnimationDismiss];
        
        imageView.frame = [weakSelf startRectForPhotoPreviewAnimationDismiss];
        [animateView.superview addSubview:imageView];
        
        
        [UIView animateWithDuration:weakSelf.style.transitionDuration animations:^{
            
            // 调整view的透明度，颜色
            animateView.superview.alpha = 0;

            // 占位图，frame
            CGRect endRect = [weakSelf.dataSource startRectForPhotoPreviewAnimation:weakSelf.selectIndexPath.indexPath];
            if (!CGRectEqualToRect(endRect, CGRectZero) && !CGRectEqualToRect(endRect, CGRectNull)) {
                imageView.frame = endRect;
                
            }else{
                imageView.transform = CGAffineTransformMakeScale(1.5, imageView.image.size.width / imageView.image.size.height * 1.5);
                
            }
            
        } completion:^(BOOL finished) {
            
            // 调整view的透明度，颜色
            animateView.superview.alpha = 1;
            animateView.superview.backgroundColor = [UIColor clearColor];

            [imageView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
        
        
        
    };
    
    
    return transition;
    
}


#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.frame = [UIScreen bounds];
    self.view.ge_w += 15;
    self.titleLabel.ge_w = [UIScreen screenWidth];
    self.pageControl.ge_w = self.titleLabel.ge_w;

    [self configSubViews];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.collectionView scrollToItemAtIndexPath:self.selectIndexPath.indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

    });

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

- (void)configSubViews
{

    
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([GEPhotoPreviewCell class]) bundle:nil] forCellWithReuseIdentifier:photoBrowserCellId];
    
    if (self.topViewConfigBlock) {
        
        self.titleLabel.hidden = YES;
        self.topViewConfigBlock(self.topView,self.topViewConsHeight);
    }else{
        
        self.titleLabel.hidden = self.photoObjects.count == 1?YES:NO;
        self.topViewConsHeight.constant = self.photoObjects.count == 1?0:self.topViewConsHeight.constant;
        
    }
    
    
    if (self.bottomViewConfigBlock) {
        
        self.pageControl.hidden = YES;
        self.bottomViewConfigBlock(self.bottomView,self.bottomViewConsHeight);
        
    }else{
        
        self.pageControl.hidden = self.photoObjects.count == 1 || self.photoObjects.count > 10  ? YES:NO;
        
        self.bottomViewConsHeight.constant = self.photoObjects.count == 1?0:self.bottomViewConsHeight.constant;
        
       
      
    }
    
    // 记录初始高度
    self.topViewInitialHeight = self.topViewConsHeight.constant;
    self.bottomViewInitialHeight = self.bottomViewConsHeight.constant;
    
    // 顶部指示条显示样式
    if (self.topViewConsHeight.constant > 0) {
        self.titleLabel.text = [NSString stringWithFormat:@"%zd/%zd",self.selectIndexPath.selectPage + 1,self.photoObjects.count];
    }
    
    // 底部指示条显示样式
    if (self.bottomViewConsHeight.constant > 0) {
        self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        self.pageControl.numberOfPages = self.photoObjects.count;
        self.pageControl.currentPage = self.selectIndexPath.selectPage;
    }

}




#pragma mark - UICollectionViewDataSource
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
    GEPhotoPreviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoBrowserCellId forIndexPath:indexPath];
    cell.delegate = self;
    cell.photoObject = self.photoObjects[indexPath.row];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 复原1.0缩放比例
    GEPhotoPreviewCell *phCell = (GEPhotoPreviewCell *)cell;
    phCell.imageScrollView.zoomScale = 1.0;
    
}


#pragma mark - UIScrollViewDelegate

// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
//{
//     [self relocateCurrentPage];
//
//}
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
    NSInteger currentPage = offsetX / self.collectionView.ge_w;
    self.pageControl.currentPage = currentPage;
    self.selectIndexPath.selectPage = currentPage;
    self.titleLabel.text = [NSString stringWithFormat:@"%zd/%zd",currentPage + 1,self.photoObjects.count];
}


#pragma mark - GEPhotoBrowserCellDelegate
- (BOOL)photoPreviewCell:(GEPhotoPreviewCell *)cell triggerGesture:(GEPhotoPreviewCellGesture)gesture
{
    
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];

    switch (gesture) {
            
        case GEPhotoPreviewCellGestureTapOne:
        {
           
//            if (self.photoObjects.count == 1) {
//                [self dismissViewControllerAnimated:YES completion:nil];
//            }else{
//                
//              
//                if (self.topView.hidden) {
//                    self.topView.hidden = NO;
//                }
//                if (self.bottomView.hidden) {
//                    self.bottomView.hidden = NO;
//                }
//                
//                self.topViewConsHeight.constant = self.topViewConsHeight.constant == self.topViewInitialHeight?0:self.topViewInitialHeight;
//                self.bottomViewConsHeight.constant = self.bottomViewConsHeight.constant == self.bottomViewInitialHeight?0:self.bottomViewInitialHeight;
//                
//                [UIView animateWithDuration:0.25 animations:^{
//                    
//                    [self.view layoutIfNeeded];
//                    
//                } completion:^(BOOL finished) {
//                    
//                    self.topView.hidden = self.topViewConsHeight.constant?NO:YES;
//                    self.bottomView.hidden = self.bottomViewConsHeight.constant?NO:YES;
//                }];
//               
//                
//            }
            
            if ([self.delegate respondsToSelector:@selector(photoPreview:tapImageView:item:)]) {
                [self.delegate photoPreview:self tapImageView:cell.photoObject item:indexPath.item];
            }
            return YES;
        }
            break;
            
        case GEPhotoPreviewCellGestureTapTwo:
        {
            
            return YES;
        }
            break;
        case GEPhotoPreviewCellGestureLongPress:
        {
            // 原图不存在的时候就不让长按保存
            UIImage *image = [UIImage ge_getSDCacheDiskImageByUrlString:cell.photoObject.orignalUrl];
            image = image?:[UIImage imageWithContentsOfFile:cell.photoObject.origalLocalPath];
            
            
            if (image) {
                
                if ([self.delegate respondsToSelector:@selector(photoPreview:longPressImageViewObject:image:item:)]) {
                    [self.delegate photoPreview:self longPressImageViewObject:cell.photoObject image:cell.imageView.image item:indexPath.item];
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




#pragma mark - GEPhotoPreviewAnimationDataSource
- (UIImageView *)imageViewForPhotoPreviewAnimationDismiss
{
    return [self imageViewForPhotoPreviewAnimationPresent];
}

- (UIImageView *)imageViewForPhotoPreviewAnimationPresent
{
    GEPreviewInnerObject *photoObject = self.photoObjects[self.selectIndexPath.selectPage];

    return [GEPhotoPreviewCell imageViewForPhotoBrowserAnimationPresent:photoObject];
}

- (CGRect)startRectForPhotoPreviewAnimationDismiss
{
    return [self endRectForPhotoPreviewAnimationPresent];
}

- (CGRect)endRectForPhotoPreviewAnimationPresent
{
    GEPreviewInnerObject *photoObject = self.photoObjects[self.selectIndexPath.selectPage];

    CGRect originalRect = CGRectZero;
    originalRect.origin.x = 0;
    originalRect.origin.y = self.collectionViewConsTop.constant;
    originalRect.size.width = [UIScreen screenWidth];
    originalRect.size.height = [UIScreen screenHeight] - self.collectionViewConsTop.constant - self.collectionViewConsBottom.constant;
    return [GEPhotoPreviewCell getBigImageRectWithImage:photoObject originalImageRect:originalRect thumImageYMargin:self.collectionViewConsTop.constant];
}









@end

