//
//  AusomeDataSource.m
//  testYap
//
//  Created by hjp on 16/10/28.
//  Copyright © 2016年 hengqian. All rights reserved.
//

#import "AusomeDataSource.h"
#import "HQDBHelper+Ausome.h"
#import "Manager.h"
#import "SessionTable.h"
#import "MessageTable.h"
#import "Ausome.h"
#import <YapDatabaseView.h>
#import <YapDatabaseSecondaryIndex.h>

@interface AusomeDataSource ()
/** 模型数组*/
@property (nonatomic , strong) YapDatabaseViewMappings *mapping;
/** 模型数组*/
@property (nonatomic , strong) NSMutableDictionary *ausomeDict;

/** uiConnection*/
@property (nonatomic , strong) YapDatabaseConnection *connection;

@end
@implementation AusomeDataSource

- (instancetype)init
{
    if (self = [super init]) {
        
        self.connection = [HQDBHelper creatReadOnlyConnection];
        
        [HQDBHelper pre_GroupSortDataSourceForAusomeView:@"AusomeDataSource"];
        [self configDataMaping];
        
        self.ausomeDict = [NSMutableDictionary new];
        _ausomeStore = self.ausomeDict;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YapDatabaseModifiedNotification object:[HQDBHelper helper].yapDB];
}

// 配置mapping
- (void)configDataMaping
{
    [self.connection beginLongLivedReadTransaction];
    
    YapDatabaseViewMappings *maping = [[YapDatabaseViewMappings alloc] initWithGroups:@[NSStringFromClass([SessionTable class])] view:@"AusomeDataSource"];
    
    // 设置自动更新无效sections
   // [maping setIsDynamicSection:YES forGroup:NSStringFromClass([SessionTable class])];
    
    // 设置limit
    YapDatabaseViewRangeOptions *range = [YapDatabaseViewRangeOptions fixedRangeWithLength:5 offset:0 from:YapDatabaseViewBeginning];
    [maping setRangeOptions:range forGroup:NSStringFromClass([SessionTable class])];
    
    self.mapping = maping;
    
    
    [self.connection readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        
        [maping updateWithTransaction:transaction];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(databaseModified:) name:YapDatabaseModifiedNotification object:[HQDBHelper helper].yapDB];
    
    
}

// 监听变化
- (void)databaseModified:(NSNotification *)note
{
    NSArray *commitArray = [self.connection beginLongLivedReadTransaction];
    if (commitArray.count == 0) {
        
        return;
    }
    
    NSArray *sectionChanges = nil;
    NSArray *rowChanges = nil;
    
    [[self.connection ext:NSStringFromClass([self class])] getSectionChanges:&sectionChanges
                                                                                    rowChanges:&rowChanges
                                                                              forNotifications:commitArray
                                                                                  withMappings:self.mapping];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(tableviewSectionChanges:rowChanges:)]) {
            [self.delegate tableviewSectionChanges:sectionChanges rowChanges:rowChanges];
        }
    });
    
   
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.mapping.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.mapping numberOfItemsInSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    __block SessionTable *sessionTable = nil;
    [self.connection readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        YapDatabaseViewTransaction *viewTransaction =  [transaction ext:@"AusomeDataSource"];
        sessionTable = [viewTransaction objectAtIndex:indexPath.row inGroup:NSStringFromClass([SessionTable class])];
    }];
    
    
    [self assemblyViewModelWithSessionTable:sessionTable];

    
    UITableViewCell *cell = [self.delegate tableView:tableView cellForKey:sessionTable.sessionId];

    NSAssert(cell != nil, @"cell加载失败");
    
    return cell;
}


- (void)assemblyViewModelWithSessionTable:(SessionTable *)sessionTable
{
    Ausome *ausome = self.ausomeStore[sessionTable.sessionId];
    if (ausome == nil) {
        ausome = [Ausome ausome];
        self.ausomeDict[sessionTable.sessionId] = ausome;

    }
    
    ausome.session = sessionTable;

    
    
    __block MessageTable *messageTable = nil;
    [self.connection readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
        
        YapDatabaseQuery *query = [YapDatabaseQuery queryWithFormat:@"WHERE UPPER(messageId) = UPPER(?)",sessionTable.lastMsgId];
        
        YapDatabaseSecondaryIndexTransaction *secIndexTransa = (YapDatabaseSecondaryIndexTransaction *)[transaction ext:NSStringFromClass([MessageTable class])] ;
        
        [secIndexTransa enumerateRowsMatchingQuery:query usingBlock:^(NSString * _Nonnull collection, NSString * _Nonnull key, id  _Nonnull object, id  _Nonnull metadata, BOOL * _Nonnull stop) {
            messageTable = object;
            
        }];

    }];
    
    ausome.lastMessage = messageTable;
    
    
}

