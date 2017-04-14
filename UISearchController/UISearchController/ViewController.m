//
//  ViewController.m
//  UISearchController
//
//  Created by hjp on 17/4/14.
//  Copyright © 2017年 eric. All rights reserved.
//

#import "ViewController.h"
#import "SearchModel.h"


@interface ViewController ()<
UISearchResultsUpdating, // 更新数据
UISearchControllerDelegate, // 监听present/dismiss
UISearchBarDelegate> // 二次查询
/** searchController*/
@property (nonatomic , strong) UISearchController *searchController;

/** searchArray*/
@property (nonatomic , strong) NSMutableArray *searchArray;
/** modelArray*/
@property (nonatomic , strong) NSMutableArray *modelArray;

@end



@implementation ViewController


static NSString *const cellReuseId = @"cellReuseId";

- (NSMutableArray *)searchArray
{
    if (!_searchArray) {
        _searchArray = [NSMutableArray new];
    }
    
    return _searchArray;
}
- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray new];
    }
    
    return _modelArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Pass nil if you wish to display search results in the same view that you are searching.
    // 传nil来初始化UISearchController，意思是我们告诉search controller我们会用相同的view来展示我们的搜索结果，如果我们想要指定一个不同的view controller，那就会被替代为显示搜索结果。
    UISearchController *search = [[UISearchController alloc] initWithSearchResultsController:nil];
    search.searchResultsUpdater = self;
    
    // default is YES, and has the same behavior as obscuresBackgroundDuringPresentation.
    search.dimsBackgroundDuringPresentation = NO; // 搜索时tableView添加半透明的遮盖
    
     // default is YES
    search.hidesNavigationBarDuringPresentation = YES; // 是否隐藏导航条
    
    search.searchBar.frame = CGRectMake(search.searchBar.frame.origin.x,search.searchBar.frame.origin.y,search.searchBar.frame.size.width,44.0);
    
    search.delegate = self;
    search.searchBar.scopeButtonTitles = @[@"诗集",@"历史",@"动画片"];
    search.searchBar.delegate = self;
    self.searchController = search;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    /*
     Determines which parent view controller's view should be presented over for presentations of type
     UIModalPresentationCurrentContext.  If no ancestor view controller has this flag set, then the presenter
     will be the root view controller.
     
     设置definesPresentationContext为true，我们保证在UISearchController在激活状态下用户push到下一个view controller之后search bar不会仍留在界面上。
     */
    self.definesPresentationContext = YES;
    
    [self loadNormalData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.searchController.isActive? self.searchArray.count:self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellReuseId];
    }
    
    SearchModel *model = nil;
    if (self.searchController.isActive) {
        model = self.searchArray[indexPath.row];
    }else{
        model = self.modelArray[indexPath.row];
    }
    
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.hobby;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.searchController.isActive) {
        if ( self.searchController.searchBar.isFirstResponder) {
            [self.searchController.searchBar resignFirstResponder];
        }
    }
}


- (void)loadNormalData
{
    for (int i = 0; i < 8; i++) {
        SearchModel *model = [SearchModel new];
        model.name = [NSString stringWithFormat:@"Eric【%d】",i];
        model.hobby = [NSString stringWithFormat:@"Reading Book 【%d】",i];
        
        [self.modelArray addObject:model];
    }
    
    [self.tableView reloadData];

}


#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if (self.searchArray.count) {
        [self.searchArray removeAllObjects];
    }
    
    for (int i = 0; i < 11; i++) {
        SearchModel *model = [SearchModel new];
        model.name = [NSString stringWithFormat:@"Gloria【%d】",i];
        model.hobby = [NSString stringWithFormat:@"Writing Book 【%d】",i];
        
        [self.searchArray addObject:model];
    }
    
    [self.tableView reloadData];
    
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{

    NSLog(@"点击了第%zd列",selectedScope);
}

#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController
{
//    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,100.0);

}
- (void)didPresentSearchController:(UISearchController *)searchController{

}
- (void)willDismissSearchController:(UISearchController *)searchController
{
    
//    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,20);

}
- (void)didDismissSearchController:(UISearchController *)searchController
{

}

// Called after the search controller's search bar has agreed to begin editing or when 'active' is set to YES. If you choose not to present the controller yourself or do not implement this method, a default presentation is performed on your behalf.
- (void)presentSearchController:(UISearchController *)searchController
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
