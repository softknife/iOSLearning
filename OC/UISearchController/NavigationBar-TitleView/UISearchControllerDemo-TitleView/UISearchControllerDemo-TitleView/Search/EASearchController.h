//
//  EASaleSearchController.h
//  EAppleNFB
//
//  Created by apple on 2017/5/15.
//  Copyright © 2017年 Eapple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EASearchMaskView.h"

#import "EASearchControllerProtocol.h"


@interface EASearchController : UIViewController<
UISearchResultsUpdating,
UISearchControllerDelegate, //, // 监听present/dismiss
UISearchBarDelegate> // searchBar动作



/** 是否隐藏TabBar*/
@property (assign,nonatomic) BOOL hideTabBarWhenPresentation;

/** TabBar*/
@property(nonatomic,weak)UITabBar *tabBar;

/** 数据源*/
@property(nonatomic,weak)id<SearchControllerDataSource> dataSource;

/** 代理*/
@property(nonatomic,weak)id<SearchControllerDelegate> delegate;
@end
