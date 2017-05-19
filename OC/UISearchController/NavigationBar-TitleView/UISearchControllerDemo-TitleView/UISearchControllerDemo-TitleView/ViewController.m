//
//  ViewController.m
//  UISearchControllerDemo-TitleView
//
//  Created by 黄继平 on 2017/5/19.
//  Copyright © 2017年 Gloria. All rights reserved.
//

#import "ViewController.h"
#import "EASearchController.h"

@interface ViewController ()
<SearchControllerDelegate,SearchControllerDataSource>

/** searchController*/
@property (nonatomic , strong) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 搜索框
    [self setupSearchController];

}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    /*
     Determines which parent view controller's view should be presented over for presentations of type
     UIModalPresentationCurrentContext.  If no ancestor view controller has this flag set, then the presenter
     will be the root view controller.
     
     设置definesPresentationContext为true，我们保证在UISearchController在激活状态下用户push到下一个view controller之后search bar不会仍留在界面上。
     */
    self.definesPresentationContext = YES;
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    self.definesPresentationContext = NO;
    
}

- (void)setupSearchController
{
    // Pass nil if you wish to display search results in the same view that you are searching.
    // 传nil来初始化UISearchController，意思是我们告诉search controller我们会用相同的view来展示我们的搜索结果，如果我们想要指定一个不同的view controller，那就会被替代为显示搜索结果。
    EASearchController *search = [EASearchController new];
    
    search.hideTabBarWhenPresentation = YES;
    search.tabBar = self.tabBarController.tabBar;
    search.dataSource = self;
    search.delegate = self;
    
    UISearchController *searchVc = [[UISearchController alloc] initWithSearchResultsController:search];
    
    UISearchBar *searchBar = searchVc.searchBar;
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    // default is YES, and has the same behavior as obscuresBackgroundDuringPresentation.
    // default is YES
    searchVc.hidesNavigationBarDuringPresentation = NO; // 是否隐藏导航条
    searchVc.searchResultsUpdater = search;
    searchVc.delegate = search;
    searchBar.delegate = search;
    searchBar.placeholder = @"请输入需要查询的对象";
    
    self.searchController = searchVc;
    
    
    self.navigationItem.titleView = searchBar;
    CGRect frame = searchBar.frame;
    frame.size.height = 27.67;
    
    searchBar.frame = frame;
    

}

#pragma mark - SearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController
{
    // rightButton
    self.navigationItem.rightBarButtonItems = nil;
    
    // leftButton
    self.navigationItem.leftBarButtonItems = nil;
    
}
- (void)willDismissSearchController:(UISearchController *)searchController
{
    // rightButton
    
}

- (void)searchTableViewRegisterCellClass:(UITableView *)tableView
{
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"buySearchCell"];
}

- (UIView *)searchTableMaskView
{
    UIView *view = [EASearchMaskView maskView];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (UIView *)searchMaskView
{
    return [EASearchMaskView maskView];
    
}

- (void)searchTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"点击了%zd",indexPath.row);
}

#pragma mark -SearchControllerDataSource

- (NSArray *)searchUpdateSearchText:(NSString *)text
{
    return nil;
}


- (UITableViewCell *)dequeueReusableCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"buySearchCell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"cell测试，%zd",indexPath.row];
    return  cell;
}




@end
