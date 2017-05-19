//
//  EASaleSearchController.m
//  EAppleNFB
//
//  Created by apple on 2017/5/15.
//  Copyright © 2017年 Eapple. All rights reserved.
//

#import "EASearchController.h"

#import <PureLayout.h>



@interface EASearchController ()<
UITableViewDelegate,
UITableViewDataSource>

@property (strong,nonatomic) NSArray *models;

/** maskWindow*/
@property(nonatomic,weak)UIView *effectWindow;

/** maskView*/
@property(nonatomic,weak) UIView *maskView;

@property(nonatomic,weak) UIView *tableMaskView;
/** tableView*/
@property(nonatomic,weak) IBOutlet UITableView *tableView;

/** 将要dismiss*/
@property (assign,nonatomic) BOOL willDismiss;

@end

@implementation EASearchController
- (UIView *)maskView
{
    if (!_maskView) {
        
        if (self.effectWindow) {
            
            
            if (![self.delegate respondsToSelector:@selector(searchMaskView)]) {
                return  nil;
            }
            
            UIView *maskView = [self.delegate searchMaskView];
            [self.effectWindow addSubview:maskView];
            
            [maskView autoAlignAxisToSuperviewAxis:ALAxisVertical];
            [maskView autoSetDimension:ALDimensionWidth toSize:self.effectWindow.frame.size.width];
            [maskView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
            [maskView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
            
            _maskView = maskView;
        }
    }
    
    return _maskView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 解决tableview无法正常显示的问题
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self setupView];
}

- (void)setupView
{
    
    // registerCell
    if ([self.delegate respondsToSelector:@selector(searchTableViewRegisterCellNib:)]) {
        [self.delegate searchTableViewRegisterCellNib:self.tableView];
    }
    
    if ([self.delegate respondsToSelector:@selector(searchTableViewRegisterCellClass:)]) {
        [self.delegate searchTableViewRegisterCellClass:self.tableView];
    }
    
    
    // tablemaskView
    if (![self.delegate respondsToSelector:@selector(searchTableMaskView)]) {
        return;
    }
    
    UIView *tableMask = [self.delegate searchTableMaskView];
    [self.view addSubview:tableMask];
    
    [tableMask autoPinEdgesToSuperviewEdges];
    
    self.tableMaskView = tableMask;

    
   
    
    
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.dataSource dequeueReusableCell:tableView indexPath:indexPath];
    return cell;
}




#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self dismissViewControllerAnimated:YES completion:nil];
    

}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    
    // UISearchController将要消失，再也无需工作
    if (self.willDismiss) {
        return;
    }
    
    if (searchController.searchBar.text.length) {
        [_maskView removeFromSuperview];
    }else{
        [self maskView];
    }

    
    if ([self.dataSource respondsToSelector:@selector(searchUpdateSearchText:)]) {
        self.models =   [self.dataSource searchUpdateSearchText:searchController.searchBar.text];
        self.tableMaskView.hidden =  self.models.count ? YES:NO;
        [self.tableView reloadData];
    }
    
    //    [self.tableView reloadData];
    NSLog(@"更新了searchResults");
}


#pragma mark - UISearchControllerDelegate
// 点击搜索框自动唤醒
- (void)willPresentSearchController:(UISearchController *)searchController
{
    
    
    if ([self.delegate respondsToSelector:@selector(willPresentSearchController:)]) {
        
        [self.delegate willPresentSearchController:searchController];
    }
    
    [self presentSearchController:searchController];
    
}

// 消失
- (void)willDismissSearchController:(UISearchController *)searchController
{
    
    if ([self.delegate respondsToSelector:@selector(willDismissSearchController:)]) {
        
        [self.delegate willDismissSearchController:searchController];
    }
    
    if (self.hideTabBarWhenPresentation) {
        self.tabBar.hidden = NO;
    }
    
    [_maskView removeFromSuperview];
    self.willDismiss = YES;

    NSLog(@"将要消失");
}


// 手动唤醒
- (void)presentSearchController:(UISearchController *)searchController
{
    if (self.hideTabBarWhenPresentation) {
        self.tabBar.hidden = YES;

    }
    
    [self getEffectsWindow];
    [self maskView];

}


- (void)getEffectsWindow
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    
    Class EffectWindow = NSClassFromString(@"UITextEffectsWindow");
    
    for (UIWindow *w  in windows) {
        NSLog(@"window:%@",w);
        if ([w isKindOfClass:EffectWindow]) {
            self.effectWindow = w;
            return;
        }
    }
    
    
}



#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar;                     // called when text starts editing
{
    NSLog(@"开始输入搜索文字");
    
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
//    [searchBar removeFromSuperview];
    
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar;                       // called when text ends editing
{
    NSLog(@"结束输入搜索文字");
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
{
    NSLog(@"文字变化");
    
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"点击取消按钮");
   
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"点击按钮");
    
}

@end

