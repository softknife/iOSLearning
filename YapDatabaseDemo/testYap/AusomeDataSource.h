//
//  AusomeDataSource.h
//  testYap
//
//  Created by hjp on 16/10/28.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AusomeDataSourceDelegate <NSObject>

@required
- (UITableViewCell *)tableView:(UITableView *)tableView cellForKey:(NSString *)key;
- (void)tableviewSectionChanges:(NSArray *)sectionChanges rowChanges:(NSArray *)rowChanges;

@end
@interface AusomeDataSource : NSObject<UITableViewDataSource>

/** 模型数组*/
@property (nonatomic , weak, readonly) NSDictionary *ausomeStore;
/** delegate*/
@property (nonatomic , weak) id<AusomeDataSourceDelegate> delegate;


#pragma mark - 测试
- (void)randomModifySomeInfo;
- (void)modifyRange;
@end
