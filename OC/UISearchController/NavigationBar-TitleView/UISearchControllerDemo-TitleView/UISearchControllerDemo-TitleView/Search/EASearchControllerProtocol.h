//
//  EASearchControllerProtocol.h
//  EAppleNFB
//
//  Created by apple on 2017/5/17.
//  Copyright © 2017年 Eapple. All rights reserved.
//

#ifndef EASearchControllerProtocol_h
#define EASearchControllerProtocol_h

#import <UIKit/UIKit.h>

@protocol SearchControllerDataSource <NSObject>

- (NSArray *)searchUpdateSearchText:(NSString *)text;
- (UITableViewCell *)dequeueReusableCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;


@end

@protocol SearchControllerDelegate <NSObject>

- (UIView *)searchMaskView;
- (UIView *)searchTableMaskView;


@optional

- (void)searchTableViewRegisterCellNib:(UITableView *)tableView;
- (void)searchTableViewRegisterCellClass:(UITableView *)tableView;

- (void)searchTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

// 点击搜索框自动唤醒
- (void)willPresentSearchController:(UISearchController *)searchController;

// 消失
- (void)willDismissSearchController:(UISearchController *)searchController;

@end

#endif /* EASearchControllerProtocol_h */