#pragma mark - 测试
- (void)modifyRange
{
   YapDatabaseViewRangeOptions *range = [self.mapping rangeOptionsForGroup:NSStringFromClass([SessionTable class])];
    
    NSInteger length = range.length +  2;
    YapDatabaseViewRangeOptions *newRange = [YapDatabaseViewRangeOptions fixedRangeWithLength:length offset:0 from:YapDatabaseViewBeginning];
    [self.mapping setRangeOptions:newRange forGroup:NSStringFromClass([SessionTable class])];
    
}
- (void)randomModifySomeInfo
{
 
    
    
    BOOL random = arc4random_uniform(20)%2;
    
    if (random == 0) {
        
        [self.connection readWithBlock:^(YapDatabaseReadTransaction * _Nonnull transaction) {
            
            YapDatabaseViewTransaction *viewTransaction =  [transaction ext:@"AusomeDataSource"];
            
            NSInteger rowCount = [self.mapping numberOfItemsInGroup:NSStringFromClass([SessionTable class])];
            
            SessionTable *sessionTable = [viewTransaction objectAtIndex:arc4random_uniform((int32_t)(rowCount - 1)) inGroup:NSStringFromClass([SessionTable class])];
            sessionTable.setTopTime = [Manager getCurrentSystemDateMillisecond];
            sessionTable.unreadTotal = arc4random_uniform(10000);
            
            [[HQDBHelper creatRWConnection] readWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
                
                if (arc4random_uniform(10)%2) { // 更新
                    [transaction setObject:sessionTable forKey:sessionTable.sessionId inCollection:NSStringFromClass([SessionTable class])];
                    
                }else{ // 删除
                    
                    if (arc4random_uniform(10)%2) {
                        [transaction setObject:nil forKey:sessionTable.sessionId inCollection:NSStringFromClass([SessionTable class])];

                    }else{ // 换lastmessage
                        MessageTable *messageTable = [[MessageTable alloc] init];
                        messageTable.sessionId = sessionTable.sessionId;
                        messageTable.messageId = [NSString stringWithFormat:@"%zd",[Manager getCurrentSystemDateMillisecond]];
                        messageTable.content = [NSString stringWithFormat:@"新消息%zd",arc4random_uniform(100)];
                        messageTable.creatTime = [Manager getCurrentSystemDateMillisecond];
                        
                        [transaction setObject:messageTable forKey:messageTable.messageId inCollection:NSStringFromClass([MessageTable class])];
                
                        sessionTable.lastMsgId = messageTable.messageId;
                        sessionTable.setTopTime = [Manager getCurrentSystemDateMillisecond];
                        [transaction setObject:sessionTable forKey:sessionTable.sessionId inCollection:NSStringFromClass([SessionTable class])];
                    }
                    
                    
                
                }
            }];
        }];
        
    }else{
        [[HQDBHelper creatRWConnection] readWriteWithBlock:^(YapDatabaseReadWriteTransaction * _Nonnull transaction) {
            
            
            
            
            
            // 添加
            SessionTable *sessionTable = [[SessionTable alloc] init];
            sessionTable.sessionId = [NSString stringWithFormat:@"1105621344625%d%d%d%d%d",arc4random_uniform(10),arc4random_uniform(10),arc4random_uniform(10),arc4random_uniform(10),arc4random_uniform(10)];
            sessionTable.sessionName = [NSString stringWithFormat:@"张三%d",arc4random_uniform(500)];
            sessionTable.setTopTime = [Manager getCurrentSystemDateMillisecond];
            
            
            [transaction setObject:sessionTable forKey:sessionTable.sessionId inCollection:NSStringFromClass([SessionTable class])];
            
            
            
        }];
    }

}

@end
